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
    no_of_stars_in_billions integer,
    no_of_planets_in_billions integer,
    age_in_billion_years integer,
    description text,
    discovered_by text
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
-- Name: galaxy_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_planets (
    galaxy_planets_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    planet_id integer
);


ALTER TABLE public.galaxy_planets OWNER TO freecodecamp;

--
-- Name: galaxy_planets_galaxy_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_planets_galaxy_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_planets_galaxy_planets_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_planets_galaxy_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_planets_galaxy_planets_id_seq OWNED BY public.galaxy_planets.galaxy_planets_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_miles integer,
    has_atmosphere boolean,
    distance_from_planet numeric(5,1),
    description text,
    discovered_by text,
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
    name character varying(30) NOT NULL,
    no_of_moons integer,
    distance_from_sun_in_million_km numeric(5,1),
    diameter_in_miles integer,
    is_habitable boolean,
    description text,
    discovered_by text,
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
    name character varying(30) NOT NULL,
    age_in_million_years integer,
    no_of_planets integer,
    description text,
    discovered_by text,
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_planets galaxy_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets ALTER COLUMN galaxy_planets_id SET DEFAULT nextval('public.galaxy_planets_galaxy_planets_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100, 100, 14, 'A barred spiral galaxy containing our solar system and billions of other stars and planets.', 'Galileo Galilei');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 1000, 1000, 10, 'A spiral galaxy, the closest major galaxy to the Milky Way, known for its two satellite galaxies.', 'Abd al-Rahman al-Sufi');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy', 40, 40, 13, 'A spiral galaxy, part of the Local Group, located about 3 million light-years from the Milky Way.', 'Giovanni Domenico Cassini');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy', 100, 100, 10, 'A spiral galaxy in the constellation Canes Venatici, interacting with a smaller companion galaxy.', 'Charles Messier');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 800, 800, 13, 'A spiral galaxy located in the constellation Virgo, known for its bright nucleus and large bulge.', 'Pierre Méchain');
INSERT INTO public.galaxy VALUES (6, 'Messier 87 Galaxy', 1000, 1000, 13, 'A massive elliptical galaxy in the Virgo Cluster, famous for its supermassive black hole.', 'Charles Messier');


--
-- Data for Name: galaxy_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_planets VALUES (1, 'Milky Way(Mercury)', 1, 1);
INSERT INTO public.galaxy_planets VALUES (2, 'Milky Way(Venus)', 1, 2);
INSERT INTO public.galaxy_planets VALUES (3, 'Milky Way(Earth)', 1, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 2159, false, 2388.5, 'Earth’s only natural satellite, with craters and maria, supporting no atmosphere.', 'Known since antiquity', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 14, false, 3728.0, 'Mars’ largest moon, with a heavily cratered surface and rapid orbit.', 'Asaph Hall', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 8, false, 1457.6, 'Smaller and more distant than Phobos, it has a smooth, irregular surface.', 'Asaph Hall', 4);
INSERT INTO public.moon VALUES (4, 'IO', 2264, false, 2620.0, 'The most volcanically active moon in the solar system, with sulfuric volcanic plumes.', 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (5, 'Europa', 1940, false, 4140.0, 'Known for its icy surface and potential subsurface ocean that might support life.', 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3273, false, 6650.0, 'The largest moon in the solar system, with a magnetic field and icy surface.', 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 2995, false, 9999.0, 'A heavily cratered moon with a large proportion of ice, likely with an internal ocean.', 'Galileo Galilei', 5);
INSERT INTO public.moon VALUES (8, 'Titan', 3199, true, 7590.0, 'Saturn’s largest moon, with a thick nitrogen-rich atmosphere and lakes of methane.', 'Christiaan Huygens', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 949, false, 1750.0, 'A large icy moon with a faint atmosphere of oxygen and carbon dioxide.', 'Giovanni Domenico Cassini', 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', 914, false, 9999.0, 'Known for its distinct color contrast between its two hemispheres.', 'Giovanni Domenico Cassini', 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 313, false, 1480.0, 'A small icy moon with active geysers ejecting water vapor, suggesting a subsurface ocean.', 'William Herschel', 6);
INSERT INTO public.moon VALUES (12, 'Mimas', 396, false, 1160.0, 'A heavily cratered moon, often called the “Death Star moon” due to its large crater.', 'William Herschel', 6);
INSERT INTO public.moon VALUES (13, 'Titania', 982, false, 2720.0, 'Uranus’ largest moon, with a mix of ice and rock and large canyons.', 'William Herschel', 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 933, false, 2730.0, 'A moon with an icy surface and large craters, and some evidence of past geological activity.', 'William Herschel', 7);
INSERT INTO public.moon VALUES (15, 'Miranda', 235, false, 1790.0, 'A small moon with extreme geological features, including large canyons and cliffs.', 'Gerard Kuiper', 7);
INSERT INTO public.moon VALUES (16, 'Ariel', 777, false, 1160.0, 'A moon with a surface of mostly ice and some evidence of past tectonic activity.', 'William Herschel', 7);
INSERT INTO public.moon VALUES (17, 'Umbriel', 502, false, 2670.0, 'One of the darkest moons of Uranus, with a heavily cratered surface.', 'William Herschel', 7);
INSERT INTO public.moon VALUES (18, 'Triton', 1680, true, 2200.0, 'Neptune’s largest moon, with a retrograde orbit and geysers emitting nitrogen.', 'British astronomers', 8);
INSERT INTO public.moon VALUES (19, 'Proteus', 260, false, 9999.0, 'A large irregular moon with a heavily cratered surface.', 'Voyager 2', 8);
INSERT INTO public.moon VALUES (20, 'Nereid', 170, false, 9999.0, 'An eccentric moon with a highly elliptical orbit around Neptune.', 'Gerard Kuiper', 8);
INSERT INTO public.moon VALUES (21, 'Charon', 746, false, 1220.0, 'Pluto’s largest moon, with a surface of water ice and a mutual tidal lock with Pluto.', 'James Christy', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0, 57.9, 3032, false, 'Mercury is the closest planet to the Sun, with extreme temperature variations.', 'Ancient Civilizations', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 0, 108.2, 7520, false, 'Venus is a hot, rocky planet with thick clouds and surface temperatures hot enough to melt lead.', 'Ancient Civilizations', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 149.6, 7918, true, 'Earth is the only known planet to support life, with a diverse ecosystem and abundant water.', 'Ancient Greece', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 2, 227.9, 4212, false, 'Mars is the fourth planet from the Sun, with a cold, desert-like surface and signs of past water.', 'Ancient Greece', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 79, 778.3, 88846, false, 'Jupiter is a gas giant, known for its Great Red Spot and massive size, the largest planet in our solar system.', 'Ancient Greece', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 82, 1429.4, 74900, false, 'Saturn is a gas giant with iconic rings, primarily composed of ice and rock particles.', 'Ancient Civilizations', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 27, 2870.7, 31518, false, 'Uranus is an ice giant with a tilted axis, causing extreme seasons and a distinct blue-green color.', 'William Herschel', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 14, 4498.3, 30598, false, 'Neptune is an ice giant with strong winds and storms, the farthest planet from the Sun in our solar system.', 'Johann Galle', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 5874.0, 1474, false, 'A dwarf planet with a thin atmosphere and icy surface, once considered the 9th planet.', 'Clyde Tombaugh', 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 0, 4130.7, 590, false, 'The largest object in the asteroid belt, with a mix of water-ice and rock.', 'Giuseppe Piazzi', 1);
INSERT INTO public.planet VALUES (11, 'Eris', 1, 1012.0, 1445, false, 'A distant dwarf planet with a highly elliptical orbit and extreme temperatures.', 'Mike Brown', 1);
INSERT INTO public.planet VALUES (12, 'Haumea', 2, 6452.0, 1232, false, 'A rapidly rotating dwarf planet with a unique elongated shape.', 'Mike Brown', 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 8, 'The Sun is the central star of the solar system, providing light and heat.', 'Ancient civilizations', 1);
INSERT INTO public.star VALUES (3, 'Alpheratz', 500, 1, 'Alpheratz is the brightest star in the Andromeda galaxy, part of the Pegasus constellation.', 'Ancient civilizations', 2);
INSERT INTO public.star VALUES (5, 'B star', 100, 2, 'A prominent star in the Triangulum galaxy, a young, massive star exhibiting high luminosity.', 'Modern astronomy', 3);
INSERT INTO public.star VALUES (7, 'Star A', 200, 3, 'A massive, bright star located near the center of the Whirlpool galaxy, known for its rapid stellar evolution.', 'William Parsons', 4);
INSERT INTO public.star VALUES (9, 'Star A', 250, 5, 'A bright giant star located in the Sombrero galaxy, known for its prominent position in the galaxy’s halo.', 'Wilhelm Tempel', 5);
INSERT INTO public.star VALUES (11, 'Star A', 800, 8, 'A massive red giant star, part of the dense stellar population in M87’s elliptical structure.', 'Charles Messier', 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_planets_galaxy_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_planets_galaxy_planets_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_planets galaxy_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_name_key UNIQUE (name);


--
-- Name: galaxy_planets galaxy_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_planets
    ADD CONSTRAINT galaxy_planets_pkey PRIMARY KEY (galaxy_planets_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


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

