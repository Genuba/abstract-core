--
-- Name: type_to_ge_menu; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_ge_menu AS (
	menu_menu character varying(100),
	menu_orden character varying(50),
	menu_nombre character varying(100),
	menu_descri character varying(1000),
	menu_icon character varying(100)
);

ALTER TYPE ow_base_us.type_to_ge_menu OWNER TO ow_base_us;
