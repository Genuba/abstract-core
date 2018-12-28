--
-- Name: type_to_au_rol; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_au_rol AS (
	rol_rol character varying(20),
	rol_descri character varying(100),
	rol_is_sistema character varying(10)
);

ALTER TYPE ow_base_us.type_to_au_rol OWNER TO ow_base_us;