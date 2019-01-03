-- Table: ada_db_us.aut_ttoken

CREATE TABLE ada_db_us.aut_ttoken
(
    token_token double precision NOT NULL,
    token_usuario character varying(32) COLLATE pg_catalog."default" NOT NULL,
    token_codigo character varying(32) COLLATE pg_catalog."default" NOT NULL,
    token_feccre timestamp(0) without time zone NOT NULL,
    token_fecexp timestamp(0) without time zone NOT NULL,
    token_estado character varying(3) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_ttoken
    OWNER to ada_db_us;

COMMENT ON COLUMN ada_db_us.aut_ttoken.token_token
    IS 'CODIGO ID DEL REGISTRO CONSECUTIVO';

COMMENT ON COLUMN ada_db_us.aut_ttoken.token_usuario
    IS 'USUARIO A LA CUAL PERTENECE EL TOKEN';

COMMENT ON COLUMN ada_db_us.aut_ttoken.token_codigo
    IS 'TOKEN GENERADO';

COMMENT ON COLUMN ada_db_us.aut_ttoken.token_feccre
    IS 'MARCA DE TIEMPO DE LA GENERACION DEL TOKEN';

COMMENT ON COLUMN ada_db_us.aut_ttoken.token_fecexp
    IS 'MARCA DE TIEMPO DE LA EXPIRACION DEL TOKEN';

COMMENT ON COLUMN ada_db_us.aut_ttoken.token_estado
    IS 'ESTADO DEL TOKEN: ACT (ACTIVO), VEN(VENCIDO), USE(USADO)';
    
    --
-- Name: aut_ttoken pk_aut_ttoken; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_ttoken
    ADD CONSTRAINT pk_aut_ttoken PRIMARY KEY (token_token);