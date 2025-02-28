#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Get username
echo "Enter your username:"
read USERNAME

# Retrieve user data from the users table
USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username = '$USERNAME'")

if [[ -n "$USER_DATA" ]]; then
  # Returning user
  IFS='|' read -r USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
  
  # If the user hasn't played any games yet, best_game might be NULL or 0
  if [[ -z "$BEST_GAME" || "$GAMES_PLAYED" -eq 0 ]]; then
    BEST_DISPLAY="N/A"
  else
    BEST_DISPLAY=$BEST_GAME
  fi
  
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_DISPLAY guesses."
else
  # New user: insert new record into the users table
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username, games_played) VALUES('$USERNAME', 0)" > /dev/null
  USER_DATA=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username = '$USERNAME'")
  IFS='|' read -r USER_ID GAMES_PLAYED BEST_GAME <<< "$USER_DATA"
fi

# Debug: ensure USER_ID is set
if [[ -z "$USER_ID" ]]; then
  echo "Error: USER_ID is empty."
  exit 1
fi

# Start the game by generating a secret number and initializing guess count
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
GUESS_COUNT=0

echo "Guess the secret number between 1 and 1000:"

# Loop until the correct guess is made
while true; do
  read GUESS
  ((GUESS_COUNT++))
  
  # Validate integer input
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  
  # Give feedback based on guess
  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # If this is the user's first game or if the current game is better than the best recorded game, update best_game
    if [[ -z "$BEST_GAME" || "$BEST_GAME" -eq 0 || $GUESS_COUNT -lt $BEST_GAME ]]; then
      BEST_GAME=$GUESS_COUNT
    fi
    
    # Update user's games played and best game in the users table
    $PSQL "UPDATE users SET games_played = games_played + 1, best_game = $BEST_GAME WHERE user_id = $USER_ID" > /dev/null
    break
  fi
done
