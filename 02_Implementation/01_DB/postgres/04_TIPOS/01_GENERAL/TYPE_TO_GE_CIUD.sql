--
-- Name: type_to_ge_ciud; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_ciud AS (
	ciud_ciud double precision,
	ciud_nombre character varying(128),
	ciud_depto double precision
);

ALTER TYPE ow_base_us.type_to_ge_ciud OWNER TO ow_base_us;