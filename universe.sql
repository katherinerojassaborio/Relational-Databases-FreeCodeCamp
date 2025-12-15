--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    description text,
    number_of_stars bigint NOT NULL,
    year_of_discovery character varying(30)
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
-- Name: location; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.location (
    location_id integer NOT NULL,
    name character varying(50) NOT NULL,
    season_of_visibility character varying(50) NOT NULL
);


ALTER TABLE public.location OWNER TO freecodecamp;

--
-- Name: location_id_location_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.location_id_location_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_id_location_seq OWNER TO freecodecamp;

--
-- Name: location_id_location_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.location_id_location_seq OWNED BY public.location.location_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    number_of_discovery integer,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    age_in_millions_of_years numeric(10,2),
    star_id integer NOT NULL,
    has_life boolean NOT NULL
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
    galaxy_id integer NOT NULL,
    location_id integer,
    diameter_in_million_km integer,
    type character varying(50)
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
-- Name: location location_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.location ALTER COLUMN location_id SET DEFAULT nextval('public.location_id_location_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home spiral galaxy, containing the Solar System.', 200000000000, '1610 AC');
INSERT INTO public.galaxy VALUES (2, 'Andromeda M31', 'The closest major galaxy, on a collision course with the Milky Way.', 1000000000000, '~964 AC');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller spiral galaxy in the Local Group, known for star formation.', 40000000000, '~1654 AC');
INSERT INTO public.galaxy VALUES (4, 'Black Eye M64', 'A spiral galaxy with a dark dust band, giving it its name.', 100000000000, '1779 AC');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A smaller, irregular dwarf galaxy orbiting the Milky Way.', 10000000000, '1503 AC');
INSERT INTO public.galaxy VALUES (6, 'Bodes Galaxy M81', 'A grand design spiral galaxy in the constellation Ursa Major.', 250000000000, '1774 AC');


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.location VALUES (1, 'Orion Arm', 'All year');
INSERT INTO public.location VALUES (2, 'Virgo Supercluster', 'Spring');
INSERT INTO public.location VALUES (3, 'Alpha Centauri System', 'Summer');
INSERT INTO public.location VALUES (4, 'Galactic Center', 'Summer');
INSERT INTO public.location VALUES (5, 'Kepler Field', 'Autumn');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 1, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 2, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 2, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 3, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4, true);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 5, false);
INSERT INTO public.moon VALUES (9, 'Titan', 6, 1, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 2, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 3, true);
INSERT INTO public.moon VALUES (12, 'Dione', 6, 4, true);
INSERT INTO public.moon VALUES (13, 'Thetys', 6, 5, true);
INSERT INTO public.moon VALUES (14, 'Enceladus', 6, 6, true);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 5, true);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 3, true);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 1, true);
INSERT INTO public.moon VALUES (18, 'Nereid', 8, 2, false);
INSERT INTO public.moon VALUES (19, 'Moon of Xylos 1', 13, 1, true);
INSERT INTO public.moon VALUES (20, 'Moon of Kryll 1', 14, 1, false);
INSERT INTO public.moon VALUES (21, 'Moon of Krill 2', 14, 2, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4540.00, 1, false);
INSERT INTO public.planet VALUES (2, 'Venus', 4540.00, 1, false);
INSERT INTO public.planet VALUES (3, 'Earth', 4540.00, 1, true);
INSERT INTO public.planet VALUES (4, 'Mars', 4540.00, 1, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4540.00, 1, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 4540.00, 1, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 4540.00, 1, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 4540.00, 1, false);
INSERT INTO public.planet VALUES (9, 'Proxima B', 4850.00, 2, false);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 4000.00, 3, false);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 7000.00, 4, false);
INSERT INTO public.planet VALUES (12, 'HD 40307g', 6500.00, 5, false);
INSERT INTO public.planet VALUES (13, 'Planet Xylos', 2100.00, 6, false);
INSERT INTO public.planet VALUES (14, 'Planet Kryll', 5500.00, 7, true);
INSERT INTO public.planet VALUES (15, 'Planet Solaria', 3300.00, 8, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1, 1392, 'Yellow Dwarf');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 3, 211, 'Red Dwarf');
INSERT INTO public.star VALUES (3, 'Kepler-186', 1, 5, 473, 'Red Dwarf');
INSERT INTO public.star VALUES (4, 'Gliese 581', 1, 1, 406, 'Red Dwarf');
INSERT INTO public.star VALUES (5, 'HD 40307', 1, 2, 891, 'Orange Dwarf');
INSERT INTO public.star VALUES (6, 'Alcyone', 3, 1, 1002, 'Blue Giant');
INSERT INTO public.star VALUES (7, 'Alpheratz', 2, 1, 501, 'Blue-White-Subgiant');
INSERT INTO public.star VALUES (8, 'Deneb', 1, 4, 2800, 'White Supergiant');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: location_id_location_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.location_id_location_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


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
-- Name: location location_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_name_key UNIQUE (name);


--
-- Name: location location_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.location
    ADD CONSTRAINT location_pkey PRIMARY KEY (location_id);


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
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


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
-- Name: star star_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.location(location_id);


--
-- PostgreSQL database dump complete
--

