--
-- PostgreSQL database dump
--

-- Dumped from database version 11.8 (Debian 11.8-1.pgdg90+1)
-- Dumped by pg_dump version 12.8

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

--
-- Name: shares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shares (
    id integer NOT NULL,
    shortener_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.shares OWNER TO postgres;

--
-- Name: shares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shares_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shares_id_seq OWNER TO postgres;

--
-- Name: shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shares_id_seq OWNED BY public.shares.id;


--
-- Name: shortener; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shortener (
    id integer NOT NULL,
    k text NOT NULL,
    v text NOT NULL
);


ALTER TABLE public.shortener OWNER TO postgres;

--
-- Name: shortener_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shortener_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shortener_id_seq OWNER TO postgres;

--
-- Name: shortener_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shortener_id_seq OWNED BY public.shortener.id;


--
-- Name: shares id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shares ALTER COLUMN id SET DEFAULT nextval('public.shares_id_seq'::regclass);


--
-- Name: shortener id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shortener ALTER COLUMN id SET DEFAULT nextval('public.shortener_id_seq'::regclass);


--
-- Data for Name: shares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shares (id, shortener_id, user_id) FROM stdin;
1	1	1
2	1	2
3	2	3
\.


--
-- Data for Name: shortener; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shortener (id, k, v) FROM stdin;
1	http://localhost/my-big-url	http://localhost/s/0/a
2	http://localhost/my-big-url-way-too-long	http://localhost/s/1/a
3	http://localhost/my-big-url-way-fooooooooo	http://localhost/s/2/a
\.


--
-- Name: shares_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shares_id_seq', 3, true);


--
-- Name: shortener_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shortener_id_seq', 3, true);


--
-- Name: shortener shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shortener
    ADD CONSTRAINT shares_pkey PRIMARY KEY (id);


--
-- Name: shares shares_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT shares_pkey1 PRIMARY KEY (id);


--
-- Name: shares_v_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX shares_v_idx ON public.shortener USING btree (v);


--
-- Name: shares shares_shortener_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shares
    ADD CONSTRAINT shares_shortener_id_fkey FOREIGN KEY (shortener_id) REFERENCES public.shortener(id);


--
-- Name: dbz_publication; Type: PUBLICATION; Schema: -; Owner: postgres
--

CREATE PUBLICATION dbz_publication FOR ALL TABLES WITH (publish = 'insert, update, delete, truncate');


ALTER PUBLICATION dbz_publication OWNER TO postgres;

--
-- PostgreSQL database dump complete
--

