--
-- Name: type_to_ge_tpdoc; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_tpdoc AS (
	tdoc_tdoc character varying(3),
	tdoc_doc character varying(64),
	tdoc_tper character varying(3)
);

ALTER TYPE ow_base_us.type_to_ge_tpdoc OWNER TO ow_base_us;