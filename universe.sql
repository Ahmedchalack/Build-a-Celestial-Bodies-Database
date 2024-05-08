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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_types character varying(30),
    number_galaxy integer,
    description text
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
    name character varying(30) NOT NULL,
    has_life boolean,
    description text,
    distance_from_earth numeric(6,2),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    planet_types character varying(30),
    age_in_millions_of_years integer,
    distance_from_moon numeric(6,2),
    description text,
    is_spherical boolean,
    has_life boolean,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth numeric(6,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_moon (
    star_moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30)
);


ALTER TABLE public.star_moon OWNER TO freecodecamp;

--
-- Name: star_moon_star_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_moon_star_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_moon_star_moon_id_seq OWNER TO freecodecamp;

--
-- Name: star_moon_star_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_moon_star_moon_id_seq OWNED BY public.star_moon.star_moon_id;


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

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_moon star_moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_moon ALTER COLUMN star_moon_id SET DEFAULT nextval('public.star_moon_star_moon_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'voie lactee', 'spirale', 1, 'la plus proche de la terre');
INSERT INTO public.galaxy VALUES (2, 'Antila 2', 'irr', 12, 'decouvert 2018');
INSERT INTO public.galaxy VALUES (3, 'Bouvier II', 'dSph', 20, 'decouvert 2007');
INSERT INTO public.galaxy VALUES (4, 'Segue 1', 'dSph', 23, 'decouvert 2007');
INSERT INTO public.galaxy VALUES (5, 'naine dhercule', 'dSph', 27, 'decouvert 2006');
INSERT INTO public.galaxy VALUES (6, 'poissons II', 'dSph', 180, 'decouvert 2010');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'loup', false, '10000', 12.00, 11);
INSERT INTO public.moon VALUES (2, 'neige', false, '12000', 22.00, 13);
INSERT INTO public.moon VALUES (3, 'tempete', false, '20000', 33.00, 11);
INSERT INTO public.moon VALUES (4, 'rose', false, '23000', 43.00, 11);
INSERT INTO public.moon VALUES (5, 'fraise', false, '27000', 53.00, 16);
INSERT INTO public.moon VALUES (6, 'tonnerre', false, '180000', 63.00, 13);
INSERT INTO public.moon VALUES (7, 'moissons', false, '10000', 13.00, 15);
INSERT INTO public.moon VALUES (8, 'esturgeon', false, '10000', 13.00, 14);
INSERT INTO public.moon VALUES (9, 'froide', false, '10000', 13.00, 20);
INSERT INTO public.moon VALUES (10, 'castor', false, '10000', 13.00, 12);
INSERT INTO public.moon VALUES (11, 'chasseur', false, '10000', 13.00, 16);
INSERT INTO public.moon VALUES (12, 'Charon', false, '10000', 14.00, 13);
INSERT INTO public.moon VALUES (13, 'Char', false, '10000', 14.00, 13);
INSERT INTO public.moon VALUES (14, 'Chon', false, '10000', 14.00, 20);
INSERT INTO public.moon VALUES (15, 'Chien', false, '10000', 14.00, 18);
INSERT INTO public.moon VALUES (16, 'chat', false, '10000', 14.00, 19);
INSERT INTO public.moon VALUES (17, 'ecureil', false, '10000', 14.00, 21);
INSERT INTO public.moon VALUES (18, 'licorne', false, '10000', 14.00, 19);
INSERT INTO public.moon VALUES (19, 'lunaire', false, '10000', 14.00, 13);
INSERT INTO public.moon VALUES (20, 'bateau', false, '10000', 14.00, 22);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (11, 'Mercure', 'assez grande', 10000, 12.00, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (12, 'Vénus', 'moyenne', 12000, 22.00, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (13, 'Terre', 'tres petite', 20000, 33.00, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (14, 'Mars', 'moyenne', 23000, 43.00, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES (15, 'Jupiter', 'petite', 27000, 53.00, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (16, 'Saturne', 'grande', 180000, 63.00, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (17, 'UB313', 'assez grande', 10000, 13.00, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (18, 'Uranus', 'assez grande', 10000, 13.00, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES (19, 'Neptune', 'assez grande', 10000, 13.00, NULL, NULL, NULL, 5);
INSERT INTO public.planet VALUES (20, 'la terre', 'assez grande', 10000, 13.00, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (21, 'ceres', 'assez grande', 10000, 13.00, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES (22, 'Charon', 'assez grande', 10000, 14.00, NULL, NULL, NULL, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'zame', 'assez grande', 100.00, 1);
INSERT INTO public.star VALUES (2, 'magniola', 'moyenne', 120.00, 2);
INSERT INTO public.star VALUES (3, 'Bouver', 'tres petite', 200.00, 3);
INSERT INTO public.star VALUES (4, 'Segea', 'moyenne', 230.00, 4);
INSERT INTO public.star VALUES (5, 'naine', 'petite', 270.00, 5);
INSERT INTO public.star VALUES (6, 'poises', 'grande', 180.00, 6);


--
-- Data for Name: star_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_moon VALUES (1, 'Karta', 'position');
INSERT INTO public.star_moon VALUES (2, 'Folclor', 'function');
INSERT INTO public.star_moon VALUES (3, 'Filgar', 'function');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 22, true);


--
-- Name: star_moon_star_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_moon_star_moon_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star_moon star_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_moon
    ADD CONSTRAINT star_moon_name_key UNIQUE (name);


--
-- Name: star_moon star_moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_moon
    ADD CONSTRAINT star_moon_pkey PRIMARY KEY (star_moon_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

