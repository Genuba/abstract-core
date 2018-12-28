--
-- Name: type_to_ge_pais; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_pais AS (
	pais_pais numeric(8,0),
	pais_nombre character varying(128),
	pais_cod_iso character varying(3),
	pais_cod_area character varying(16)
);

ALTER TYPE ow_base_us.type_to_ge_pais OWNER TO ow_base_us;