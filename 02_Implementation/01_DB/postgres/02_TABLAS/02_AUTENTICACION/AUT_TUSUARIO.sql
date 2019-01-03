-- Table: ada_db_us.aut_tusuario

CREATE TABLE ada_db_us.aut_tusuario
(
    usuario_usuario character varying(32) COLLATE pg_catalog."default" NOT NULL,
    usuario_persn double precision NOT NULL,
    usuario_clave character varying(128) COLLATE pg_catalog."default",
    usuario_medio_tok character varying(1) COLLATE pg_catalog."default" NOT NULL,
    usuario_tipo_aut character varying(1) COLLATE pg_catalog."default" NOT NULL,
    usuario_recup_tok character varying(64) COLLATE pg_catalog."default",
    usuario_fecrec_tok timestamp(0) without time zone,
    usuario_usrcre character varying(32) COLLATE pg_catalog."default",
    usuario_feccre timestamp(0) without time zone,
    usuario_estado character varying(3) COLLATE pg_catalog."default" NOT NULL,
    usuario_cambio_clave character varying(1) COLLATE pg_catalog."default",
    usuario_avatar character varying(256) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_tusuario
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_us.aut_tusuario
    IS 'TABLA GENERAL DE USUARIOS';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_usuario
    IS 'NOMBNRE DE USUARIO UNICO - LLAVE PRIMARIA';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_persn
    IS 'CODIGO LLAVE FORANEA PERSONA';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_clave
    IS 'CLAVE DEL USUARIO';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_medio_tok
    IS 'SELECTOR DE MEDIO PARANEVI TOKEN M-MAIL C-CELULAR';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_tipo_aut
    IS 'TIPO DE AUTENTICACION T-TOKEN C-CONTRASEĂ‘A';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_recup_tok
    IS 'TOKEND E RECUPERACION DE CONTRASEĂ‘A';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_fecrec_tok
    IS 'FECHA DE CREACION DE TOKEN';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_usrcre
    IS 'USUARIO CREADOR DEL USUARIO';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_feccre
    IS 'FECHA DE CREACION DEL USUARIO';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_estado
    IS 'ESTADO DEL USUARIO ACTIVO, INACTIVO, PRECARGADO, APROBAR TERMMINOS';

COMMENT ON COLUMN ada_db_us.aut_tusuario.usuario_cambio_clave
    IS 'EL USUARIO DEBE CAMBIAR PASSWORD PROXIMO INICIO';
    
--
-- Name: aut_tusuario pk_aut_tusuario; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_tusuario
    ADD CONSTRAINT pk_aut_tusuario PRIMARY KEY (usuario_usuario);