--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    secret_number integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 3, 564, 22);
INSERT INTO public.games VALUES (2, 4, 982, 983);
INSERT INTO public.games VALUES (3, 4, 166, 167);
INSERT INTO public.games VALUES (4, 5, 917, 918);
INSERT INTO public.games VALUES (5, 5, 915, 916);
INSERT INTO public.games VALUES (6, 4, 478, 481);
INSERT INTO public.games VALUES (7, 4, 98, 100);
INSERT INTO public.games VALUES (8, 4, 169, 170);
INSERT INTO public.games VALUES (9, 3, 83, 10);
INSERT INTO public.games VALUES (10, 6, 632, 633);
INSERT INTO public.games VALUES (11, 6, 345, 346);
INSERT INTO public.games VALUES (12, 7, 988, 989);
INSERT INTO public.games VALUES (13, 7, 140, 141);
INSERT INTO public.games VALUES (14, 6, 309, 312);
INSERT INTO public.games VALUES (15, 6, 532, 534);
INSERT INTO public.games VALUES (16, 6, 795, 796);
INSERT INTO public.games VALUES (17, 8, 208, 209);
INSERT INTO public.games VALUES (18, 8, 595, 596);
INSERT INTO public.games VALUES (19, 9, 788, 789);
INSERT INTO public.games VALUES (20, 9, 587, 588);
INSERT INTO public.games VALUES (21, 8, 145, 148);
INSERT INTO public.games VALUES (22, 8, 949, 951);
INSERT INTO public.games VALUES (23, 8, 245, 246);
INSERT INTO public.games VALUES (24, 10, 745, 746);
INSERT INTO public.games VALUES (25, 10, 837, 838);
INSERT INTO public.games VALUES (26, 11, 269, 270);
INSERT INTO public.games VALUES (27, 11, 625, 626);
INSERT INTO public.games VALUES (28, 10, 337, 340);
INSERT INTO public.games VALUES (29, 10, 979, 981);
INSERT INTO public.games VALUES (30, 10, 963, 964);
INSERT INTO public.games VALUES (31, 3, 460, 8);
INSERT INTO public.games VALUES (32, 12, 571, 572);
INSERT INTO public.games VALUES (33, 12, 165, 166);
INSERT INTO public.games VALUES (34, 13, 466, 467);
INSERT INTO public.games VALUES (35, 13, 316, 317);
INSERT INTO public.games VALUES (36, 12, 871, 874);
INSERT INTO public.games VALUES (37, 12, 996, 998);
INSERT INTO public.games VALUES (38, 12, 105, 106);
INSERT INTO public.games VALUES (39, 14, 946, 947);
INSERT INTO public.games VALUES (40, 14, 447, 448);
INSERT INTO public.games VALUES (41, 15, 439, 440);
INSERT INTO public.games VALUES (42, 15, 577, 578);
INSERT INTO public.games VALUES (43, 14, 737, 740);
INSERT INTO public.games VALUES (44, 14, 936, 938);
INSERT INTO public.games VALUES (45, 14, 364, 365);
INSERT INTO public.games VALUES (46, 16, 319, 320);
INSERT INTO public.games VALUES (47, 16, 79, 80);
INSERT INTO public.games VALUES (48, 17, 162, 163);
INSERT INTO public.games VALUES (49, 17, 854, 855);
INSERT INTO public.games VALUES (50, 16, 481, 484);
INSERT INTO public.games VALUES (51, 16, 945, 947);
INSERT INTO public.games VALUES (52, 16, 852, 853);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1740725346540', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1740725346539', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1740725583525', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1740725583524', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1740725621884', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1740725621883', 0, NULL);
INSERT INTO public.users VALUES (8, 'user_1740725727262', 0, NULL);
INSERT INTO public.users VALUES (9, 'user_1740725727261', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1740725761645', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1740725761644', 0, NULL);
INSERT INTO public.users VALUES (12, 'user_1740725880175', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1740725880174', 0, NULL);
INSERT INTO public.users VALUES (14, 'user_1740725902950', 0, NULL);
INSERT INTO public.users VALUES (15, 'user_1740725902949', 0, NULL);
INSERT INTO public.users VALUES (16, 'user_1740725911991', 0, NULL);
INSERT INTO public.users VALUES (17, 'user_1740725911990', 0, NULL);
INSERT INTO public.users VALUES (18, 'user_1740726009977', 0, NULL);
INSERT INTO public.users VALUES (19, 'user_1740726009976', 0, NULL);
INSERT INTO public.users VALUES (20, 'user_1740726051068', 0, NULL);
INSERT INTO public.users VALUES (21, 'user_1740726051067', 0, NULL);
INSERT INTO public.users VALUES (22, 'user_1740726112162', 0, NULL);
INSERT INTO public.users VALUES (23, 'user_1740726112161', 0, NULL);
INSERT INTO public.users VALUES (24, 'user_1740726155143', 0, NULL);
INSERT INTO public.users VALUES (25, 'user_1740726155142', 0, NULL);
INSERT INTO public.users VALUES (26, 'user_1740726158638', 0, NULL);
INSERT INTO public.users VALUES (27, 'user_1740726158637', 0, NULL);
INSERT INTO public.users VALUES (29, 'user_1740727227980', 2, 505);
INSERT INTO public.users VALUES (28, 'user_1740727227981', 5, 514);
INSERT INTO public.users VALUES (43, 'user_1740727521505', 2, 320);
INSERT INTO public.users VALUES (3, 'asd', 3, 10);
INSERT INTO public.users VALUES (42, 'user_1740727521506', 5, 213);
INSERT INTO public.users VALUES (31, 'user_1740727439488', 2, 208);
INSERT INTO public.users VALUES (30, 'user_1740727439489', 5, 268);
INSERT INTO public.users VALUES (45, 'user_1740727577876', 2, 372);
INSERT INTO public.users VALUES (33, 'user_1740727457793', 2, 181);
INSERT INTO public.users VALUES (32, 'user_1740727457794', 5, 49);
INSERT INTO public.users VALUES (44, 'user_1740727577877', 5, 156);
INSERT INTO public.users VALUES (35, 'user_1740727462024', 2, 378);
INSERT INTO public.users VALUES (34, 'user_1740727462025', 5, 122);
INSERT INTO public.users VALUES (47, 'user_1740727582338', 2, 423);
INSERT INTO public.users VALUES (37, 'user_1740727474481', 2, 574);
INSERT INTO public.users VALUES (46, 'user_1740727582339', 5, 477);
INSERT INTO public.users VALUES (36, 'user_1740727474482', 5, 221);
INSERT INTO public.users VALUES (39, 'user_1740727482077', 2, 407);
INSERT INTO public.users VALUES (38, 'user_1740727482078', 5, 190);
INSERT INTO public.users VALUES (49, 'user_1740727639553', 2, 271);
INSERT INTO public.users VALUES (41, 'user_1740727485079', 2, 128);
INSERT INTO public.users VALUES (48, 'user_1740727639554', 5, 17);
INSERT INTO public.users VALUES (40, 'user_1740727485080', 5, 393);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 52, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 49, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

