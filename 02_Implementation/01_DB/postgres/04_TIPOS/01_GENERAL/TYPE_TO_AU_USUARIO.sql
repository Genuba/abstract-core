--
-- Name: type_to_au_usuario; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_au_usuario AS (
	usuario_usuario character varying(32),
	usuario_persn double precision,
	usuario_clave character varying(128),
	usuario_mail character varying(128),
	usuario_celular character varying(32),
	usuario_medio_tok character varying(1),
	usuario_tipo_aut character varying(1),
	usuario_recup_tok character varying(64),
	usuario_fecrec_tok timestamp(0) without time zone,
	usuario_usrcre character varying(32),
	usuario_feccre timestamp(0) without time zone,
	usuario_estado character varying(10),
	usuario_cambio_clave character varying(1),
	usuario_avatar character varying(256),
	usuario_estado_desc character varying(32)
);

ALTER TYPE ow_base_us.type_to_au_usuario OWNER TO ow_base_us;