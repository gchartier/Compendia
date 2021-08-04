--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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

--
-- Name: btree_gin; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gin WITH SCHEMA public;


--
-- Name: EXTENSION btree_gin; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gin IS 'support for indexing common datatypes in GIN';


--
-- Name: btree_gist; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS btree_gist WITH SCHEMA public;


--
-- Name: EXTENSION btree_gist; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION btree_gist IS 'support for indexing common datatypes in GiST';


--
-- Name: citext; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS citext WITH SCHEMA public;


--
-- Name: EXTENSION citext; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION citext IS 'data type for case-insensitive character strings';


--
-- Name: cube; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS cube WITH SCHEMA public;


--
-- Name: EXTENSION cube; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION cube IS 'data type for multidimensional cubes';


--
-- Name: dblink; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;


--
-- Name: EXTENSION dblink; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';


--
-- Name: dict_int; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_int WITH SCHEMA public;


--
-- Name: EXTENSION dict_int; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_int IS 'text search dictionary template for integers';


--
-- Name: dict_xsyn; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS dict_xsyn WITH SCHEMA public;


--
-- Name: EXTENSION dict_xsyn; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION dict_xsyn IS 'text search dictionary template for extended synonym processing';


--
-- Name: earthdistance; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS earthdistance WITH SCHEMA public;


--
-- Name: EXTENSION earthdistance; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION earthdistance IS 'calculate great-circle distances on the surface of the Earth';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: hstore; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS hstore WITH SCHEMA public;


--
-- Name: EXTENSION hstore; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION hstore IS 'data type for storing sets of (key, value) pairs';


--
-- Name: intarray; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS intarray WITH SCHEMA public;


--
-- Name: EXTENSION intarray; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION intarray IS 'functions, operators, and index support for 1-D arrays of integers';


--
-- Name: ltree; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS ltree WITH SCHEMA public;


--
-- Name: EXTENSION ltree; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION ltree IS 'data type for hierarchical tree-like structures';


--
-- Name: pg_stat_statements; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_stat_statements WITH SCHEMA public;


--
-- Name: EXTENSION pg_stat_statements; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_stat_statements IS 'track execution statistics of all SQL statements executed';


--
-- Name: pg_trgm; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_trgm WITH SCHEMA public;


--
-- Name: EXTENSION pg_trgm; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_trgm IS 'text similarity measurement and index searching based on trigrams';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: pgrowlocks; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgrowlocks WITH SCHEMA public;


--
-- Name: EXTENSION pgrowlocks; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgrowlocks IS 'show row-level locking information';


--
-- Name: pgstattuple; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgstattuple WITH SCHEMA public;


--
-- Name: EXTENSION pgstattuple; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgstattuple IS 'show tuple-level statistics';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: xml2; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS xml2 WITH SCHEMA public;


--
-- Name: EXTENSION xml2; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION xml2 IS 'XPath querying and XSLT';


--
-- Name: compute_comics_tsvector(); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.compute_comics_tsvector() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	new.document :=
	setweight(to_tsvector('english', coalesce(new.title, '')), 'A') ||
	setweight(to_tsvector('english', coalesce(new.description, '')), 'B') ||
	setweight(to_tsvector('english', coalesce(new.variant_description, '')), 'C');
	return new;
end
$$;


ALTER FUNCTION public.compute_comics_tsvector() OWNER TO gabriel;

--
-- Name: compute_creators_tsvector(); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.compute_creators_tsvector() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	new.document :=
	setweight(to_tsvector('english', coalesce(new.name, '')), 'A');
	return new;
end
$$;


ALTER FUNCTION public.compute_creators_tsvector() OWNER TO gabriel;

--
-- Name: compute_imprints_tsvector(); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.compute_imprints_tsvector() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	new.document :=
	setweight(to_tsvector('english', coalesce(new.name, '')), 'A');
	return new;
end
$$;


ALTER FUNCTION public.compute_imprints_tsvector() OWNER TO gabriel;

--
-- Name: compute_publishers_tsvector(); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.compute_publishers_tsvector() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	new.document :=
	setweight(to_tsvector('english', coalesce(new.name, '')), 'A');
	return new;
end
$$;


ALTER FUNCTION public.compute_publishers_tsvector() OWNER TO gabriel;

--
-- Name: compute_series_tsvector(); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.compute_series_tsvector() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	new.document :=
	setweight(to_tsvector('english', coalesce(new.name, '')), 'A');
	return new;
end
$$;


ALTER FUNCTION public.compute_series_tsvector() OWNER TO gabriel;

--
-- Name: get_is_comic_pulled(integer, integer, character varying); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.get_is_comic_pulled(comic integer, series integer, userid character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare
	is_pulled bool;
begin
	SELECT EXISTS
		(SELECT 1 FROM collections as c
		 	FULL JOIN pull_list_comics as plc ON c.collection_id = plc.collection_id
		 	FULL JOIN pull_list_series as pls ON c.collection_id = pls.collection_id
			WHERE c.user_id = userid AND (plc.comic_id = comic OR pls.series_id = series))
		AS is_pulled INTO is_pulled;
	
	return is_pulled;
end;
$$;


ALTER FUNCTION public.get_is_comic_pulled(comic integer, series integer, userid character varying) OWNER TO gabriel;

--
-- Name: new_user_create_collection(); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.new_user_create_collection() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO collections(user_id) VALUES(NEW.user_id);
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.new_user_create_collection() OWNER TO gabriel;

--
-- Name: new_user_create_lists(); Type: FUNCTION; Schema: public; Owner: gabriel
--

CREATE FUNCTION public.new_user_create_lists() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO comic_lists(collection_id, name)
	VALUES(NEW.collection_id, 'Favorites'), (NEW.collection_id, 'Read'), (NEW.collection_id, 'Want');
	RETURN NEW;
END;
$$;


ALTER FUNCTION public.new_user_create_lists() OWNER TO gabriel;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: collected_comics; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.collected_comics (
    collected_comic_id integer NOT NULL,
    collection_id integer NOT NULL,
    comic_id integer NOT NULL,
    date_collected date DEFAULT CURRENT_DATE,
    purchase_price character varying(10) DEFAULT ''::character varying,
    bought_at character varying(50) DEFAULT ''::character varying,
    condition character varying(20) DEFAULT ''::character varying,
    grade character varying(20) DEFAULT ''::character varying,
    quantity smallint DEFAULT 1,
    notes text DEFAULT ''::text
);


ALTER TABLE public.collected_comics OWNER TO gabriel;

--
-- Name: collected_comics_collected_comic_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.collected_comics ALTER COLUMN collected_comic_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.collected_comics_collected_comic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: collections; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.collections (
    collection_id integer NOT NULL,
    user_id character varying(255)
);


ALTER TABLE public.collections OWNER TO gabriel;

--
-- Name: collections_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.collections ALTER COLUMN collection_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.collections_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comic_creators; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.comic_creators (
    comic_creator_id integer NOT NULL,
    creator_id integer NOT NULL,
    comic_id integer NOT NULL,
    creator_types character varying(40)[]
);


ALTER TABLE public.comic_creators OWNER TO gabriel;

--
-- Name: comic_creators_comic_creator_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.comic_creators ALTER COLUMN comic_creator_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comic_creators_comic_creator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comic_list_comics; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.comic_list_comics (
    comic_list_comic_id integer NOT NULL,
    comic_list_id integer NOT NULL,
    comic_id integer NOT NULL
);


ALTER TABLE public.comic_list_comics OWNER TO gabriel;

--
-- Name: comic_list_comics_comic_list_comic_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.comic_list_comics ALTER COLUMN comic_list_comic_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comic_list_comics_comic_list_comic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comic_lists; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.comic_lists (
    comic_list_id integer NOT NULL,
    collection_id integer NOT NULL,
    name character varying(35) NOT NULL
);


ALTER TABLE public.comic_lists OWNER TO gabriel;

--
-- Name: comic_lists_comic_list_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.comic_lists ALTER COLUMN comic_list_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comic_lists_comic_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: comics; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.comics (
    comic_id integer NOT NULL,
    series_id integer NOT NULL,
    title character varying(255) NOT NULL,
    cover character varying(255),
    release_date date,
    cover_price character varying(10),
    description text,
    age_rating character varying(25),
    format character varying(25),
    printing smallint,
    version_of integer,
    alt_id character varying(50),
    diamond_id character varying(50),
    variant_types character varying[],
    item_number character varying(100),
    document tsvector,
    solicitation_date character varying(30),
    is_mini_series boolean,
    mini_series_limit integer,
    is_one_shot boolean,
    cover_letter character varying(5),
    variant_description character varying(100),
    subtitle character varying(100),
    is_variant_root boolean,
    is_temp_variant_root boolean
);


ALTER TABLE public.comics OWNER TO gabriel;

--
-- Name: comics_comic_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.comics ALTER COLUMN comic_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.comics_comic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: creator_type_lookup; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.creator_type_lookup (
    creator_type_code character varying(3) NOT NULL,
    definition character varying(25)
);


ALTER TABLE public.creator_type_lookup OWNER TO gabriel;

--
-- Name: creators; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.creators (
    creator_id integer NOT NULL,
    name character varying(50) NOT NULL,
    alt_id character varying(50),
    document tsvector
);


ALTER TABLE public.creators OWNER TO gabriel;

--
-- Name: creators_creator_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.creators ALTER COLUMN creator_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.creators_creator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: imprints; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.imprints (
    imprint_id integer NOT NULL,
    publisher_id integer NOT NULL,
    name character varying(100) NOT NULL,
    alt_id character varying(50),
    document tsvector
);


ALTER TABLE public.imprints OWNER TO gabriel;

--
-- Name: imprints_imprint_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.imprints ALTER COLUMN imprint_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.imprints_imprint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: publishers; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.publishers (
    publisher_id integer NOT NULL,
    name character varying(100) NOT NULL,
    alt_id character varying(50),
    document tsvector
);


ALTER TABLE public.publishers OWNER TO gabriel;

--
-- Name: publishers_publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.publishers ALTER COLUMN publisher_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.publishers_publisher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pull_list_comics; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.pull_list_comics (
    pull_list_comic_id integer NOT NULL,
    collection_id integer NOT NULL,
    comic_id integer NOT NULL
);


ALTER TABLE public.pull_list_comics OWNER TO gabriel;

--
-- Name: pull_list_comics_pull_list_comic_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.pull_list_comics ALTER COLUMN pull_list_comic_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pull_list_comics_pull_list_comic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pull_list_series; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.pull_list_series (
    pull_list_series_id integer NOT NULL,
    collection_id integer NOT NULL,
    series_id integer NOT NULL,
    include_single_issues boolean DEFAULT true,
    include_tpbs boolean DEFAULT false,
    include_hardcovers boolean DEFAULT false,
    include_all boolean DEFAULT false,
    include_compendia boolean DEFAULT false,
    include_omnibuses boolean DEFAULT false,
    include_cover_variants boolean DEFAULT false,
    include_reprints boolean DEFAULT false,
    include_subsequent_printings boolean DEFAULT false,
    include_graphic_novels boolean DEFAULT false
);


ALTER TABLE public.pull_list_series OWNER TO gabriel;

--
-- Name: pull_list_series_pull_list_series_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.pull_list_series ALTER COLUMN pull_list_series_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pull_list_series_pull_list_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    collection_id integer,
    series_id integer,
    comic_id integer,
    author character varying,
    title character varying(255),
    body text,
    rating integer
);


ALTER TABLE public.reviews OWNER TO gabriel;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.reviews ALTER COLUMN review_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reviews_review_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: series; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.series (
    series_id integer NOT NULL,
    publisher_id integer NOT NULL,
    imprint_id integer,
    name character varying(100) NOT NULL,
    alt_id character varying(50),
    document tsvector,
    is_graphic_novel_series boolean DEFAULT true
);


ALTER TABLE public.series OWNER TO gabriel;

--
-- Name: series_series_id_seq; Type: SEQUENCE; Schema: public; Owner: gabriel
--

ALTER TABLE public.series ALTER COLUMN series_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.series_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.users (
    user_id character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.users OWNER TO gabriel;

--
-- Name: variant_type_lookup; Type: TABLE; Schema: public; Owner: gabriel
--

CREATE TABLE public.variant_type_lookup (
    variant_type_code character varying(3) NOT NULL,
    variant_type_desc character varying(50)
);


ALTER TABLE public.variant_type_lookup OWNER TO gabriel;

--
-- Name: collected_comics collected_comics_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.collected_comics
    ADD CONSTRAINT collected_comics_pkey PRIMARY KEY (collected_comic_id);


--
-- Name: collections collections_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT collections_pkey PRIMARY KEY (collection_id);


--
-- Name: comic_creators comic_creators_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_creators
    ADD CONSTRAINT comic_creators_pkey PRIMARY KEY (comic_creator_id);


--
-- Name: comic_list_comics comic_list_comics_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_list_comics
    ADD CONSTRAINT comic_list_comics_pkey PRIMARY KEY (comic_list_comic_id);


--
-- Name: comic_lists comic_lists_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_lists
    ADD CONSTRAINT comic_lists_pkey PRIMARY KEY (comic_list_id);


--
-- Name: comics comics_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comics
    ADD CONSTRAINT comics_pkey PRIMARY KEY (comic_id);


--
-- Name: creator_type_lookup creator_type_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.creator_type_lookup
    ADD CONSTRAINT creator_type_lookup_pkey PRIMARY KEY (creator_type_code);


--
-- Name: creators creators_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.creators
    ADD CONSTRAINT creators_pkey PRIMARY KEY (creator_id);


--
-- Name: imprints imprints_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.imprints
    ADD CONSTRAINT imprints_pkey PRIMARY KEY (imprint_id);


--
-- Name: publishers publishers_name_key; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_name_key UNIQUE (name);


--
-- Name: publishers publishers_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.publishers
    ADD CONSTRAINT publishers_pkey PRIMARY KEY (publisher_id);


--
-- Name: pull_list_comics pull_list_comics_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.pull_list_comics
    ADD CONSTRAINT pull_list_comics_pkey PRIMARY KEY (pull_list_comic_id);


--
-- Name: pull_list_series pull_list_series_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.pull_list_series
    ADD CONSTRAINT pull_list_series_pkey PRIMARY KEY (pull_list_series_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: series series_name_key; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_name_key UNIQUE (name);


--
-- Name: series series_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT series_pkey PRIMARY KEY (series_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: variant_type_lookup variant_type_lookup_pkey; Type: CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.variant_type_lookup
    ADD CONSTRAINT variant_type_lookup_pkey PRIMARY KEY (variant_type_code);


--
-- Name: comics_document_idx; Type: INDEX; Schema: public; Owner: gabriel
--

CREATE INDEX comics_document_idx ON public.comics USING gin (document);


--
-- Name: creators_document_idx; Type: INDEX; Schema: public; Owner: gabriel
--

CREATE INDEX creators_document_idx ON public.creators USING gin (document);


--
-- Name: imprints_document_idx; Type: INDEX; Schema: public; Owner: gabriel
--

CREATE INDEX imprints_document_idx ON public.imprints USING gin (document);


--
-- Name: publishers_document_idx; Type: INDEX; Schema: public; Owner: gabriel
--

CREATE INDEX publishers_document_idx ON public.publishers USING gin (document);


--
-- Name: series_document_idx; Type: INDEX; Schema: public; Owner: gabriel
--

CREATE INDEX series_document_idx ON public.series USING gin (document);


--
-- Name: users new_user_create_collection; Type: TRIGGER; Schema: public; Owner: gabriel
--

CREATE TRIGGER new_user_create_collection AFTER INSERT ON public.users FOR EACH ROW EXECUTE FUNCTION public.new_user_create_collection();


--
-- Name: collections new_user_create_lists; Type: TRIGGER; Schema: public; Owner: gabriel
--

CREATE TRIGGER new_user_create_lists AFTER INSERT ON public.collections FOR EACH ROW EXECUTE FUNCTION public.new_user_create_lists();


--
-- Name: comics tsvector_update; Type: TRIGGER; Schema: public; Owner: gabriel
--

CREATE TRIGGER tsvector_update BEFORE INSERT OR UPDATE ON public.comics FOR EACH ROW EXECUTE FUNCTION public.compute_comics_tsvector();


--
-- Name: creators tsvector_update; Type: TRIGGER; Schema: public; Owner: gabriel
--

CREATE TRIGGER tsvector_update BEFORE INSERT OR UPDATE ON public.creators FOR EACH ROW EXECUTE FUNCTION public.compute_creators_tsvector();


--
-- Name: imprints tsvector_update; Type: TRIGGER; Schema: public; Owner: gabriel
--

CREATE TRIGGER tsvector_update BEFORE INSERT OR UPDATE ON public.imprints FOR EACH ROW EXECUTE FUNCTION public.compute_imprints_tsvector();


--
-- Name: publishers tsvector_update; Type: TRIGGER; Schema: public; Owner: gabriel
--

CREATE TRIGGER tsvector_update BEFORE INSERT OR UPDATE ON public.publishers FOR EACH ROW EXECUTE FUNCTION public.compute_publishers_tsvector();


--
-- Name: series tsvector_update; Type: TRIGGER; Schema: public; Owner: gabriel
--

CREATE TRIGGER tsvector_update BEFORE INSERT OR UPDATE ON public.series FOR EACH ROW EXECUTE FUNCTION public.compute_series_tsvector();


--
-- Name: reviews fk_author; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_author FOREIGN KEY (author) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: collected_comics fk_collection; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.collected_comics
    ADD CONSTRAINT fk_collection FOREIGN KEY (collection_id) REFERENCES public.collections(collection_id) ON DELETE CASCADE;


--
-- Name: comic_lists fk_collection; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_lists
    ADD CONSTRAINT fk_collection FOREIGN KEY (collection_id) REFERENCES public.collections(collection_id) ON DELETE CASCADE;


--
-- Name: pull_list_comics fk_collection; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.pull_list_comics
    ADD CONSTRAINT fk_collection FOREIGN KEY (collection_id) REFERENCES public.collections(collection_id) ON DELETE CASCADE;


--
-- Name: pull_list_series fk_collection; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.pull_list_series
    ADD CONSTRAINT fk_collection FOREIGN KEY (collection_id) REFERENCES public.collections(collection_id) ON DELETE CASCADE;


--
-- Name: reviews fk_collection; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_collection FOREIGN KEY (collection_id) REFERENCES public.collections(collection_id) ON DELETE CASCADE;


--
-- Name: comic_creators fk_comic; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_creators
    ADD CONSTRAINT fk_comic FOREIGN KEY (comic_id) REFERENCES public.comics(comic_id) ON DELETE CASCADE;


--
-- Name: collected_comics fk_comic; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.collected_comics
    ADD CONSTRAINT fk_comic FOREIGN KEY (comic_id) REFERENCES public.comics(comic_id) ON DELETE CASCADE;


--
-- Name: comic_list_comics fk_comic; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_list_comics
    ADD CONSTRAINT fk_comic FOREIGN KEY (comic_id) REFERENCES public.comics(comic_id) ON DELETE CASCADE;


--
-- Name: pull_list_comics fk_comic; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.pull_list_comics
    ADD CONSTRAINT fk_comic FOREIGN KEY (comic_id) REFERENCES public.comics(comic_id) ON DELETE CASCADE;


--
-- Name: reviews fk_comic; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_comic FOREIGN KEY (comic_id) REFERENCES public.comics(comic_id) ON DELETE CASCADE;


--
-- Name: comic_list_comics fk_comic_list; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_list_comics
    ADD CONSTRAINT fk_comic_list FOREIGN KEY (comic_list_id) REFERENCES public.comic_lists(comic_list_id) ON DELETE CASCADE;


--
-- Name: comic_creators fk_creator; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comic_creators
    ADD CONSTRAINT fk_creator FOREIGN KEY (creator_id) REFERENCES public.creators(creator_id) ON DELETE CASCADE;


--
-- Name: series fk_imprint; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT fk_imprint FOREIGN KEY (imprint_id) REFERENCES public.imprints(imprint_id) ON DELETE CASCADE;


--
-- Name: imprints fk_publisher; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.imprints
    ADD CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES public.publishers(publisher_id) ON DELETE CASCADE;


--
-- Name: series fk_publisher; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT fk_publisher FOREIGN KEY (publisher_id) REFERENCES public.publishers(publisher_id) ON DELETE CASCADE;


--
-- Name: comics fk_series; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comics
    ADD CONSTRAINT fk_series FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: pull_list_series fk_series; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.pull_list_series
    ADD CONSTRAINT fk_series FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: reviews fk_series; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_series FOREIGN KEY (series_id) REFERENCES public.series(series_id) ON DELETE CASCADE;


--
-- Name: collections fk_user; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.collections
    ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE CASCADE;


--
-- Name: comics fk_version_of; Type: FK CONSTRAINT; Schema: public; Owner: gabriel
--

ALTER TABLE ONLY public.comics
    ADD CONSTRAINT fk_version_of FOREIGN KEY (version_of) REFERENCES public.comics(comic_id);


--
