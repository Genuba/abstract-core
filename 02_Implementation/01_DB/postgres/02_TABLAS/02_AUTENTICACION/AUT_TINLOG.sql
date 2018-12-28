-- Table: ow_base_us.aut_tinlog

CREATE TABLE ow_base_us.aut_tinlog
(
    inlog_inlog double precision NOT NULL,
    inlog_usuario character varying(32) COLLATE pg_catalog."default" NOT NULL,
    inlog_fecha timestamp(0) without time zone NOT NULL,
    inlog_ip character varying(32) COLLATE pg_catalog."default" NOT NULL,
    inlog_resultado character varying(10) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.aut_tinlog
    OWNER to ow_base_us;

COMMENT ON COLUMN ow_base_us.aut_tinlog.inlog_inlog
    IS 'CONSECUTIVO DEL LOG';

COMMENT ON COLUMN ow_base_us.aut_tinlog.inlog_usuario
    IS 'USUARIO QUE GENERO EL LOG DE INICIO';

COMMENT ON COLUMN ow_base_us.aut_tinlog.inlog_fecha
    IS 'MARCA DE TIEMPO';

COMMENT ON COLUMN ow_base_us.aut_tinlog.inlog_ip
    IS 'IP DESDE DONDE SE GENERO EL LOG';

COMMENT ON COLUMN ow_base_us.aut_tinlog.inlog_resultado
    IS 'RESULTADO DEL INTENTO DE INICIO SE SESION';
    
    --
-- Name: aut_tinlog pk_aut_tinlog; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tinlog
    ADD CONSTRAINT pk_aut_tinlog PRIMARY KEY (inlog_inlog);