--
-- Name: type_to_au_tpersn; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_au_tpersn AS (
	persn_persn double precision,
	persn_tpident character varying(2),
	persn_numident character varying(16),
	persn_pnombre character varying(64),
	persn_snombre character varying(64),
	persn_papellido character varying(64),
	persn_sapellido character varying(64),
	persn_celular character varying(32),
	persn_fijo character varying(32),
	persn_email character varying(128),
	persn_direccion character varying(256),
	persn_pais double precision,
	persn_depto double precision,
	persn_ciud double precision,
	persn_usrcre character varying(32),
	persn_fecact timestamp(0) without time zone,
	persn_feccre timestamp(0) without time zone,
	persn_origen character varying(128),
	persn_estado character varying(128),
	persn_pais_desc character varying(128),
	persn_depto_desc character varying(128),
	persn_ciud_desc character varying(128)
);

ALTER TYPE ow_base_us.type_to_au_tpersn OWNER TO ow_base_us;