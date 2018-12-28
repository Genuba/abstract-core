--
-- Name: type_to_au_inlog; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_au_inlog AS (
	inlog_inlog double precision,
	inlog_usuario character varying(32),
	inlog_fecha timestamp(0) without time zone,
	inlog_ip character varying(32),
	inlog_resultado character varying(10)
);

ALTER TYPE ow_base_us.type_to_au_inlog OWNER TO ow_base_us;