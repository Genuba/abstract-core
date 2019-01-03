-- ******************************************************************
-- Fecha         : 01/02/2019
-- Realizado por : Ada
-- Base de Datos : &PROYECTO
-- ******************************************************************

--
-- PostgreSQL datadb dump
--

-- Datadb: ADA_DB

CREATE DATADB "ADA_DB"
    WITH
    OWNER = ada_db_us
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Cambio de usuario
\c ADA_DB

--
-- Name: ada_db_ext; Type: SCHEMA; Schema: -; Owner: ada_db_us
--

CREATE SCHEMA ada_db_ext;


ALTER SCHEMA ada_db_ext OWNER TO ada_db_us;


--
-- Name: ada_db_us; Type: SCHEMA; Schema: -; Owner: ada_db_us
--

CREATE SCHEMA ada_db_us;


ALTER SCHEMA ada_db_us OWNER TO ada_db_us;

;
