--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    type character varying(20),
    age_mill_yrs numeric,
    number_of_stars integer,
    supermassive_blackhole boolean,
    description text,
    distance_relative_earth numeric NOT NULL
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
    name character varying(30),
    type character varying(20),
    has_water boolean,
    is_volcanic boolean,
    has_atmosphere boolean,
    is_tidely_locked boolean,
    diameter_km numeric,
    mass_kg numeric,
    age_mill_yrs numeric,
    description text,
    planet_of character varying(30) NOT NULL
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
    name character varying(30),
    description text,
    has_life boolean,
    is_spherical boolean,
    has_water boolean,
    age_mill_yrs integer,
    planet_types character varying(30),
    no_moons integer NOT NULL,
    solar_system character varying(30)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_to_solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_to_solar_system (
    name character varying(30) NOT NULL,
    star_name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    planet_to_solar_system_id integer NOT NULL
);


ALTER TABLE public.planet_to_solar_system OWNER TO freecodecamp;

--
-- Name: planet_to_solar_system_planet_to_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_to_solar_system_planet_to_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_to_solar_system_planet_to_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: planet_to_solar_system_planet_to_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_to_solar_system_planet_to_solar_system_id_seq OWNED BY public.planet_to_solar_system.planet_to_solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30),
    type character varying(20),
    age_mill_yrs integer,
    has_planets boolean,
    description text,
    no_planets integer NOT NULL
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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet_to_solar_system planet_to_solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_to_solar_system ALTER COLUMN planet_to_solar_system_id SET DEFAULT nextval('public.planet_to_solar_system_planet_to_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13500, 400, true, 'home galaxy', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 13500, 500, true, 'Next over', 3.5);
INSERT INTO public.galaxy VALUES (3, 'MAGELLENIC CLOUD', 'Globular', 13500, 40, false, 'A mess', 5.5);
INSERT INTO public.galaxy VALUES (4, 'Kaluai', 'Bar', 12500, 100, false, 'String of stars', 105.5);
INSERT INTO public.galaxy VALUES (5, 'ZEUS', 'Double Spiral', 14500, 1000, true, 'Tidely locked galaxies', 1005.5);
INSERT INTO public.galaxy VALUES (6, 'Pixie', 'Glob', 145, 10, true, 'barely a galaxy', 5.5);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Earth');
INSERT INTO public.moon VALUES (2, 'TITAN', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Jupiter');
INSERT INTO public.moon VALUES (3, 'Phobos', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Mars');
INSERT INTO public.moon VALUES (4, 'Ganymede', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (5, 'Ganymede2', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (6, 'Ganymede3', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (7, 'Ganymede4', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (8, 'Ganymede5', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (9, 'Ganymede6', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (10, 'Ganymed76', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (11, 'Europa', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (12, 'Eros', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Saturn');
INSERT INTO public.moon VALUES (13, 'Anus', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Uranus');
INSERT INTO public.moon VALUES (14, 'Sphincter', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Uranus');
INSERT INTO public.moon VALUES (15, 'Odi', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Uranus');
INSERT INTO public.moon VALUES (16, 'Penelope', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Uranus');
INSERT INTO public.moon VALUES (17, 'Arctus', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Jupiter');
INSERT INTO public.moon VALUES (18, 'Spin', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Jupiter');
INSERT INTO public.moon VALUES (19, 'Quantum', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Jupiter');
INSERT INTO public.moon VALUES (20, 'Felix', 'solid', false, false, false, false, 5000, 50000000, 3.5, 'Rocky', 'Neptune');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Tatooine', 'solid', true, true, true, 5000, 'terresitial desert', 3, 'Rox');
INSERT INTO public.planet VALUES (10, 'Beetlejuice', 'solid', true, true, true, 5000, 'terresitial', 3, 'Betelgeuse');
INSERT INTO public.planet VALUES (11, 'Dog', 'solid', true, true, true, 5000, 'terresitial', 3, 'Sirius');
INSERT INTO public.planet VALUES (12, 'Gaia', 'solid', true, true, true, 5000, 'terresitial', 3, 'Alpha Centauri');
INSERT INTO public.planet VALUES (14, 'Hades', 'solid', true, true, true, 5000, 'terresitial', 3, 'Reguls');
INSERT INTO public.planet VALUES (1, 'Earth', 'Home to Homo Sapiens', true, true, true, 4, 'terrestial', 1, 'Sol');
INSERT INTO public.planet VALUES (2, 'Mercury', 'Nearest to Sun', false, true, false, 4, 'terrestial', 0, 'Sol');
INSERT INTO public.planet VALUES (3, 'Venus', 'Earths Hellish Twin', false, true, false, 4, 'terrestial', 0, 'Sol');
INSERT INTO public.planet VALUES (4, 'Mars', 'The Red planet', true, true, true, 4, 'terrestial', 1, 'Sol');
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Failed Star', false, true, false, 4, 'Gas Giant', 18, 'Sol');
INSERT INTO public.planet VALUES (6, 'Saturn', 'Pretty Rings', false, true, false, 4, 'Gas Giant', 22, 'Sol');
INSERT INTO public.planet VALUES (7, 'Neptune', 'Blue with white clouds', false, true, false, 4, 'Gas Giant', 12, 'Sol');
INSERT INTO public.planet VALUES (8, 'Uranus', 'Also blue', false, true, false, 4, 'Gas Giant', 13, 'Sol');


--
-- Data for Name: planet_to_solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_to_solar_system VALUES ('Earth', 'Sol', 1, 1);
INSERT INTO public.planet_to_solar_system VALUES ('Venus', 'Sol', 3, 2);
INSERT INTO public.planet_to_solar_system VALUES ('Mars', 'Sol', 4, 3);
INSERT INTO public.planet_to_solar_system VALUES ('Jupiter', 'Sol', 5, 4);
INSERT INTO public.planet_to_solar_system VALUES ('Saturn', 'Sol', 6, 5);
INSERT INTO public.planet_to_solar_system VALUES ('Neptune', 'Sol', 7, 6);
INSERT INTO public.planet_to_solar_system VALUES ('Uranus', 'Sol', 8, 7);
INSERT INTO public.planet_to_solar_system VALUES ('Tatooine', 'Rox', 9, 8);
INSERT INTO public.planet_to_solar_system VALUES ('Beetlejuice', 'Betelgeuse', 10, 9);
INSERT INTO public.planet_to_solar_system VALUES ('Dog', 'Sirius', 11, 10);
INSERT INTO public.planet_to_solar_system VALUES ('Gaia', 'Alpha Centauri', 12, 11);
INSERT INTO public.planet_to_solar_system VALUES ('Hades', 'Reguls', 14, 12);
INSERT INTO public.planet_to_solar_system VALUES ('Mercury', 'Sol', 2, 13);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 'main seq type G', 5, true, 'Yellow common type fairly small', 8);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Giant seq type R', 12, true, 'Really big', 12);
INSERT INTO public.star VALUES (3, 'Sirius', 'Giant seq type B', 4, true, 'North star', 4);
INSERT INTO public.star VALUES (4, 'Alpha Centauri', 'Giant seq type G', 10, true, 'closest to Sol', 7);
INSERT INTO public.star VALUES (5, 'Reguls', 'Giant seq type Y', 8, true, 'Binary', 18);
INSERT INTO public.star VALUES (6, 'Reguls II', 'Main seq type W ', 8, true, 'Binary', 18);
INSERT INTO public.star VALUES (7, 'Rox', 'Main seq type G', 8, true, 'Star wars', 5);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 14, true);


--
-- Name: planet_to_solar_system_planet_to_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_to_solar_system_planet_to_solar_system_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id PRIMARY KEY (moon_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: star name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id PRIMARY KEY (planet_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet_to_solar_system planet_name_ss; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_to_solar_system
    ADD CONSTRAINT planet_name_ss UNIQUE (name);


--
-- Name: planet_to_solar_system planet_to_solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_to_solar_system
    ADD CONSTRAINT planet_to_solar_system_pkey PRIMARY KEY (planet_to_solar_system_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id PRIMARY KEY (star_id);


--
-- Name: planet_to_solar_system planet_to_solar_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_to_solar_system
    ADD CONSTRAINT planet_to_solar_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

