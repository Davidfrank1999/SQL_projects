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
-- Name: descriptions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.descriptions (
    descriptions_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    has_life boolean NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.descriptions OWNER TO freecodecamp;

--
-- Name: descriptions_descriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.descriptions_descriptions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.descriptions_descriptions_id_seq OWNER TO freecodecamp;

--
-- Name: descriptions_descriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.descriptions_descriptions_id_seq OWNED BY public.descriptions.descriptions_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    type character varying,
    size integer,
    age numeric NOT NULL,
    descriptions_id integer
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
    name character varying NOT NULL,
    type character varying,
    size integer,
    mass numeric NOT NULL,
    planet_id integer,
    descriptions_id integer
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
    name character varying NOT NULL,
    type character varying,
    size integer,
    mass numeric NOT NULL,
    has_ring boolean DEFAULT false NOT NULL,
    galaxy_id integer,
    star_id integer,
    descriptions_id integer
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
    name character varying NOT NULL,
    type character varying,
    size integer,
    mass numeric NOT NULL,
    galaxy_id integer,
    descriptions_id integer
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
-- Name: descriptions descriptions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptions ALTER COLUMN descriptions_id SET DEFAULT nextval('public.descriptions_descriptions_id_seq'::regclass);


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
-- Data for Name: descriptions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.descriptions VALUES (1, 'Milky Way Description', 'Description of the Milky Way galaxy', true, 1, NULL, NULL, NULL);
INSERT INTO public.descriptions VALUES (2, 'Andromeda Description', 'Description of the Andromeda galaxy', false, 2, NULL, NULL, NULL);
INSERT INTO public.descriptions VALUES (3, 'Triangulum Description', 'Description of the Triangulum galaxy', false, 3, NULL, NULL, NULL);
INSERT INTO public.descriptions VALUES (4, 'Messier 87 Description', 'Description of the Messier 87 galaxy', false, 4, NULL, NULL, NULL);
INSERT INTO public.descriptions VALUES (5, 'Sun Description', 'Description of the Sun', false, NULL, 1, NULL, NULL);
INSERT INTO public.descriptions VALUES (6, 'Sirius Description', 'Description of the Sirius star', false, NULL, 2, NULL, NULL);
INSERT INTO public.descriptions VALUES (7, 'Earth Description', 'Description of the Earth', true, NULL, NULL, 1, NULL);
INSERT INTO public.descriptions VALUES (8, 'Mars Description', 'Description of Mars', false, NULL, NULL, 2, NULL);
INSERT INTO public.descriptions VALUES (9, 'Luna Description', 'Description of the Moon (Luna)', false, NULL, NULL, NULL, 1);
INSERT INTO public.descriptions VALUES (10, 'Phobos Description', 'Description of Phobos', false, NULL, NULL, NULL, 2);
INSERT INTO public.descriptions VALUES (11, 'Deimos Description', 'Description of Deimos', false, NULL, NULL, NULL, 3);
INSERT INTO public.descriptions VALUES (12, 'Europa Description', 'Description of Europa', false, NULL, NULL, NULL, 4);
INSERT INTO public.descriptions VALUES (13, 'Ganymede Description', 'Description of Ganymede', false, NULL, NULL, NULL, 5);
INSERT INTO public.descriptions VALUES (14, 'Callisto Description', 'Description of Callisto', false, NULL, NULL, NULL, 6);
INSERT INTO public.descriptions VALUES (15, 'Titan Description', 'Description of Titan', false, NULL, NULL, NULL, 7);
INSERT INTO public.descriptions VALUES (16, 'Enceladus Description', 'Description of Enceladus', false, NULL, NULL, NULL, 8);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 80000, 8.2, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 90000, 9.7, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 100000, 13.6, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 120000, 10.1, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 50000, 5.3, 3);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 150000, 12.4, 4);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (9, 'Io', 'Terrestrial', 0, 89300000000000000000000, 4, NULL);
INSERT INTO public.moon VALUES (10, 'Triton', 'Terrestrial', 0, 21400000000000000000000, 7, NULL);
INSERT INTO public.moon VALUES (11, 'Charon', 'Terrestrial', 0, 1520000000000000000000, 9, NULL);
INSERT INTO public.moon VALUES (12, 'Lysithea', 'Irregular', 0, 77000000000000000, 8, NULL);
INSERT INTO public.moon VALUES (13, 'Proteus', 'Irregular', 0, 51000000000000000000, 7, NULL);
INSERT INTO public.moon VALUES (14, 'Nereid', 'Irregular', 0, 31000000000000000000, 8, NULL);
INSERT INTO public.moon VALUES (15, 'Oberon', 'Terrestrial', 0, 3010000000000000000000, 8, NULL);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Terrestrial', 0, 65900000000000000000, 8, NULL);
INSERT INTO public.moon VALUES (17, 'Umbriel', 'Terrestrial', 0, 1270000000000000000000, 8, NULL);
INSERT INTO public.moon VALUES (18, 'Ariel', 'Terrestrial', 0, 1270000000000000000000, 8, NULL);
INSERT INTO public.moon VALUES (19, 'Tethys', 'Terrestrial', 0, 618000000000000000000, 4, NULL);
INSERT INTO public.moon VALUES (20, 'Rhea', 'Terrestrial', 0, 2310000000000000000000, 4, NULL);
INSERT INTO public.moon VALUES (1, 'Luna', 'Terrestrial', 0, 73500000000000000000000, 1, 9);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular', 0, 1080000000000000, 2, 10);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Irregular', 0, 210000000000000, 2, 11);
INSERT INTO public.moon VALUES (4, 'Europa', 'Terrestrial', 0, 48000000000000000000000, 5, 12);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Terrestrial', 0, 148000000000000000000000, 5, 13);
INSERT INTO public.moon VALUES (6, 'Callisto', 'Terrestrial', 0, 108000000000000000000000, 5, 14);
INSERT INTO public.moon VALUES (7, 'Titan', 'Terrestrial', 0, 135000000000000000000000, 4, 15);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Terrestrial', 0, 108000000000000000000, 4, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (5, 'Kepler-442b', 'Super-Earth', 1, 23400000000000000000000000, false, 2, 2, NULL);
INSERT INTO public.planet VALUES (6, 'Kepler-186f', 'Terrestrial', 1, 14000000000000000000000000, false, 2, 2, NULL);
INSERT INTO public.planet VALUES (8, 'Uranus', 'Ice giant', 15, 86800000000000000000000000, false, 1, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Mercury', 'Terrestrial', 0, 328500000000000000000000, false, 1, 1, NULL);
INSERT INTO public.planet VALUES (10, 'Venus', 'Terrestrial', 1, 4867000000000000000000000, false, 1, 1, NULL);
INSERT INTO public.planet VALUES (11, 'HD 189733b', 'Hot Jupiter', 1, 361.884, false, 3, 3, NULL);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 'Hot Jupiter', 2, 569.22, false, 3, 3, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas giant', 318, 1898000000000000000000000000, true, 1, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas giant', 95, 568300000000000000000000000, true, 1, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Neptune', 'Ice giant', 17, 102400000000000000000000000, true, 1, 1, NULL);
INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 1, 5972000000000000000000000, false, 1, 1, 7);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 0, 639000000000000000000000, false, 1, 1, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Alpha Centauri A', 'G-type main-sequence', 1, 2187900000000000000000000000000.0, 1, NULL);
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', 'K-type main-sequence', 1, 1804023000000000000000000000000.000, 1, NULL);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Red supergiant', 1000, 29835000000000000000000000000000, 1, NULL);
INSERT INTO public.star VALUES (6, 'VY Canis Majoris', 'Red hypergiant', 1420, 33813000000000000000000000000000, 1, NULL);
INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 1, 1989000000000000000000000000000, 1, 5);
INSERT INTO public.star VALUES (2, 'Sirius', 'A-type main-sequence', 2, 4017780000000000000000000000000.00, 1, 6);


--
-- Name: descriptions_descriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.descriptions_descriptions_id_seq', 16, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: descriptions descriptions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_name_key UNIQUE (name);


--
-- Name: descriptions descriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_pkey PRIMARY KEY (descriptions_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: descriptions descriptions_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: descriptions descriptions_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: descriptions descriptions_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: descriptions descriptions_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.descriptions
    ADD CONSTRAINT descriptions_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: galaxy galaxy_descriptions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_descriptions_id_fkey FOREIGN KEY (descriptions_id) REFERENCES public.descriptions(descriptions_id);


--
-- Name: moon moon_mdescriptions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_mdescriptions_id_fkey FOREIGN KEY (descriptions_id) REFERENCES public.descriptions(descriptions_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_descriptions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_descriptions_id_fkey FOREIGN KEY (descriptions_id) REFERENCES public.descriptions(descriptions_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_descriptions_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_descriptions_id_fkey FOREIGN KEY (descriptions_id) REFERENCES public.descriptions(descriptions_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

