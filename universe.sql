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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: cadets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cadets (
    cadets_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer,
    delivered_msg_count integer,
    distance_covered numeric,
    identification text
);


ALTER TABLE public.cadets OWNER TO freecodecamp;

--
-- Name: cadets_cadet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cadets_cadet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cadets_cadet_id_seq OWNER TO freecodecamp;

--
-- Name: cadets_cadet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cadets_cadet_id_seq OWNED BY public.cadets.cadets_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer,
    delivered_msg_count integer,
    population numeric,
    description text,
    has_blackhole boolean,
    has_wormhole boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer,
    delivered_msg_count integer,
    population numeric,
    description text,
    has_water boolean,
    has_atmos boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer,
    delivered_msg_count integer,
    population numeric,
    description text,
    has_water boolean,
    has_atmos boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    age integer,
    delivered_msg_count integer,
    population numeric,
    description text,
    has_water boolean,
    has_atmos boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: cadets cadets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cadets ALTER COLUMN cadets_id SET DEFAULT nextval('public.cadets_cadet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cadets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cadets VALUES (1, 'hari', 30, 100, 10000, 'mole');
INSERT INTO public.cadets VALUES (2, 'utta', 30, 100, 10000, 'mole');
INSERT INTO public.cadets VALUES (3, 'jm', 30, 100, 10000, 'scar');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milky way', 1000000, 1000, 10000, 'big galaxy', true, true);
INSERT INTO public.galaxy VALUES (2, 'a galaxy', 1000000, 1000, 10000, 'small galaxy', true, true);
INSERT INTO public.galaxy VALUES (3, 'b galaxy', 1000000, 1000, 10000, 'small b  galaxy', true, true);
INSERT INTO public.galaxy VALUES (4, 'c galaxy', 1000000, 1000, 10000, 'small c  galaxy', true, true);
INSERT INTO public.galaxy VALUES (5, 'd galaxy', 1000000, 1000, 10000, 'small d galaxy', true, true);
INSERT INTO public.galaxy VALUES (6, 'e galaxy', 1000000, 1000, 10000, 'small e galaxy', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'big sun', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (2, 'big moon', 1000000, 1000, 10000, 'big moon', true, true, 2);
INSERT INTO public.moon VALUES (3, 'small moon', 1000000, 1000, 10000, 'small moon', true, true, 3);
INSERT INTO public.moon VALUES (4, 'a moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (5, '5 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (6, '6 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (7, '7 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (8, '8 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (9, '9 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (10, '10 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (11, '11 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (12, '12 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (13, '13 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (14, '14 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (15, '15 moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (16, '16  moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (17, '17  moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (18, '18  moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (19, '19  moon', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.moon VALUES (20, '20  moon', 1000000, 1000, 10000, 'big star', true, true, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'big sun', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.planet VALUES (2, 'big planet', 1000000, 1000, 10000, 'big planet', true, true, 2);
INSERT INTO public.planet VALUES (3, 's planet', 1000000, 1000, 10000, 'big planet', true, true, 3);
INSERT INTO public.planet VALUES (4, 'a planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (5, 'b planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (6, 'c planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (7, 'd planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (8, 'e planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (9, 'f planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (10, 'g planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (11, 'h planet', 1000000, 1000, 10000, 'big planet', true, true, 1);
INSERT INTO public.planet VALUES (12, 'i planet', 1000000, 1000, 10000, 'big planet', true, true, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'big sun', 1000000, 1000, 10000, 'big star', true, true, 1);
INSERT INTO public.star VALUES (2, 'a a star', 1000000, 1000, 10000, 'a a star', true, true, 2);
INSERT INTO public.star VALUES (3, 'b b star', 1000000, 1000, 10000, 'a a star', true, true, 3);
INSERT INTO public.star VALUES (4, 'cstar', 1000000, 1000, 10000, 'c star', true, true, 4);
INSERT INTO public.star VALUES (5, 'dstar', 1000000, 1000, 10000, 'd star', true, true, 5);
INSERT INTO public.star VALUES (6, 'estar', 1000000, 1000, 10000, 'e star', true, true, 6);


--
-- Name: cadets_cadet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cadets_cadet_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: cadets cadets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cadets
    ADD CONSTRAINT cadets_pkey PRIMARY KEY (cadets_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: cadets unique_cadets; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cadets
    ADD CONSTRAINT unique_cadets UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

