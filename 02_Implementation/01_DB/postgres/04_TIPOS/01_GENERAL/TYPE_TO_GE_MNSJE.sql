--
-- Name: type_to_ge_mnsje; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_mnsje AS (
	feccre timestamp(0) without time zone,
	prcs character varying(100),
	error character varying(100),
	detalle character varying(4000)
);

ALTER TYPE ow_base_us.type_to_ge_mnsje OWNER TO ow_base_us;