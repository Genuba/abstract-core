--
-- Name: type_to_au_inlog; Type: TYPE; Schema: ada_db_us; Owner: ada_db_us
--

CREATE TYPE ada_db_us.type_to_au_inlog AS (
	inlog_inlog double precision,
	inlog_usuario character varying(32),
	inlog_fecha timestamp(0) without time zone,
	inlog_ip character varying(32),
	inlog_resultado character varying(10)
);

ALTER TYPE ada_db_us.type_to_au_inlog OWNER TO ada_db_us;