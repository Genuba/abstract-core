--
-- Name: type_to_ge_modulo; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_modulo AS (
	modulo_modulo character varying(100),
	modulo_descri character varying(100),
	modulo_nomb character varying(100)
);

ALTER TYPE ow_base_us.type_to_ge_modulo OWNER TO ow_base_us;