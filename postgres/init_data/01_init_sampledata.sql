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

SET search_path TO public;
CREATE EXTENSION IF NOT EXISTS postgis;

CREATE SCHEMA sampledata;

ALTER SCHEMA sampledata OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

CREATE TABLE sampledata.contacts (
    id integer NOT NULL,
    name character varying,
    phone character varying,
    picture character varying
);


ALTER TABLE sampledata.contacts OWNER TO postgres;

CREATE TABLE sampledata.fountain_types (
    id integer NOT NULL,
    type character varying
);


ALTER TABLE sampledata.fountain_types OWNER TO postgres;
CREATE SEQUENCE sampledata.fountain_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sampledata.fountain_types_id_seq OWNER TO postgres;
ALTER TABLE ONLY sampledata.fountain_types ALTER COLUMN id SET DEFAULT nextval('sampledata.fountain_types_id_seq'::regclass);

CREATE TABLE sampledata.fountains (
    id integer NOT NULL,
    name character varying,
    type integer,
    geom geometry(Point, 25832)
);

ALTER TABLE sampledata.fountains OWNER TO postgres;

CREATE SEQUENCE sampledata.fountains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sampledata.fountains_id_seq OWNER TO postgres;

ALTER SEQUENCE sampledata.fountains_id_seq OWNED BY sampledata.fountains.id;

ALTER TABLE ONLY sampledata.fountains ALTER COLUMN id SET DEFAULT nextval('sampledata.fountains_id_seq'::regclass);


CREATE TABLE sampledata.fountains_pictures (
  id integer not null,
  img_path varchar,
  fountain_id integer
);

ALTER TABLE sampledata.fountains_pictures OWNER TO postgres;

CREATE SEQUENCE sampledata.fountains_pictures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sampledata.fountains_pictures_id_seq OWNER TO postgres;
ALTER TABLE ONLY sampledata.fountains_pictures ALTER COLUMN id SET DEFAULT nextval('sampledata.fountains_pictures_id_seq'::regclass);

ALTER TABLE ONLY sampledata.fountains_pictures
    ADD CONSTRAINT fountains_pictures_pk PRIMARY KEY (id);

CREATE TABLE sampledata.fountains_contacts (
    fountain_id integer not null,
    contact_id integer not null
);


ALTER TABLE sampledata.fountains_contacts OWNER TO postgres;

COPY sampledata.contacts (id, name, phone) FROM stdin;
1	Schmidt	123456789
2	Müller	987654321
3	Meyer	123123123
\.

CREATE SEQUENCE sampledata.contacts_id_seq
    AS integer
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sampledata.contacts_id_seq OWNER TO postgres;
ALTER SEQUENCE sampledata.contacts_id_seq OWNED BY sampledata.contacts.id;
ALTER TABLE ONLY sampledata.contacts ALTER COLUMN id SET DEFAULT nextval('sampledata.contacts_id_seq'::regclass);

COPY sampledata.fountain_types (id, type) FROM stdin;
1	Tiefbrunnen
2	Springbrunnen
3	Trinkwasserbrunnen
\.

SELECT setval('sampledata.fountain_types_id_seq', 4, true);

COPY sampledata.fountains (id, "name", "type", geom) FROM stdin;
1	Familienbrunnen	2	SRID=25832;POINT (380999.1989730378 5572403.149487904)
2	Rathausbrunnen	2	SRID=25832;POINT (396653.6140736081 5570011.699951227)
3	Marktbrunnen	1	SRID=25832;POINT (385327.16878197214 5578029.9090590365)
4	Obstbrunnen	2	SRID=25832;POINT (399278.1462526629 5579210.852210084)
5	Dorfplatzbrunnen sehr	1	SRID=25832;POINT (390019.0075363525 5580876.207061745)
6	Stadtparkbrunnen	2	SRID=25832;POINT (389093.82126065413 5579854.937272786)
7	Museumsbrunnen	1	SRID=25832;POINT (395222.82732195844 5569842.271938684)
8	Bürgerbrunnen	2	SRID=25832;POINT (374597.9875794888 5577325.887636361)
9	Kindergartenbrunnen	1	SRID=25832;POINT (380158.1731021226 5580227.046078987)
10	Bahnhofsbrunnen	2	SRID=25832;POINT (394347.16271350184 5583044.660231061)
11	Gartenbrunnen	1	SRID=25832;POINT (393360.738252499 5581283.657076459)
12	Schulbrunnen	2	SRID=25832;POINT (384617.42778339796 5574140.133990586)
13	Brunnenplatz	1	SRID=25832;POINT (376591.3310089735 5580458.1156825)
14	Altstadtbrunnen	2	SRID=25832;POINT (393511.25824485277 5579423.030274738)
15	Heimatbrunnen	1	SRID=25832;POINT (375523.7539598288 5581050.727259877)
16	Kulturbrunnen	2	SRID=25832;POINT (386689.5275841669 5580438.574468259)
17	Theaterbrunnen	1	SRID=25832;POINT (387910.511369352 5578911.008141614)
18	Neubaugebietsbrunnen	2	SRID=25832;POINT (394230.37173487496 5574211.9479884785)
19	Festplatzbrunnen	1	SRID=25832;POINT (381380.1899456337 5570795.018655828)
20	Sportplatzbrunnen	2	SRID=25832;POINT (386310.2239203438 5577735.176452949)
21	Feuerwehrbrunnen	1	SRID=25832;POINT (379008.9142591945 5579148.542386587)
22	Friedhofsbrunnen	2	SRID=25832;POINT (392500.3878882169 5582301.811632965)
23	Kirchbrunnen	1	SRID=25832;POINT (393737.8875965259 5569292.674243493)
24	Alleeplatzbrunnen	2	SRID=25832;POINT (397752.5651737853 5584087.0779308)
25	Sommerbrunnen	1	SRID=25832;POINT (379840.59396832134 5579435.938700776)
26	Winterbrunnen	2	SRID=25832;POINT (375698.9009967001 5583468.403107248)
27	Historischer Brunnen	1	SRID=25832;POINT (375380.11732496996 5572045.113743989)
28	Modellbrunnen	2	SRID=25832;POINT (379991.56041898875 5574958.6772568775)
29	Zierbrunnen	1	SRID=25832;POINT (382153.7291237936 5578425.156590618)
30	Gemeindebrunnen	2	SRID=25832;POINT (395022.2178723159 5574143.20296959)
31	Universitätsbrunnen	1	SRID=25832;POINT (383575.21354524326 5584043.757657366)
32	Technikbrunnen	2	SRID=25832;POINT (388199.64179991727 5582590.190433244)
33	Ingenieurbrunnen	1	SRID=25832;POINT (376413.25076119934 5578238.804342469)
34	Märchenbrunnen	1	SRID=25832;POINT (397142.8102234983 5583854.193010624)
35	Wandererbrunnen	2	SRID=25832;POINT (378682.0952722314 5581489.288943934)
36	Künstlerbrunnen	1	SRID=25832;POINT (393895.34855339455 5575140.692634247)
37	Marktplatzbrunnen	2	SRID=25832;POINT (393493.4638881292 5580695.434113979)
38	Einkaufszentrumbrunnen	1	SRID=25832;POINT (378782.10530846135 5581572.375915501)
39	Spielplatzbrunnen	2	SRID=25832;POINT (390233.6348043104 5581524.632084036)
40	Bibliotheksbrunnen	1	SRID=25832;POINT (389015.6055817882 5571187.863212646)
41	Industriebrunnen	2	SRID=25832;POINT (380167.93571764545 5579440.842328902)
42	Firmenbrunnen	1	SRID=25832;POINT (386105.97865980514 5576857.135894297)
43	Rosenbrunnen	2	SRID=25832;POINT (384292.63612277707 5576756.820146815)
44	Lindenbrunnen	1	SRID=25832;POINT (378933.16456751555 5583254.275536969)
45	Eichenbrunnen	2	SRID=25832;POINT (377378.9516362483 5573137.432744452)
46	Birkenbrunnen	1	SRID=25832;POINT (389274.18737023225 5574737.695301693)
47	Ahornbrunnen	2	SRID=25832;POINT (386172.32396668015 5580918.300090513)
48	Pappelbrunnen	1	SRID=25832;POINT (385932.7520282982 5570290.850986378)
49	Bachbrunnen	2	SRID=25832;POINT (386949.7538090289 5575071.764593213)
50	Quellbrunnen	1	SRID=25832;POINT (378313.1713421386 5581179.740687612)
\.

SELECT setval('sampledata.fountains_id_seq', 51, true);

COPY sampledata.fountains_contacts (fountain_id, contact_id) FROM stdin;
1	1
2	1
1	2
3	3
3	1
\.

ALTER TABLE ONLY sampledata.fountain_types
    ADD CONSTRAINT fountain_types_pk PRIMARY KEY (id);


ALTER TABLE ONLY sampledata.fountains_contacts
    ADD CONSTRAINT fountains_contacts_pk PRIMARY KEY (fountain_id, contact_id);


ALTER TABLE ONLY sampledata.fountains_contacts
    ADD CONSTRAINT fountains_contacts_un UNIQUE (fountain_id, contact_id);


ALTER TABLE ONLY sampledata.contacts
    ADD CONSTRAINT species_pk PRIMARY KEY (id);


ALTER TABLE ONLY sampledata.fountains
    ADD CONSTRAINT tree_pk PRIMARY KEY (id);


ALTER TABLE ONLY sampledata.fountains_contacts
    ADD CONSTRAINT fountains_contacts_fk FOREIGN KEY (fountain_id) REFERENCES sampledata.fountains(id) ON DELETE CASCADE;


ALTER TABLE ONLY sampledata.fountains_contacts
    ADD CONSTRAINT fountains_contacts_fk_1 FOREIGN KEY (contact_id) REFERENCES sampledata.contacts(id) ON DELETE CASCADE;


ALTER TABLE ONLY sampledata.fountains
    ADD CONSTRAINT fountains_fk FOREIGN KEY (type) REFERENCES sampledata.fountain_types(id) ON DELETE SET NULL;

ALTER TABLE ONLY sampledata.fountains_pictures
    ADD CONSTRAINT fountains_pictures_fk FOREIGN KEY (fountain_id) REFERENCES sampledata.fountains(id) ON DELETE CASCADE;


CREATE TABLE sampledata.inspections (
    id integer NOT NULL,
    title character varying,
    description character varying,
    fountain_id integer
);

ALTER TABLE sampledata.inspections OWNER TO postgres;

COPY sampledata.inspections (id, title, description, fountain_id) FROM stdin;
1	Erstbegehung	Erstbegehung des Brunnens	1
2	Nachprüfung	Alle Mängel behoben	1
\.

ALTER TABLE ONLY sampledata.inspections
    ADD CONSTRAINT inspections_pk PRIMARY KEY (id);

ALTER TABLE ONLY sampledata.inspections
    ADD CONSTRAINT fountains_fk_1 FOREIGN KEY (fountain_id) REFERENCES sampledata.fountains(id) ON DELETE CASCADE;

CREATE SEQUENCE sampledata.inspections_id_seq
    AS integer
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE sampledata.inspections_id_seq OWNER TO postgres;
ALTER SEQUENCE sampledata.inspections_id_seq OWNED BY sampledata.inspections.id;
ALTER TABLE ONLY sampledata.inspections ALTER COLUMN id SET DEFAULT nextval('sampledata.inspections_id_seq'::regclass);


CREATE TABLE sampledata.inspections_contacts (
    inspection_id integer not null,
    contact_id integer not null
);

ALTER TABLE sampledata.inspections_contacts OWNER TO postgres;

ALTER TABLE ONLY sampledata.inspections_contacts
    ADD CONSTRAINT inspections_contacts_pk PRIMARY KEY (inspection_id, contact_id);

ALTER TABLE ONLY sampledata.inspections_contacts
    ADD CONSTRAINT inspections_contacts_un UNIQUE (inspection_id, contact_id);

ALTER TABLE ONLY sampledata.inspections_contacts
    ADD CONSTRAINT inspections_contacts_fk FOREIGN KEY (inspection_id) REFERENCES sampledata.inspections(id) ON DELETE CASCADE;

ALTER TABLE ONLY sampledata.inspections_contacts
    ADD CONSTRAINT inspections_contacts_fk_1 FOREIGN KEY (contact_id) REFERENCES sampledata.contacts(id) ON DELETE CASCADE;
