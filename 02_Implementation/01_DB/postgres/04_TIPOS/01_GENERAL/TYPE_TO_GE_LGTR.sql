--
-- Name: type_to_ge_lgtr; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_lgtr AS (
	trans character varying(100),
	terminal character varying(100),
	usuario character varying(100),
	fech_oper character varying(100),
	hora_oper character varying(100),
	observacion character varying(1000)
);

ALTER TYPE ow_base_us.type_to_ge_lgtr OWNER TO ow_base_us;