--
-- Name: type_to_ge_depto; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_depto AS (
	depto_depto numeric(8,0),
	depto_nombre character varying(128),
	depto_pais numeric(8,0)
);

ALTER TYPE ow_base_us.type_to_ge_depto OWNER TO ow_base_us;