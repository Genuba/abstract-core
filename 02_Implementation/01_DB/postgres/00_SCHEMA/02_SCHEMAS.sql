-- ******************************************************************
-- Fecha         : 11/04/2018
-- Realizado por : Ownk
-- Base de Datos : &PROYECTO
-- ******************************************************************

--
-- PostgreSQL database dump
--

-- Database: OW_BASE

CREATE DATABASE "OW_BASE"
    WITH 
    OWNER = ow_base_us
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

-- Cambio de usuario
\c OW_BASE 

--
-- Name: ow_base_ext; Type: SCHEMA; Schema: -; Owner: ow_base_us
--

CREATE SCHEMA ow_base_ext;


ALTER SCHEMA ow_base_ext OWNER TO ow_base_us;


--
-- Name: ow_base_us; Type: SCHEMA; Schema: -; Owner: ow_base_us
--

CREATE SCHEMA ow_base_us;


ALTER SCHEMA ow_base_us OWNER TO ow_base_us;

;
