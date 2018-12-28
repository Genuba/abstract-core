--
-- Name: type_to_au_token; Type: TYPE; Schema: ow_base_us; Owner: ow_base_us
--

CREATE TYPE ow_base_us.type_to_au_token AS (
	token_token double precision,
	token_usuario character varying(32),
	token_codigo character varying(32),
	token_feccre timestamp(0) without time zone,
	token_fecexp timestamp(0) without time zone,
	token_estado character varying(3)
);

ALTER TYPE ow_base_us.type_to_au_token OWNER TO ow_base_us;