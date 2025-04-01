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
    attempts integer,
    secret_number integer
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
    name character varying(22) NOT NULL
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

INSERT INTO public.games VALUES (5, 16, 1, 110);
INSERT INTO public.games VALUES (6, 16, 3, 686);
INSERT INTO public.games VALUES (7, 17, 154, 153);
INSERT INTO public.games VALUES (8, 17, 342, 341);
INSERT INTO public.games VALUES (9, 18, 388, 387);
INSERT INTO public.games VALUES (10, 18, 990, 989);
INSERT INTO public.games VALUES (11, 17, 487, 484);
INSERT INTO public.games VALUES (12, 17, 101, 99);
INSERT INTO public.games VALUES (13, 17, 192, 191);
INSERT INTO public.games VALUES (14, 19, 997, 996);
INSERT INTO public.games VALUES (15, 19, 717, 716);
INSERT INTO public.games VALUES (16, 20, 772, 771);
INSERT INTO public.games VALUES (17, 20, 616, 615);
INSERT INTO public.games VALUES (18, 19, 643, 640);
INSERT INTO public.games VALUES (19, 19, 853, 851);
INSERT INTO public.games VALUES (20, 19, 539, 538);
INSERT INTO public.games VALUES (21, 21, 930, 929);
INSERT INTO public.games VALUES (22, 21, 275, 274);
INSERT INTO public.games VALUES (23, 22, 115, 114);
INSERT INTO public.games VALUES (24, 22, 647, 646);
INSERT INTO public.games VALUES (25, 21, 99, 96);
INSERT INTO public.games VALUES (26, 21, 615, 613);
INSERT INTO public.games VALUES (27, 21, 834, 833);
INSERT INTO public.games VALUES (28, 23, 707, 706);
INSERT INTO public.games VALUES (29, 23, 632, 631);
INSERT INTO public.games VALUES (30, 24, 111, 110);
INSERT INTO public.games VALUES (31, 24, 694, 693);
INSERT INTO public.games VALUES (32, 23, 5, 2);
INSERT INTO public.games VALUES (33, 23, 767, 765);
INSERT INTO public.games VALUES (34, 23, 612, 611);
INSERT INTO public.games VALUES (35, 25, 906, 905);
INSERT INTO public.games VALUES (36, 25, 315, 314);
INSERT INTO public.games VALUES (37, 26, 219, 218);
INSERT INTO public.games VALUES (38, 26, 562, 561);
INSERT INTO public.games VALUES (39, 25, 982, 979);
INSERT INTO public.games VALUES (40, 25, 472, 470);
INSERT INTO public.games VALUES (41, 25, 960, 959);
INSERT INTO public.games VALUES (42, 27, 609, 608);
INSERT INTO public.games VALUES (43, 27, 316, 315);
INSERT INTO public.games VALUES (44, 28, 269, 268);
INSERT INTO public.games VALUES (45, 28, 763, 762);
INSERT INTO public.games VALUES (46, 27, 657, 654);
INSERT INTO public.games VALUES (47, 27, 438, 436);
INSERT INTO public.games VALUES (48, 27, 90, 89);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (16, 'hari');
INSERT INTO public.users VALUES (17, 'user_1743506371786');
INSERT INTO public.users VALUES (18, 'user_1743506371785');
INSERT INTO public.users VALUES (19, 'user_1743506444912');
INSERT INTO public.users VALUES (20, 'user_1743506444911');
INSERT INTO public.users VALUES (21, 'user_1743506512757');
INSERT INTO public.users VALUES (22, 'user_1743506512756');
INSERT INTO public.users VALUES (23, 'user_1743506755476');
INSERT INTO public.users VALUES (24, 'user_1743506755475');
INSERT INTO public.users VALUES (25, 'user_1743506794967');
INSERT INTO public.users VALUES (26, 'user_1743506794966');
INSERT INTO public.users VALUES (27, 'user_1743506845159');
INSERT INTO public.users VALUES (28, 'user_1743506845158');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 48, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 28, true);


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
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

