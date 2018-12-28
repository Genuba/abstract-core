--
-- Name: type_to_ge_srvcio; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_srvcio AS (
	servicio_servicio character varying(50),
	servicio_modulo character varying(20),
	servicio_descri character varying(200),
	servicio_nomb character varying(100),
	surl_url character varying(2000),
	modulo_modulo character varying(20),
	modulo_descri character varying(200),
	modulo_nomb character varying(100),
	menu_nombre character varying(100),
	menu_icon character varying(100),
	menu_menu character varying(100)
);

ALTER TYPE ow_base_us.type_to_ge_srvcio OWNER TO ow_base_us;