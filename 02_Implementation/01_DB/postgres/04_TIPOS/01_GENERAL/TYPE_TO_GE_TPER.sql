--
-- Name: type_to_ge_tper; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_tper AS (
	tper_tper character varying(3),
	tper_per character varying(64)
);

ALTER TYPE ow_base_us.type_to_ge_tper OWNER TO ow_base_us;