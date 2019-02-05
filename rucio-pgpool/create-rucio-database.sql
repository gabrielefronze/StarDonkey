--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6 (Debian 10.6-1.pgdg90+1)
-- Dumped by pg_dump version 10.6 (Debian 10.6-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: ACCOUNTS_STATUS_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ACCOUNTS_STATUS_CHK" AS ENUM (
    'ACTIVE',
    'DELETED',
    'SUSPENDED'
);


ALTER TYPE public."ACCOUNTS_STATUS_CHK" OWNER TO postgres;

--
-- Name: ACCOUNTS_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ACCOUNTS_TYPE_CHK" AS ENUM (
    'GROUP',
    'USER',
    'SERVICE'
);


ALTER TYPE public."ACCOUNTS_TYPE_CHK" OWNER TO postgres;

--
-- Name: ACCOUNT_MAP_ID_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."ACCOUNT_MAP_ID_TYPE_CHK" AS ENUM (
    'X509',
    'GSS',
    'USERPASS',
    'SSH'
);


ALTER TYPE public."ACCOUNT_MAP_ID_TYPE_CHK" OWNER TO postgres;

--
-- Name: BAD_REPLICAS_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."BAD_REPLICAS_STATE_CHK" AS ENUM (
    'R',
    'S',
    'B',
    'L',
    'D'
);


ALTER TYPE public."BAD_REPLICAS_STATE_CHK" OWNER TO postgres;

--
-- Name: COLLECTION_REPLICAS_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."COLLECTION_REPLICAS_STATE_CHK" AS ENUM (
    'A',
    'C',
    'B',
    'D',
    'S',
    'U'
);


ALTER TYPE public."COLLECTION_REPLICAS_STATE_CHK" OWNER TO postgres;

--
-- Name: COLLECTION_REPLICAS_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."COLLECTION_REPLICAS_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."COLLECTION_REPLICAS_TYPE_CHK" OWNER TO postgres;

--
-- Name: CONTENTS_CHILD_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CONTENTS_CHILD_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."CONTENTS_CHILD_TYPE_CHK" OWNER TO postgres;

--
-- Name: CONTENTS_DID_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CONTENTS_DID_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."CONTENTS_DID_TYPE_CHK" OWNER TO postgres;

--
-- Name: CONTENTS_HIST_CHILD_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CONTENTS_HIST_CHILD_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."CONTENTS_HIST_CHILD_TYPE_CHK" OWNER TO postgres;

--
-- Name: CONTENTS_HIST_DID_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CONTENTS_HIST_DID_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."CONTENTS_HIST_DID_TYPE_CHK" OWNER TO postgres;

--
-- Name: CVT_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."CVT_TYPE_CHK" AS ENUM (
    'ALL',
    'CONTAINER',
    'DERIVED',
    'COLLECTION',
    'DATASET',
    'FILE'
);


ALTER TYPE public."CVT_TYPE_CHK" OWNER TO postgres;

--
-- Name: DATASET_LOCKS_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DATASET_LOCKS_STATE_CHK" AS ENUM (
    'S',
    'R',
    'O'
);


ALTER TYPE public."DATASET_LOCKS_STATE_CHK" OWNER TO postgres;

--
-- Name: DEL_DIDS_AVAIL_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DEL_DIDS_AVAIL_CHK" AS ENUM (
    'A',
    'D',
    'L'
);


ALTER TYPE public."DEL_DIDS_AVAIL_CHK" OWNER TO postgres;

--
-- Name: DEL_DIDS_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DEL_DIDS_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."DEL_DIDS_TYPE_CHK" OWNER TO postgres;

--
-- Name: DIDS_AVAILABILITY_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DIDS_AVAILABILITY_CHK" AS ENUM (
    'A',
    'D',
    'L'
);


ALTER TYPE public."DIDS_AVAILABILITY_CHK" OWNER TO postgres;

--
-- Name: DIDS_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DIDS_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."DIDS_TYPE_CHK" OWNER TO postgres;

--
-- Name: DID_KEYS_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."DID_KEYS_TYPE_CHK" AS ENUM (
    'ALL',
    'CONTAINER',
    'DERIVED',
    'COLLECTION',
    'DATASET',
    'FILE'
);


ALTER TYPE public."DID_KEYS_TYPE_CHK" OWNER TO postgres;

--
-- Name: IDENTITIES_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."IDENTITIES_TYPE_CHK" AS ENUM (
    'X509',
    'GSS',
    'USERPASS',
    'SSH'
);


ALTER TYPE public."IDENTITIES_TYPE_CHK" OWNER TO postgres;

--
-- Name: LIFETIME_EXCEPT_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."LIFETIME_EXCEPT_STATE_CHK" AS ENUM (
    'A',
    'R',
    'W'
);


ALTER TYPE public."LIFETIME_EXCEPT_STATE_CHK" OWNER TO postgres;

--
-- Name: LIFETIME_EXCEPT_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."LIFETIME_EXCEPT_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."LIFETIME_EXCEPT_TYPE_CHK" OWNER TO postgres;

--
-- Name: LOCKS_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."LOCKS_STATE_CHK" AS ENUM (
    'S',
    'R',
    'O'
);


ALTER TYPE public."LOCKS_STATE_CHK" OWNER TO postgres;

--
-- Name: REPLICAS_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."REPLICAS_STATE_CHK" AS ENUM (
    'A',
    'C',
    'B',
    'D',
    'S',
    'U'
);


ALTER TYPE public."REPLICAS_STATE_CHK" OWNER TO postgres;

--
-- Name: REQUESTS_DIDTYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."REQUESTS_DIDTYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."REQUESTS_DIDTYPE_CHK" OWNER TO postgres;

--
-- Name: REQUESTS_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."REQUESTS_STATE_CHK" AS ENUM (
    'A',
    'D',
    'G',
    'F',
    'M',
    'L',
    'O',
    'N',
    'Q',
    'S',
    'U',
    'W'
);


ALTER TYPE public."REQUESTS_STATE_CHK" OWNER TO postgres;

--
-- Name: REQUESTS_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."REQUESTS_TYPE_CHK" AS ENUM (
    'I',
    'U',
    'T',
    'O',
    'D'
);


ALTER TYPE public."REQUESTS_TYPE_CHK" OWNER TO postgres;

--
-- Name: RSES_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RSES_TYPE_CHK" AS ENUM (
    'DISK',
    'TAPE'
);


ALTER TYPE public."RSES_TYPE_CHK" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_072be6; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_072be6" AS ENUM (
    'Y',
    'C',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_072be6" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_084b12; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_084b12" AS ENUM (
    'I',
    'O',
    'S',
    'R',
    'U',
    'W'
);


ALTER TYPE public."RUCIO_ENUM_084b12" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_093dee; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_093dee" AS ENUM (
    'A',
    'D',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_093dee" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_26544b; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_26544b" AS ENUM (
    'A',
    'D',
    'G',
    'F',
    'M',
    'L',
    'O',
    'N',
    'Q',
    'S',
    'U',
    'W'
);


ALTER TYPE public."RUCIO_ENUM_26544b" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_2da83f; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_2da83f" AS ENUM (
    'I',
    'A',
    'B',
    'U',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_2da83f" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_365d29; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_365d29" AS ENUM (
    'A',
    'D',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_365d29" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_494d99; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_494d99" AS ENUM (
    'A',
    'D',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_494d99" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_505f44; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_505f44" AS ENUM (
    'A',
    'D',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_505f44" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_5c1b4e; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_5c1b4e" AS ENUM (
    'I',
    'U',
    'T',
    'O',
    'D'
);


ALTER TYPE public."RUCIO_ENUM_5c1b4e" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_641aed; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_641aed" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."RUCIO_ENUM_641aed" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_6ff01f; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_6ff01f" AS ENUM (
    'Y',
    'C',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_6ff01f" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_81e948; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_81e948" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."RUCIO_ENUM_81e948" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_871626; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_871626" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."RUCIO_ENUM_871626" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_94aeae; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_94aeae" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."RUCIO_ENUM_94aeae" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_a3eb6f; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_a3eb6f" AS ENUM (
    'I',
    'O',
    'S',
    'R',
    'U',
    'W'
);


ALTER TYPE public."RUCIO_ENUM_a3eb6f" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_b7810e; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_b7810e" AS ENUM (
    'Y',
    'C',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_b7810e" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_bf843f; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_bf843f" AS ENUM (
    'I',
    'O',
    'S',
    'R',
    'U',
    'W'
);


ALTER TYPE public."RUCIO_ENUM_bf843f" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_c2e2e8; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_c2e2e8" AS ENUM (
    'Y',
    'C',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_c2e2e8" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_cfbb1f; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_cfbb1f" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."RUCIO_ENUM_cfbb1f" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_d2322f; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_d2322f" AS ENUM (
    'I',
    'O',
    'S',
    'R',
    'U',
    'W'
);


ALTER TYPE public."RUCIO_ENUM_d2322f" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_d5e587; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_d5e587" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."RUCIO_ENUM_d5e587" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_ede59f; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_ede59f" AS ENUM (
    'I',
    'A',
    'B',
    'U',
    'N'
);


ALTER TYPE public."RUCIO_ENUM_ede59f" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_f0466d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_f0466d" AS ENUM (
    'A',
    'D',
    'G',
    'F',
    'M',
    'L',
    'O',
    'N',
    'Q',
    'S',
    'U',
    'W'
);


ALTER TYPE public."RUCIO_ENUM_f0466d" OWNER TO postgres;

--
-- Name: RUCIO_ENUM_fae60c; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RUCIO_ENUM_fae60c" AS ENUM (
    'I',
    'U',
    'T',
    'O',
    'D'
);


ALTER TYPE public."RUCIO_ENUM_fae60c" OWNER TO postgres;

--
-- Name: RULES_DID_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RULES_DID_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."RULES_DID_TYPE_CHK" OWNER TO postgres;

--
-- Name: RULES_GROUPING_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RULES_GROUPING_CHK" AS ENUM (
    'A',
    'D',
    'N'
);


ALTER TYPE public."RULES_GROUPING_CHK" OWNER TO postgres;

--
-- Name: RULES_NOTIFICATION_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RULES_NOTIFICATION_CHK" AS ENUM (
    'Y',
    'C',
    'N'
);


ALTER TYPE public."RULES_NOTIFICATION_CHK" OWNER TO postgres;

--
-- Name: RULES_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."RULES_STATE_CHK" AS ENUM (
    'I',
    'O',
    'S',
    'R',
    'U',
    'W'
);


ALTER TYPE public."RULES_STATE_CHK" OWNER TO postgres;

--
-- Name: SCOPE_STATUS_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."SCOPE_STATUS_CHK" AS ENUM (
    'C',
    'D',
    'O'
);


ALTER TYPE public."SCOPE_STATUS_CHK" OWNER TO postgres;

--
-- Name: SUBSCRIPTIONS_STATE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."SUBSCRIPTIONS_STATE_CHK" AS ENUM (
    'I',
    'A',
    'B',
    'U',
    'N'
);


ALTER TYPE public."SUBSCRIPTIONS_STATE_CHK" OWNER TO postgres;

--
-- Name: UPDATED_COL_REP_TYPE_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."UPDATED_COL_REP_TYPE_CHK" AS ENUM (
    'A',
    'C',
    'D',
    'F',
    'Y',
    'X',
    'Z'
);


ALTER TYPE public."UPDATED_COL_REP_TYPE_CHK" OWNER TO postgres;

--
-- Name: UPDATED_DIDS_RULE_EVAL_ACT_CHK; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public."UPDATED_DIDS_RULE_EVAL_ACT_CHK" AS ENUM (
    'A',
    'D'
);


ALTER TYPE public."UPDATED_DIDS_RULE_EVAL_ACT_CHK" OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_attr_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_attr_map (
    account character varying(25) NOT NULL,
    key character varying(255) NOT NULL,
    value character varying(255),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "ACCOUNT_ATTR_MAP_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "ACCOUNT_ATTR_MAP_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.account_attr_map OWNER TO postgres;

--
-- Name: account_limits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_limits (
    account character varying(25) NOT NULL,
    rse_id uuid NOT NULL,
    bytes bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "ACCOUNT_LIMITS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "ACCOUNT_LIMITS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.account_limits OWNER TO postgres;

--
-- Name: account_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_map (
    identity character varying(2048) NOT NULL,
    identity_type public."IDENTITIES_TYPE_CHK" NOT NULL,
    account character varying(25) NOT NULL,
    is_default boolean,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "ACCOUNT_MAP_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "ACCOUNT_MAP_ID_TYPE_NN" CHECK ((identity_type IS NOT NULL)),
    CONSTRAINT "ACCOUNT_MAP_IS_DEFAULT_NN" CHECK ((is_default IS NOT NULL)),
    CONSTRAINT "ACCOUNT_MAP_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.account_map OWNER TO postgres;

--
-- Name: account_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_usage (
    account character varying(25) NOT NULL,
    rse_id uuid NOT NULL,
    files bigint,
    bytes bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "ACCOUNT_USAGE_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "ACCOUNT_USAGE_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.account_usage OWNER TO postgres;

--
-- Name: account_usage_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_usage_history (
    account character varying(25) NOT NULL,
    rse_id uuid NOT NULL,
    files bigint,
    bytes bigint,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.account_usage_history OWNER TO postgres;

--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    account character varying(25) NOT NULL,
    account_type public."ACCOUNTS_TYPE_CHK",
    status public."ACCOUNTS_STATUS_CHK",
    email character varying(255),
    suspended_at timestamp without time zone,
    deleted_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "ACCOUNTS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "ACCOUNTS_STATUS_NN" CHECK ((status IS NOT NULL)),
    CONSTRAINT "ACCOUNTS_TYPE_NN" CHECK ((account_type IS NOT NULL)),
    CONSTRAINT "ACCOUNTS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: archive_contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_contents (
    child_scope character varying(25) NOT NULL,
    child_name character varying(250) NOT NULL,
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    bytes bigint,
    adler32 character varying(8),
    md5 character varying(32),
    guid uuid,
    length bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "ARCHIVE_CONTENTS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "ARCHIVE_CONTENTS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.archive_contents OWNER TO postgres;

--
-- Name: archive_contents_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archive_contents_history (
    child_scope character varying(25) NOT NULL,
    child_name character varying(250) NOT NULL,
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    bytes bigint,
    adler32 character varying(8),
    md5 character varying(32),
    guid uuid,
    length bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "ARCH_CNTS_HIST_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "ARCH_CNTS_HIST_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.archive_contents_history OWNER TO postgres;

--
-- Name: bad_replicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bad_replicas (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    rse_id uuid NOT NULL,
    reason character varying(255),
    state public."BAD_REPLICAS_STATE_CHK",
    account character varying(25),
    bytes bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    CONSTRAINT "BAD_REPLICAS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "BAD_REPLICAS_NAME_NN" CHECK ((name IS NOT NULL)),
    CONSTRAINT "BAD_REPLICAS_RSE_ID_NN" CHECK ((rse_id IS NOT NULL)),
    CONSTRAINT "BAD_REPLICAS_SCOPE_NN" CHECK ((scope IS NOT NULL)),
    CONSTRAINT "BAD_REPLICAS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.bad_replicas OWNER TO postgres;

--
-- Name: collection_replicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_replicas (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    did_type public."COLLECTION_REPLICAS_TYPE_CHK",
    rse_id uuid NOT NULL,
    bytes bigint,
    length bigint,
    available_bytes bigint,
    available_replicas_cnt bigint,
    state public."COLLECTION_REPLICAS_STATE_CHK",
    accessed_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "COLLECTION_REPLICAS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "COLLECTION_REPLICAS_SIZE_NN" CHECK ((bytes IS NOT NULL)),
    CONSTRAINT "COLLECTION_REPLICAS_STATE_NN" CHECK ((state IS NOT NULL)),
    CONSTRAINT "COLLECTION_REPLICAS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.collection_replicas OWNER TO postgres;

--
-- Name: configs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configs (
    section character varying(128) NOT NULL,
    opt character varying(128) NOT NULL,
    value character varying(4000),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "CONFIGS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "CONFIGS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.configs OWNER TO postgres;

--
-- Name: configs_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configs_history (
    section character varying(128) NOT NULL,
    opt character varying(128) NOT NULL,
    value character varying(4000),
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.configs_history OWNER TO postgres;

--
-- Name: contents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contents (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    child_scope character varying(25) NOT NULL,
    child_name character varying(250) NOT NULL,
    did_type public."CONTENTS_DID_TYPE_CHK",
    child_type public."CONTENTS_CHILD_TYPE_CHK",
    bytes bigint,
    adler32 character varying(8),
    md5 character varying(32),
    guid uuid,
    events bigint,
    rule_evaluation boolean,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "CONTENTS_CHILD_TYPE_NN" CHECK ((child_type IS NOT NULL)),
    CONSTRAINT "CONTENTS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "CONTENTS_DID_TYPE_NN" CHECK ((did_type IS NOT NULL)),
    CONSTRAINT "CONTENTS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.contents OWNER TO postgres;

--
-- Name: contents_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.contents_history (
    scope character varying(25),
    name character varying(250),
    child_scope character varying(25),
    child_name character varying(250),
    did_type public."CONTENTS_HIST_DID_TYPE_CHK",
    child_type public."CONTENTS_HIST_CHILD_TYPE_CHK",
    bytes bigint,
    adler32 character varying(8),
    md5 character varying(32),
    guid uuid,
    events bigint,
    rule_evaluation boolean,
    did_created_at timestamp without time zone,
    deleted_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "CONTENTS_HISTORY_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "CONTENTS_HISTORY_UPDATED_NN" CHECK ((updated_at IS NOT NULL)),
    CONSTRAINT "CONTENTS_HIST_CHILD_TYPE_NN" CHECK ((child_type IS NOT NULL)),
    CONSTRAINT "CONTENTS_HIST_DID_TYPE_NN" CHECK ((did_type IS NOT NULL))
);


ALTER TABLE public.contents_history OWNER TO postgres;

--
-- Name: dataset_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dataset_locks (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    rule_id uuid NOT NULL,
    rse_id uuid NOT NULL,
    account character varying(25),
    state public."DATASET_LOCKS_STATE_CHK",
    length bigint,
    bytes bigint,
    accessed_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "DATASET_LOCKS_ACCOUNT_NN" CHECK ((account IS NOT NULL)),
    CONSTRAINT "DATASET_LOCKS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "DATASET_LOCKS_STATE_NN" CHECK ((state IS NOT NULL)),
    CONSTRAINT "DATASET_LOCKS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.dataset_locks OWNER TO postgres;

--
-- Name: deleted_dids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.deleted_dids (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    account character varying(25),
    did_type public."DEL_DIDS_TYPE_CHK",
    is_open boolean,
    monotonic boolean DEFAULT false,
    hidden boolean DEFAULT false,
    obsolete boolean DEFAULT false,
    complete boolean,
    is_new boolean DEFAULT true,
    availability public."DEL_DIDS_AVAIL_CHK",
    suppressed boolean DEFAULT false,
    bytes bigint,
    length bigint,
    md5 character varying(32),
    adler32 character varying(8),
    expired_at timestamp without time zone,
    deleted_at timestamp without time zone,
    events bigint,
    guid uuid,
    project character varying(50),
    datatype character varying(50),
    run_number integer,
    stream_name character varying(70),
    prod_step character varying(50),
    version character varying(50),
    campaign character varying(50),
    task_id integer,
    panda_id integer,
    lumiblocknr integer,
    provenance character varying(2),
    phys_group character varying(25),
    transient boolean DEFAULT false,
    purge_replicas boolean,
    accessed_at timestamp without time zone,
    closed_at timestamp without time zone,
    eol_at timestamp without time zone,
    is_archive boolean,
    constituent boolean,
    access_cnt integer,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "DELETED_DIDS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "DELETED_DIDS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.deleted_dids OWNER TO postgres;

--
-- Name: did_key_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.did_key_map (
    key character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "DID_KEY_MAP_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "DID_KEY_MAP_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.did_key_map OWNER TO postgres;

--
-- Name: did_keys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.did_keys (
    key character varying(255) NOT NULL,
    is_enum boolean DEFAULT false,
    key_type public."DID_KEYS_TYPE_CHK",
    value_type character varying(255),
    value_regexp character varying(255),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "DID_KEYS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "DID_KEYS_IS_ENUM_NN" CHECK ((is_enum IS NOT NULL)),
    CONSTRAINT "DID_KEYS_TYPE_NN" CHECK ((key_type IS NOT NULL)),
    CONSTRAINT "DID_KEYS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.did_keys OWNER TO postgres;

--
-- Name: did_meta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.did_meta (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    meta jsonb,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "DID_META_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "DID_META_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.did_meta OWNER TO postgres;

--
-- Name: dids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dids (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    account character varying(25),
    did_type public."DIDS_TYPE_CHK",
    is_open boolean,
    monotonic boolean DEFAULT false,
    hidden boolean DEFAULT false,
    obsolete boolean DEFAULT false,
    complete boolean,
    is_new boolean DEFAULT true,
    availability public."DIDS_AVAILABILITY_CHK",
    suppressed boolean DEFAULT false,
    bytes bigint,
    length bigint,
    md5 character varying(32),
    adler32 character varying(8),
    expired_at timestamp without time zone,
    purge_replicas boolean DEFAULT true,
    deleted_at timestamp without time zone,
    events bigint,
    guid uuid,
    project character varying(50),
    datatype character varying(50),
    run_number integer,
    stream_name character varying(70),
    prod_step character varying(50),
    version character varying(50),
    campaign character varying(50),
    task_id integer,
    panda_id integer,
    lumiblocknr integer,
    provenance character varying(2),
    phys_group character varying(25),
    transient boolean DEFAULT false,
    accessed_at timestamp without time zone,
    closed_at timestamp without time zone,
    eol_at timestamp without time zone,
    is_archive boolean,
    constituent boolean,
    access_cnt integer,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "DIDS_ACCOUNT_NN" CHECK ((account IS NOT NULL)),
    CONSTRAINT "DIDS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "DIDS_MONOTONIC_NN" CHECK ((monotonic IS NOT NULL)),
    CONSTRAINT "DIDS_OBSOLETE_NN" CHECK ((obsolete IS NOT NULL)),
    CONSTRAINT "DIDS_PURGE_REPLICAS_NN" CHECK ((purge_replicas IS NOT NULL)),
    CONSTRAINT "DIDS_SUPP_NN" CHECK ((suppressed IS NOT NULL)),
    CONSTRAINT "DIDS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.dids OWNER TO postgres;

--
-- Name: distances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distances (
    src_rse_id uuid NOT NULL,
    dest_rse_id uuid NOT NULL,
    ranking integer,
    agis_distance integer,
    geoip_distance integer,
    active integer,
    submitted integer,
    finished integer,
    failed integer,
    transfer_speed integer,
    packet_loss integer,
    latency integer,
    mbps_file integer,
    mbps_link integer,
    queued_total integer,
    done_1h integer,
    done_6h integer,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "DISTANCES_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "DISTANCES_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.distances OWNER TO postgres;

--
-- Name: heartbeats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.heartbeats (
    executable character varying(64) NOT NULL,
    readable character varying(4000),
    hostname character varying(128) NOT NULL,
    pid integer NOT NULL,
    thread_id bigint NOT NULL,
    thread_name character varying(64),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "HEARTBEATS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "HEARTBEATS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.heartbeats OWNER TO postgres;

--
-- Name: identities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identities (
    identity character varying(2048) NOT NULL,
    identity_type public."IDENTITIES_TYPE_CHK" NOT NULL,
    username character varying(255),
    password character varying(255),
    salt bytea,
    email character varying(255),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    deleted boolean,
    deleted_at timestamp without time zone,
    CONSTRAINT "IDENTITIES_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "IDENTITIES_DELETED_NN" CHECK ((deleted IS NOT NULL)),
    CONSTRAINT "IDENTITIES_EMAIL_NN" CHECK ((email IS NOT NULL)),
    CONSTRAINT "IDENTITIES_TYPE_NN" CHECK ((identity_type IS NOT NULL)),
    CONSTRAINT "IDENTITIES_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.identities OWNER TO postgres;

--
-- Name: lifetime_except; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lifetime_except (
    id uuid NOT NULL,
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    did_type public."LIFETIME_EXCEPT_TYPE_CHK" NOT NULL,
    account character varying(25) NOT NULL,
    pattern character varying(255),
    comments character varying(4000),
    state public."LIFETIME_EXCEPT_STATE_CHK",
    expires_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "LIFETIME_EXCEPT_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "LIFETIME_EXCEPT_DID_TYPE_NN" CHECK ((did_type IS NOT NULL)),
    CONSTRAINT "LIFETIME_EXCEPT_NAME_NN" CHECK ((name IS NOT NULL)),
    CONSTRAINT "LIFETIME_EXCEPT_SCOPE_NN" CHECK ((scope IS NOT NULL)),
    CONSTRAINT "LIFETIME_EXCEPT_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.lifetime_except OWNER TO postgres;

--
-- Name: locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locks (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    rule_id uuid NOT NULL,
    rse_id uuid NOT NULL,
    account character varying(25),
    bytes bigint,
    state public."LOCKS_STATE_CHK",
    repair_cnt bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "LOCKS_ACCOUNT_NN" CHECK ((account IS NOT NULL)),
    CONSTRAINT "LOCKS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "LOCKS_STATE_NN" CHECK ((state IS NOT NULL)),
    CONSTRAINT "LOCKS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.locks OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id uuid NOT NULL,
    event_type character varying(1024),
    payload character varying(4000),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "MESSAGES_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "MESSAGES_EVENT_TYPE_NN" CHECK ((event_type IS NOT NULL)),
    CONSTRAINT "MESSAGES_PAYLOAD_NN" CHECK ((payload IS NOT NULL)),
    CONSTRAINT "MESSAGES_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: messages_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages_history (
    id uuid NOT NULL,
    event_type character varying(1024),
    payload character varying(4000),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "MESSAGES_HISTORY_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "MESSAGES_HISTORY_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.messages_history OWNER TO postgres;

--
-- Name: naming_conventions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.naming_conventions (
    scope character varying(25) NOT NULL,
    regexp character varying(255),
    convention_type public."CVT_TYPE_CHK",
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "NAMING_CONVENTIONS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "NAMING_CONVENTIONS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.naming_conventions OWNER TO postgres;

--
-- Name: quarantined_replicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quarantined_replicas (
    rse_id uuid NOT NULL,
    path character varying(1024) NOT NULL,
    bytes bigint,
    md5 character varying(32),
    adler32 character varying(8),
    scope character varying(25),
    name character varying(250),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "QURD_REPLICAS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "QURD_REPLICAS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.quarantined_replicas OWNER TO postgres;

--
-- Name: quarantined_replicas_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quarantined_replicas_history (
    rse_id uuid NOT NULL,
    path character varying(1024) NOT NULL,
    bytes bigint,
    md5 character varying(32),
    adler32 character varying(8),
    scope character varying(25),
    name character varying(250),
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.quarantined_replicas_history OWNER TO postgres;

--
-- Name: replicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.replicas (
    rse_id uuid NOT NULL,
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    bytes bigint,
    md5 character varying(32),
    adler32 character varying(8),
    path character varying(1024),
    state public."REPLICAS_STATE_CHK",
    lock_cnt integer DEFAULT 0,
    accessed_at timestamp without time zone,
    tombstone timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "REPLICAS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "REPLICAS_LOCK_CNT_NN" CHECK ((lock_cnt IS NOT NULL)),
    CONSTRAINT "REPLICAS_SIZE_NN" CHECK ((bytes IS NOT NULL)),
    CONSTRAINT "REPLICAS_STATE_NN" CHECK ((state IS NOT NULL)),
    CONSTRAINT "REPLICAS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.replicas OWNER TO postgres;

--
-- Name: replicas_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.replicas_history (
    rse_id uuid NOT NULL,
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    bytes bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "REPLICAS_HISTORY_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "REPLICAS_HISTORY_UPDATED_NN" CHECK ((updated_at IS NOT NULL)),
    CONSTRAINT "REPLICAS_HIST_SIZE_NN" CHECK ((bytes IS NOT NULL))
);


ALTER TABLE public.replicas_history OWNER TO postgres;

--
-- Name: requests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests (
    id uuid NOT NULL,
    request_type public."REQUESTS_TYPE_CHK",
    scope character varying(25),
    name character varying(250),
    did_type public."REQUESTS_DIDTYPE_CHK",
    dest_rse_id uuid,
    source_rse_id uuid,
    attributes character varying(4000),
    state public."REQUESTS_STATE_CHK",
    external_id character varying(64),
    external_host character varying(256),
    retry_count integer DEFAULT 0,
    err_msg character varying(4000),
    previous_attempt_id uuid,
    rule_id uuid,
    activity character varying(50),
    bytes bigint,
    md5 character varying(32),
    adler32 character varying(8),
    dest_url character varying(2048),
    submitted_at timestamp without time zone,
    started_at timestamp without time zone,
    transferred_at timestamp without time zone,
    estimated_at timestamp without time zone,
    submitter_id integer,
    estimated_started_at timestamp without time zone,
    estimated_transferred_at timestamp without time zone,
    account character varying(25),
    requested_at timestamp without time zone,
    priority integer,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "REQUESTS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "REQUESTS_RSE_ID_NN" CHECK ((dest_rse_id IS NOT NULL)),
    CONSTRAINT "REQUESTS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.requests OWNER TO postgres;

--
-- Name: requests_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requests_history (
    id uuid NOT NULL,
    request_type public."RUCIO_ENUM_5c1b4e",
    scope character varying(25),
    name character varying(250),
    did_type public."RUCIO_ENUM_641aed",
    dest_rse_id uuid,
    source_rse_id uuid,
    attributes character varying(4000),
    state public."RUCIO_ENUM_26544b",
    external_id character varying(64),
    external_host character varying(256),
    retry_count integer DEFAULT 0,
    err_msg character varying(4000),
    previous_attempt_id uuid,
    rule_id uuid,
    activity character varying(50),
    bytes bigint,
    md5 character varying(32),
    adler32 character varying(8),
    dest_url character varying(2048),
    submitted_at timestamp without time zone,
    started_at timestamp without time zone,
    transferred_at timestamp without time zone,
    estimated_at timestamp without time zone,
    submitter_id integer,
    estimated_started_at timestamp without time zone,
    estimated_transferred_at timestamp without time zone,
    account character varying(25),
    requested_at timestamp without time zone,
    priority integer,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.requests_history OWNER TO postgres;

--
-- Name: rse_attr_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rse_attr_map (
    rse_id uuid NOT NULL,
    key character varying(255) NOT NULL,
    value character varying(255),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RSE_ATTR_MAP_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RSE_ATTR_MAP_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rse_attr_map OWNER TO postgres;

--
-- Name: rse_limits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rse_limits (
    rse_id uuid NOT NULL,
    name character varying(255) NOT NULL,
    value bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RSE_LIMITS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RSE_LIMITS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rse_limits OWNER TO postgres;

--
-- Name: rse_protocols; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rse_protocols (
    rse_id uuid NOT NULL,
    scheme character varying(255) NOT NULL,
    hostname character varying(255) DEFAULT ''::character varying NOT NULL,
    port integer DEFAULT 0 NOT NULL,
    prefix character varying(1024),
    impl character varying(255) NOT NULL,
    read_lan integer DEFAULT 0,
    write_lan integer DEFAULT 0,
    delete_lan integer DEFAULT 0,
    read_wan integer DEFAULT 0,
    write_wan integer DEFAULT 0,
    delete_wan integer DEFAULT 0,
    third_party_copy integer DEFAULT 0,
    extended_attributes character varying(1024),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RSE_PROTOCOLS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RSE_PROTOCOLS_IMPL_NN" CHECK ((impl IS NOT NULL)),
    CONSTRAINT "RSE_PROTOCOLS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rse_protocols OWNER TO postgres;

--
-- Name: rse_transfer_limits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rse_transfer_limits (
    rse_id uuid NOT NULL,
    activity character varying(50) NOT NULL,
    rse_expression character varying(3000),
    max_transfers bigint,
    transfers bigint,
    waitings bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RSE_TRANSFER_LIMITS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RSE_TRANSFER_LIMITS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rse_transfer_limits OWNER TO postgres;

--
-- Name: rse_usage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rse_usage (
    rse_id uuid NOT NULL,
    source character varying(255) NOT NULL,
    used bigint,
    free bigint,
    files bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RSE_USAGE_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RSE_USAGE_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rse_usage OWNER TO postgres;

--
-- Name: rse_usage_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rse_usage_history (
    rse_id uuid NOT NULL,
    source character varying(255) NOT NULL,
    used bigint,
    free bigint,
    files bigint,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.rse_usage_history OWNER TO postgres;

--
-- Name: rses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rses (
    id uuid NOT NULL,
    rse character varying(255),
    rse_type public."RSES_TYPE_CHK",
    deterministic boolean,
    volatile boolean,
    staging_area boolean,
    city character varying(255),
    region_code character varying(2),
    country_name character varying(255),
    continent character varying(2),
    time_zone character varying(255),
    "ISP" character varying(255),
    "ASN" character varying(255),
    longitude double precision,
    latitude double precision,
    availability integer DEFAULT 7,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    deleted boolean,
    deleted_at timestamp without time zone,
    CONSTRAINT "RSES_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RSES_DELETED_NN" CHECK ((deleted IS NOT NULL)),
    CONSTRAINT "RSES_RSE__NN" CHECK ((rse IS NOT NULL)),
    CONSTRAINT "RSES_TYPE_NN" CHECK ((rse_type IS NOT NULL)),
    CONSTRAINT "RSES_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rses OWNER TO postgres;

--
-- Name: rules; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules (
    id uuid NOT NULL,
    subscription_id uuid,
    account character varying(25),
    scope character varying(25),
    name character varying(250),
    did_type public."RULES_DID_TYPE_CHK",
    state public."RULES_STATE_CHK",
    error character varying(255),
    rse_expression character varying(3000),
    copies smallint DEFAULT '1'::smallint,
    expires_at timestamp without time zone,
    weight character varying(255),
    locked boolean,
    locks_ok_cnt bigint DEFAULT '0'::bigint,
    locks_replicating_cnt bigint DEFAULT '0'::bigint,
    locks_stuck_cnt bigint DEFAULT '0'::bigint,
    source_replica_expression character varying(255),
    activity character varying(50),
    "grouping" public."RULES_GROUPING_CHK",
    notification public."RULES_NOTIFICATION_CHK",
    stuck_at timestamp without time zone,
    purge_replicas boolean,
    ignore_availability boolean,
    ignore_account_limit boolean,
    priority integer,
    comments character varying(255),
    child_rule_id uuid,
    eol_at timestamp without time zone,
    split_container boolean,
    meta character varying(4000),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RULES_ACCOUNT_NN" CHECK ((account IS NOT NULL)),
    CONSTRAINT "RULES_COPIES_NN" CHECK ((copies IS NOT NULL)),
    CONSTRAINT "RULES_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RULES_GROUPING_NN" CHECK (("grouping" IS NOT NULL)),
    CONSTRAINT "RULES_LOCKED_NN" CHECK ((locked IS NOT NULL)),
    CONSTRAINT "RULES_LOCKS_OK_CNT_NN" CHECK ((locks_ok_cnt IS NOT NULL)),
    CONSTRAINT "RULES_LOCKS_REPLICATING_CNT_NN" CHECK ((locks_replicating_cnt IS NOT NULL)),
    CONSTRAINT "RULES_LOCKS_STUCK_CNT_NN" CHECK ((locks_stuck_cnt IS NOT NULL)),
    CONSTRAINT "RULES_NAME_NN" CHECK ((name IS NOT NULL)),
    CONSTRAINT "RULES_PURGE_REPLICAS_NN" CHECK ((purge_replicas IS NOT NULL)),
    CONSTRAINT "RULES_SCOPE_NN" CHECK ((scope IS NOT NULL)),
    CONSTRAINT "RULES_STATE_NN" CHECK ((state IS NOT NULL)),
    CONSTRAINT "RULES_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rules OWNER TO postgres;

--
-- Name: rules_hist_recent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules_hist_recent (
    history_id uuid NOT NULL,
    id uuid,
    subscription_id uuid,
    account character varying(25),
    scope character varying(25),
    name character varying(250),
    did_type public."RUCIO_ENUM_81e948",
    state public."RUCIO_ENUM_bf843f",
    error character varying(255),
    rse_expression character varying(3000),
    copies smallint,
    expires_at timestamp without time zone,
    weight character varying(255),
    locked boolean,
    locks_ok_cnt bigint,
    locks_replicating_cnt bigint,
    locks_stuck_cnt bigint,
    source_replica_expression character varying(255),
    activity character varying(50),
    "grouping" public."RUCIO_ENUM_093dee",
    notification public."RUCIO_ENUM_072be6",
    stuck_at timestamp without time zone,
    purge_replicas boolean,
    ignore_availability boolean,
    ignore_account_limit boolean,
    priority integer,
    comments character varying(255),
    child_rule_id uuid,
    eol_at timestamp without time zone,
    split_container boolean,
    meta character varying(4000),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RULES_HIST_RECENT_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RULES_HIST_RECENT_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rules_hist_recent OWNER TO postgres;

--
-- Name: rules_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rules_history (
    history_id uuid NOT NULL,
    id uuid,
    subscription_id uuid,
    account character varying(25),
    scope character varying(25),
    name character varying(250),
    did_type public."RUCIO_ENUM_94aeae",
    state public."RUCIO_ENUM_d2322f",
    error character varying(255),
    rse_expression character varying(3000),
    copies smallint,
    expires_at timestamp without time zone,
    weight character varying(255),
    locked boolean,
    locks_ok_cnt bigint,
    locks_replicating_cnt bigint,
    locks_stuck_cnt bigint,
    source_replica_expression character varying(255),
    activity character varying(50),
    "grouping" public."RUCIO_ENUM_505f44",
    notification public."RUCIO_ENUM_6ff01f",
    stuck_at timestamp without time zone,
    priority integer,
    purge_replicas boolean,
    ignore_availability boolean,
    ignore_account_limit boolean,
    comments character varying(255),
    child_rule_id uuid,
    eol_at timestamp without time zone,
    split_container boolean,
    meta character varying(4000),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "RULES_HISTORY_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "RULES_HISTORY_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.rules_history OWNER TO postgres;

--
-- Name: scopes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scopes (
    scope character varying(25) NOT NULL,
    account character varying(25),
    is_default boolean,
    status public."SCOPE_STATUS_CHK",
    closed_at timestamp without time zone,
    deleted_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "SCOPES_ACCOUNT_NN" CHECK ((account IS NOT NULL)),
    CONSTRAINT "SCOPES_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "SCOPES_IS_DEFAULT_NN" CHECK ((is_default IS NOT NULL)),
    CONSTRAINT "SCOPES_STATUS_NN" CHECK ((status IS NOT NULL)),
    CONSTRAINT "SCOPES_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.scopes OWNER TO postgres;

--
-- Name: sources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sources (
    request_id uuid NOT NULL,
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    rse_id uuid NOT NULL,
    dest_rse_id uuid,
    url character varying(2048),
    bytes bigint,
    ranking integer,
    is_using boolean,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "SOURCES_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "SOURCES_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.sources OWNER TO postgres;

--
-- Name: sources_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sources_history (
    request_id uuid NOT NULL,
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    rse_id uuid NOT NULL,
    dest_rse_id uuid,
    url character varying(2048),
    bytes bigint,
    ranking integer,
    is_using boolean,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.sources_history OWNER TO postgres;

--
-- Name: subscriptions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions (
    id uuid NOT NULL,
    name character varying(64),
    filter character varying(2048),
    replication_rules character varying(1024),
    policyid smallint DEFAULT '0'::smallint,
    state public."SUBSCRIPTIONS_STATE_CHK",
    last_processed timestamp without time zone,
    account character varying(25),
    lifetime timestamp without time zone,
    comments character varying(4000),
    retroactive boolean,
    expired_at timestamp without time zone,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "SUBSCRIPTIONS_ACCOUNT_NN" CHECK ((account IS NOT NULL)),
    CONSTRAINT "SUBSCRIPTIONS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "SUBSCRIPTIONS_RETROACTIVE_NN" CHECK ((retroactive IS NOT NULL)),
    CONSTRAINT "SUBSCRIPTIONS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.subscriptions OWNER TO postgres;

--
-- Name: subscriptions_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions_history (
    id uuid NOT NULL,
    name character varying(64),
    filter character varying(2048),
    replication_rules character varying(1024),
    policyid smallint DEFAULT '0'::smallint,
    state public."RUCIO_ENUM_2da83f",
    last_processed timestamp without time zone,
    account character varying(25),
    lifetime timestamp without time zone,
    comments character varying(4000),
    retroactive boolean,
    expired_at timestamp without time zone,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone
);


ALTER TABLE public.subscriptions_history OWNER TO postgres;

--
-- Name: tmp_dids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmp_dids (
    scope character varying(25) NOT NULL,
    name character varying(250) NOT NULL,
    rse_id uuid,
    path character varying(1024),
    bytes bigint,
    md5 character varying(32),
    adler32 character varying(8),
    expired_at timestamp without time zone,
    guid uuid,
    events bigint,
    task_id integer,
    panda_id integer,
    parent_scope character varying(25),
    parent_name character varying(250),
    "offset" bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "TMP_DIDS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "TMP_DIDS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.tmp_dids OWNER TO postgres;

--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    token character varying(352) NOT NULL,
    account character varying(25),
    identity character varying(2048),
    expired_at timestamp without time zone,
    ip character varying(39),
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "TOKENS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "TOKENS_EXPIRED_AT_NN" CHECK ((expired_at IS NOT NULL)),
    CONSTRAINT "TOKENS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: updated_account_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.updated_account_counters (
    id uuid NOT NULL,
    account character varying(25),
    rse_id uuid,
    files bigint,
    bytes bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "UPDATED_ACCNT_CNTRS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "UPDATED_ACCNT_CNTRS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.updated_account_counters OWNER TO postgres;

--
-- Name: updated_col_rep; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.updated_col_rep (
    id uuid NOT NULL,
    scope character varying(25),
    name character varying(250),
    did_type public."UPDATED_COL_REP_TYPE_CHK",
    rse_id uuid,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "UPDATED_COL_REP_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "UPDATED_COL_REP_NAME_NN" CHECK ((name IS NOT NULL)),
    CONSTRAINT "UPDATED_COL_REP_SCOPE_NN" CHECK ((scope IS NOT NULL)),
    CONSTRAINT "UPDATED_COL_REP_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.updated_col_rep OWNER TO postgres;

--
-- Name: updated_dids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.updated_dids (
    id uuid NOT NULL,
    scope character varying(25),
    name character varying(250),
    rule_evaluation_action public."UPDATED_DIDS_RULE_EVAL_ACT_CHK",
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "UPDATED_DIDS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "UPDATED_DIDS_NAME_NN" CHECK ((name IS NOT NULL)),
    CONSTRAINT "UPDATED_DIDS_SCOPE_NN" CHECK ((scope IS NOT NULL)),
    CONSTRAINT "UPDATED_DIDS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.updated_dids OWNER TO postgres;

--
-- Name: updated_rse_counters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.updated_rse_counters (
    id uuid NOT NULL,
    rse_id uuid,
    files bigint,
    bytes bigint,
    updated_at timestamp without time zone,
    created_at timestamp without time zone,
    CONSTRAINT "UPDATED_RSE_CNTRS_CREATED_NN" CHECK ((created_at IS NOT NULL)),
    CONSTRAINT "UPDATED_RSE_CNTRS_UPDATED_NN" CHECK ((updated_at IS NOT NULL))
);


ALTER TABLE public.updated_rse_counters OWNER TO postgres;

--
-- Name: accounts ACCOUNTS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT "ACCOUNTS_PK" PRIMARY KEY (account);


--
-- Name: account_attr_map ACCOUNT_ATTR_MAP_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_attr_map
    ADD CONSTRAINT "ACCOUNT_ATTR_MAP_PK" PRIMARY KEY (account, key);


--
-- Name: account_limits ACCOUNT_LIMITS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_limits
    ADD CONSTRAINT "ACCOUNT_LIMITS_PK" PRIMARY KEY (account, rse_id);


--
-- Name: account_map ACCOUNT_MAP_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_map
    ADD CONSTRAINT "ACCOUNT_MAP_PK" PRIMARY KEY (identity, identity_type, account);


--
-- Name: account_usage_history ACCOUNT_USAGE_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_usage_history
    ADD CONSTRAINT "ACCOUNT_USAGE_HISTORY_PK" PRIMARY KEY (account, rse_id, updated_at);


--
-- Name: account_usage ACCOUNT_USAGE_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_usage
    ADD CONSTRAINT "ACCOUNT_USAGE_PK" PRIMARY KEY (account, rse_id);


--
-- Name: alembic_version ALEMBIC_VERSION_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT "ALEMBIC_VERSION_PK" PRIMARY KEY (version_num);


--
-- Name: archive_contents_history ARCHIVE_CONTENTS_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_contents_history
    ADD CONSTRAINT "ARCHIVE_CONTENTS_HISTORY_PK" PRIMARY KEY (scope, name, child_scope, child_name);


--
-- Name: archive_contents ARCHIVE_CONTENTS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_contents
    ADD CONSTRAINT "ARCHIVE_CONTENTS_PK" PRIMARY KEY (child_scope, child_name, scope, name);


--
-- Name: bad_replicas BAD_REPLICAS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bad_replicas
    ADD CONSTRAINT "BAD_REPLICAS_PK" PRIMARY KEY (scope, name, rse_id, created_at);


--
-- Name: collection_replicas COLLECTION_REPLICAS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_replicas
    ADD CONSTRAINT "COLLECTION_REPLICAS_PK" PRIMARY KEY (scope, name, rse_id);


--
-- Name: configs_history CONFIGS_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configs_history
    ADD CONSTRAINT "CONFIGS_HISTORY_PK" PRIMARY KEY (section, opt, updated_at);


--
-- Name: configs CONFIGS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configs
    ADD CONSTRAINT "CONFIGS_PK" PRIMARY KEY (section, opt);


--
-- Name: contents CONTENTS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT "CONTENTS_PK" PRIMARY KEY (scope, name, child_scope, child_name);


--
-- Name: dataset_locks DATASET_LOCKS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataset_locks
    ADD CONSTRAINT "DATASET_LOCKS_PK" PRIMARY KEY (scope, name, rule_id, rse_id);


--
-- Name: deleted_dids DELETED_DIDS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.deleted_dids
    ADD CONSTRAINT "DELETED_DIDS_PK" PRIMARY KEY (scope, name);


--
-- Name: dids DIDS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dids
    ADD CONSTRAINT "DIDS_PK" PRIMARY KEY (scope, name);


--
-- Name: did_keys DID_KEYS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.did_keys
    ADD CONSTRAINT "DID_KEYS_PK" PRIMARY KEY (key);


--
-- Name: did_key_map DID_KEY_MAP_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.did_key_map
    ADD CONSTRAINT "DID_KEY_MAP_PK" PRIMARY KEY (key, value);


--
-- Name: did_meta DID_META_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.did_meta
    ADD CONSTRAINT "DID_META_PK" PRIMARY KEY (scope, name);


--
-- Name: distances DISTANCES_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distances
    ADD CONSTRAINT "DISTANCES_PK" PRIMARY KEY (src_rse_id, dest_rse_id);


--
-- Name: heartbeats HEARTBEATS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.heartbeats
    ADD CONSTRAINT "HEARTBEATS_PK" PRIMARY KEY (executable, hostname, pid, thread_id);


--
-- Name: identities IDENTITIES_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identities
    ADD CONSTRAINT "IDENTITIES_PK" PRIMARY KEY (identity, identity_type);


--
-- Name: lifetime_except LIFETIME_EXCEPT_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lifetime_except
    ADD CONSTRAINT "LIFETIME_EXCEPT_PK" PRIMARY KEY (id, scope, name, did_type, account);


--
-- Name: locks LOCKS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT "LOCKS_PK" PRIMARY KEY (scope, name, rule_id, rse_id);


--
-- Name: messages_history MESSAGES_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages_history
    ADD CONSTRAINT "MESSAGES_HISTORY_PK" PRIMARY KEY (id);


--
-- Name: messages MESSAGES_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "MESSAGES_PK" PRIMARY KEY (id);


--
-- Name: naming_conventions NAMING_CONVENTIONS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.naming_conventions
    ADD CONSTRAINT "NAMING_CONVENTIONS_PK" PRIMARY KEY (scope);


--
-- Name: quarantined_replicas_history QRD_REPLICAS_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quarantined_replicas_history
    ADD CONSTRAINT "QRD_REPLICAS_HISTORY_PK" PRIMARY KEY (rse_id, path, updated_at);


--
-- Name: quarantined_replicas QUARANTINED_REPLICAS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quarantined_replicas
    ADD CONSTRAINT "QUARANTINED_REPLICAS_PK" PRIMARY KEY (rse_id, path);


--
-- Name: replicas_history REPLICAS_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replicas_history
    ADD CONSTRAINT "REPLICAS_HISTORY_PK" PRIMARY KEY (rse_id, scope, name);


--
-- Name: replicas REPLICAS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replicas
    ADD CONSTRAINT "REPLICAS_PK" PRIMARY KEY (rse_id, scope, name);


--
-- Name: requests_history REQUESTS_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests_history
    ADD CONSTRAINT "REQUESTS_HISTORY_PK" PRIMARY KEY (id, updated_at);


--
-- Name: requests REQUESTS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "REQUESTS_PK" PRIMARY KEY (id);


--
-- Name: rses RSES_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rses
    ADD CONSTRAINT "RSES_PK" PRIMARY KEY (id);


--
-- Name: rses RSES_RSE_UQ; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rses
    ADD CONSTRAINT "RSES_RSE_UQ" UNIQUE (rse);


--
-- Name: rse_attr_map RSE_ATTR_MAP_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_attr_map
    ADD CONSTRAINT "RSE_ATTR_MAP_PK" PRIMARY KEY (rse_id, key);


--
-- Name: rse_limits RSE_LIMITS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_limits
    ADD CONSTRAINT "RSE_LIMITS_PK" PRIMARY KEY (rse_id, name);


--
-- Name: rse_protocols RSE_PROTOCOLS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_protocols
    ADD CONSTRAINT "RSE_PROTOCOLS_PK" PRIMARY KEY (rse_id, scheme, hostname, port);


--
-- Name: rse_transfer_limits RSE_TRANSFER_LIMITS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_transfer_limits
    ADD CONSTRAINT "RSE_TRANSFER_LIMITS_PK" PRIMARY KEY (rse_id, activity);


--
-- Name: rse_usage_history RSE_USAGE_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_usage_history
    ADD CONSTRAINT "RSE_USAGE_HISTORY_PK" PRIMARY KEY (rse_id, source, updated_at);


--
-- Name: rse_usage RSE_USAGE_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_usage
    ADD CONSTRAINT "RSE_USAGE_PK" PRIMARY KEY (rse_id, source);


--
-- Name: rules_history RULES_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules_history
    ADD CONSTRAINT "RULES_HISTORY_PK" PRIMARY KEY (history_id);


--
-- Name: rules_hist_recent RULES_HIST_RECENT_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules_hist_recent
    ADD CONSTRAINT "RULES_HIST_RECENT_PK" PRIMARY KEY (history_id);


--
-- Name: rules RULES_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT "RULES_PK" PRIMARY KEY (id);


--
-- Name: scopes SCOPES_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scopes
    ADD CONSTRAINT "SCOPES_PK" PRIMARY KEY (scope);


--
-- Name: sources_history SOURCES_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources_history
    ADD CONSTRAINT "SOURCES_HISTORY_PK" PRIMARY KEY (request_id, scope, name, rse_id, updated_at);


--
-- Name: sources SOURCES_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT "SOURCES_PK" PRIMARY KEY (request_id, rse_id, scope, name);


--
-- Name: subscriptions_history SUBSCRIPTIONS_HISTORY_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_history
    ADD CONSTRAINT "SUBSCRIPTIONS_HISTORY_PK" PRIMARY KEY (id, updated_at);


--
-- Name: subscriptions SUBSCRIPTIONS_NAME_ACCOUNT_UQ; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "SUBSCRIPTIONS_NAME_ACCOUNT_UQ" UNIQUE (name, account);


--
-- Name: subscriptions SUBSCRIPTIONS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "SUBSCRIPTIONS_PK" PRIMARY KEY (id);


--
-- Name: tmp_dids TMP_DIDS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_dids
    ADD CONSTRAINT "TMP_DIDS_PK" PRIMARY KEY (scope, name);


--
-- Name: tokens TOKENS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT "TOKENS_PK" PRIMARY KEY (token);


--
-- Name: updated_account_counters UPDATED_ACCOUNT_COUNTERS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.updated_account_counters
    ADD CONSTRAINT "UPDATED_ACCOUNT_COUNTERS_PK" PRIMARY KEY (id);


--
-- Name: updated_col_rep UPDATED_COL_REP_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.updated_col_rep
    ADD CONSTRAINT "UPDATED_COL_REP_PK" PRIMARY KEY (id);


--
-- Name: updated_dids UPDATED_DIDS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.updated_dids
    ADD CONSTRAINT "UPDATED_DIDS_PK" PRIMARY KEY (id);


--
-- Name: updated_rse_counters UPDATED_RSE_COUNTERS_PK; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.updated_rse_counters
    ADD CONSTRAINT "UPDATED_RSE_COUNTERS_PK" PRIMARY KEY (id);


--
-- Name: ACCOUNT_ATTR_MAP_KEY_VALUE_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ACCOUNT_ATTR_MAP_KEY_VALUE_IDX" ON public.account_attr_map USING btree (key, value);


--
-- Name: ARCH_CONTENTS_CHILD_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ARCH_CONTENTS_CHILD_IDX" ON public.archive_contents USING btree (scope, name, child_scope, child_name);


--
-- Name: BAD_REPLICAS_STATE_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "BAD_REPLICAS_STATE_IDX" ON public.bad_replicas USING btree (rse_id, state);


--
-- Name: COLLECTION_REPLICAS_RSE_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "COLLECTION_REPLICAS_RSE_ID_IDX" ON public.collection_replicas USING btree (rse_id);


--
-- Name: CONTENTS_CHILD_SCOPE_NAME_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CONTENTS_CHILD_SCOPE_NAME_IDX" ON public.contents USING btree (child_scope, child_name, scope, name);


--
-- Name: CONTENTS_HISTORY_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "CONTENTS_HISTORY_IDX" ON public.contents_history USING btree (scope, name);


--
-- Name: DATASET_LOCKS_RSE_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DATASET_LOCKS_RSE_ID_IDX" ON public.dataset_locks USING btree (rse_id);


--
-- Name: DATASET_LOCKS_RULE_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DATASET_LOCKS_RULE_ID_IDX" ON public.dataset_locks USING btree (rule_id);


--
-- Name: DIDS_EXPIRED_AT_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DIDS_EXPIRED_AT_IDX" ON public.dids USING btree (expired_at);


--
-- Name: DIDS_IS_NEW_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DIDS_IS_NEW_IDX" ON public.dids USING btree (is_new);


--
-- Name: DISTANCES_DEST_RSEID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "DISTANCES_DEST_RSEID_IDX" ON public.distances USING btree (dest_rse_id);


--
-- Name: HEARTBEATS_UPDATED_AT; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "HEARTBEATS_UPDATED_AT" ON public.heartbeats USING btree (updated_at);


--
-- Name: LOCKS_RULE_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "LOCKS_RULE_ID_IDX" ON public.locks USING btree (rule_id);


--
-- Name: QUARANTINED_REPLICAS_PATH_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "QUARANTINED_REPLICAS_PATH_IDX" ON public.quarantined_replicas USING btree (path, rse_id);


--
-- Name: REPLICAS_PATH_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REPLICAS_PATH_IDX" ON public.replicas USING btree (path);


--
-- Name: REPLICAS_TOMBSTONE_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REPLICAS_TOMBSTONE_IDX" ON public.replicas USING btree (tombstone);


--
-- Name: REQUESTS_EXTERNALID_UQ; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REQUESTS_EXTERNALID_UQ" ON public.requests USING btree (external_id);


--
-- Name: REQUESTS_RULEID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REQUESTS_RULEID_IDX" ON public.requests USING btree (rule_id);


--
-- Name: REQUESTS_SCOPE_NAME_RSE_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REQUESTS_SCOPE_NAME_RSE_IDX" ON public.requests USING btree (scope, name, dest_rse_id, request_type);


--
-- Name: REQUESTS_TYP_STA_UPD_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REQUESTS_TYP_STA_UPD_IDX" ON public.requests USING btree (request_type, state, activity);


--
-- Name: REQUESTS_TYP_STA_UPD_IDX_OLD; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "REQUESTS_TYP_STA_UPD_IDX_OLD" ON public.requests USING btree (request_type, state, updated_at);


--
-- Name: RSE_ATTR_MAP_KEY_VALUE_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RSE_ATTR_MAP_KEY_VALUE_IDX" ON public.rse_attr_map USING btree (key, value);


--
-- Name: RULES_CHILD_RULE_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RULES_CHILD_RULE_ID_IDX" ON public.rules USING btree (child_rule_id);


--
-- Name: RULES_EXPIRES_AT_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RULES_EXPIRES_AT_IDX" ON public.rules USING btree (expires_at);


--
-- Name: RULES_HISTORY_SCOPENAME_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RULES_HISTORY_SCOPENAME_IDX" ON public.rules_history USING btree (scope, name);


--
-- Name: RULES_HIST_RECENT_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RULES_HIST_RECENT_ID_IDX" ON public.rules_hist_recent USING btree (id);


--
-- Name: RULES_HIST_RECENT_SC_NA_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RULES_HIST_RECENT_SC_NA_IDX" ON public.rules_hist_recent USING btree (scope, name);


--
-- Name: RULES_SCOPE_NAME_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RULES_SCOPE_NAME_IDX" ON public.rules USING btree (scope, name);


--
-- Name: RULES_SC_NA_AC_RS_CO_UQ_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "RULES_SC_NA_AC_RS_CO_UQ_IDX" ON public.rules USING btree (scope, name, account, rse_expression, copies);


--
-- Name: RULES_STUCKSTATE_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "RULES_STUCKSTATE_IDX" ON public.rules USING btree (state);


--
-- Name: SOURCES_DEST_RSEID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SOURCES_DEST_RSEID_IDX" ON public.sources USING btree (dest_rse_id);


--
-- Name: SOURCES_SC_NM_DST_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SOURCES_SC_NM_DST_IDX" ON public.sources USING btree (scope, rse_id, name);


--
-- Name: SOURCES_SRC_DST_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "SOURCES_SRC_DST_IDX" ON public.sources USING btree (rse_id, dest_rse_id);


--
-- Name: TMP_DIDS_EXPIRED_AT_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TMP_DIDS_EXPIRED_AT_IDX" ON public.tmp_dids USING btree (expired_at);


--
-- Name: TOKENS_ACCOUNT_EXPIRED_AT_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "TOKENS_ACCOUNT_EXPIRED_AT_IDX" ON public.tokens USING btree (account, expired_at);


--
-- Name: UPDATED_ACCNT_CNTRS_RSE_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UPDATED_ACCNT_CNTRS_RSE_ID_IDX" ON public.updated_account_counters USING btree (account, rse_id);


--
-- Name: UPDATED_COL_REP_SNR_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UPDATED_COL_REP_SNR_IDX" ON public.updated_col_rep USING btree (scope, name, rse_id);


--
-- Name: UPDATED_DIDS_SCOPERULENAME_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UPDATED_DIDS_SCOPERULENAME_IDX" ON public.updated_dids USING btree (scope, rule_evaluation_action, name);


--
-- Name: UPDATED_RSE_CNTRS_RSE_ID_IDX; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "UPDATED_RSE_CNTRS_RSE_ID_IDX" ON public.updated_rse_counters USING btree (rse_id);


--
-- Name: account_attr_map ACCOUNT_ATTR_MAP_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_attr_map
    ADD CONSTRAINT "ACCOUNT_ATTR_MAP_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: account_limits ACCOUNT_LIMITS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_limits
    ADD CONSTRAINT "ACCOUNT_LIMITS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: account_limits ACCOUNT_LIMITS_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_limits
    ADD CONSTRAINT "ACCOUNT_LIMITS_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: account_map ACCOUNT_MAP_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_map
    ADD CONSTRAINT "ACCOUNT_MAP_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: account_map ACCOUNT_MAP_ID_TYPE_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_map
    ADD CONSTRAINT "ACCOUNT_MAP_ID_TYPE_FK" FOREIGN KEY (identity, identity_type) REFERENCES public.identities(identity, identity_type);


--
-- Name: account_usage ACCOUNT_USAGE_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_usage
    ADD CONSTRAINT "ACCOUNT_USAGE_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: account_usage ACCOUNT_USAGE_RSES_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_usage
    ADD CONSTRAINT "ACCOUNT_USAGE_RSES_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: archive_contents ARCH_CONTENTS_CHILD_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_contents
    ADD CONSTRAINT "ARCH_CONTENTS_CHILD_FK" FOREIGN KEY (child_scope, child_name) REFERENCES public.dids(scope, name) ON DELETE CASCADE;


--
-- Name: archive_contents ARCH_CONTENTS_PARENT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archive_contents
    ADD CONSTRAINT "ARCH_CONTENTS_PARENT_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: bad_replicas BAD_REPLICAS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bad_replicas
    ADD CONSTRAINT "BAD_REPLICAS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: collection_replicas COLLECTION_REPLICAS_LFN_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_replicas
    ADD CONSTRAINT "COLLECTION_REPLICAS_LFN_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: collection_replicas COLLECTION_REPLICAS_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_replicas
    ADD CONSTRAINT "COLLECTION_REPLICAS_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: contents CONTENTS_CHILD_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT "CONTENTS_CHILD_ID_FK" FOREIGN KEY (child_scope, child_name) REFERENCES public.dids(scope, name) ON DELETE CASCADE;


--
-- Name: contents CONTENTS_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.contents
    ADD CONSTRAINT "CONTENTS_ID_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: dataset_locks DATASET_LOCKS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataset_locks
    ADD CONSTRAINT "DATASET_LOCKS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: dataset_locks DATASET_LOCKS_DID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataset_locks
    ADD CONSTRAINT "DATASET_LOCKS_DID_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: dataset_locks DATASET_LOCKS_RULE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dataset_locks
    ADD CONSTRAINT "DATASET_LOCKS_RULE_ID_FK" FOREIGN KEY (rule_id) REFERENCES public.rules(id);


--
-- Name: dids DIDS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dids
    ADD CONSTRAINT "DIDS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account) ON DELETE CASCADE;


--
-- Name: dids DIDS_SCOPE_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dids
    ADD CONSTRAINT "DIDS_SCOPE_FK" FOREIGN KEY (scope) REFERENCES public.scopes(scope);


--
-- Name: did_key_map DID_MAP_KEYS_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.did_key_map
    ADD CONSTRAINT "DID_MAP_KEYS_FK" FOREIGN KEY (key) REFERENCES public.did_keys(key);


--
-- Name: did_meta DID_META_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.did_meta
    ADD CONSTRAINT "DID_META_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: distances DISTANCES_DEST_RSES_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distances
    ADD CONSTRAINT "DISTANCES_DEST_RSES_FK" FOREIGN KEY (dest_rse_id) REFERENCES public.rses(id);


--
-- Name: distances DISTANCES_SRC_RSES_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distances
    ADD CONSTRAINT "DISTANCES_SRC_RSES_FK" FOREIGN KEY (src_rse_id) REFERENCES public.rses(id);


--
-- Name: lifetime_except LIFETIME_EXCEPT_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lifetime_except
    ADD CONSTRAINT "LIFETIME_EXCEPT_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: locks LOCKS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT "LOCKS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: locks LOCKS_RULE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locks
    ADD CONSTRAINT "LOCKS_RULE_ID_FK" FOREIGN KEY (rule_id) REFERENCES public.rules(id);


--
-- Name: naming_conventions NAMING_CONVENTIONS_SCOPE_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.naming_conventions
    ADD CONSTRAINT "NAMING_CONVENTIONS_SCOPE_FK" FOREIGN KEY (scope) REFERENCES public.scopes(scope);


--
-- Name: quarantined_replicas QURD_REPLICAS_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quarantined_replicas
    ADD CONSTRAINT "QURD_REPLICAS_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: replicas_history REPLICAS_HIST_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replicas_history
    ADD CONSTRAINT "REPLICAS_HIST_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: replicas REPLICAS_LFN_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replicas
    ADD CONSTRAINT "REPLICAS_LFN_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: replicas REPLICAS_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.replicas
    ADD CONSTRAINT "REPLICAS_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: requests REQUESTS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "REQUESTS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: requests REQUESTS_DID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "REQUESTS_DID_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: requests REQUESTS_RSES_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT "REQUESTS_RSES_FK" FOREIGN KEY (dest_rse_id) REFERENCES public.rses(id);


--
-- Name: rse_attr_map RSE_ATTR_MAP_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_attr_map
    ADD CONSTRAINT "RSE_ATTR_MAP_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: rse_limits RSE_LIMIT_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_limits
    ADD CONSTRAINT "RSE_LIMIT_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: rse_protocols RSE_PROTOCOL_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_protocols
    ADD CONSTRAINT "RSE_PROTOCOL_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: rse_transfer_limits RSE_TRANSFER_LIMITS_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_transfer_limits
    ADD CONSTRAINT "RSE_TRANSFER_LIMITS_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: rse_usage RSE_USAGE_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rse_usage
    ADD CONSTRAINT "RSE_USAGE_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: rules RULES_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT "RULES_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: rules RULES_CHILD_RULE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT "RULES_CHILD_RULE_ID_FK" FOREIGN KEY (child_rule_id) REFERENCES public.rules(id);


--
-- Name: rules RULES_SCOPE_NAME_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT "RULES_SCOPE_NAME_FK" FOREIGN KEY (scope, name) REFERENCES public.dids(scope, name);


--
-- Name: rules RULES_SUBS_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rules
    ADD CONSTRAINT "RULES_SUBS_ID_FK" FOREIGN KEY (subscription_id) REFERENCES public.subscriptions(id);


--
-- Name: scopes SCOPES_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scopes
    ADD CONSTRAINT "SCOPES_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: sources SOURCES_DEST_RSES_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT "SOURCES_DEST_RSES_FK" FOREIGN KEY (dest_rse_id) REFERENCES public.rses(id);


--
-- Name: sources SOURCES_REPLICA_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT "SOURCES_REPLICA_FK" FOREIGN KEY (scope, name, rse_id) REFERENCES public.replicas(scope, name, rse_id);


--
-- Name: sources SOURCES_REQ_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT "SOURCES_REQ_ID_FK" FOREIGN KEY (request_id) REFERENCES public.requests(id);


--
-- Name: sources SOURCES_RSES_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sources
    ADD CONSTRAINT "SOURCES_RSES_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: subscriptions SUBSCRIPTIONS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions
    ADD CONSTRAINT "SUBSCRIPTIONS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: tokens TOKENS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT "TOKENS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: updated_account_counters UPDATED_ACCNT_CNTRS_ACCOUNT_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.updated_account_counters
    ADD CONSTRAINT "UPDATED_ACCNT_CNTRS_ACCOUNT_FK" FOREIGN KEY (account) REFERENCES public.accounts(account);


--
-- Name: updated_account_counters UPDATED_ACCNT_CNTRS_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.updated_account_counters
    ADD CONSTRAINT "UPDATED_ACCNT_CNTRS_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- Name: updated_rse_counters UPDATED_RSE_CNTRS_RSE_ID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.updated_rse_counters
    ADD CONSTRAINT "UPDATED_RSE_CNTRS_RSE_ID_FK" FOREIGN KEY (rse_id) REFERENCES public.rses(id);


--
-- PostgreSQL database dump complete
--

