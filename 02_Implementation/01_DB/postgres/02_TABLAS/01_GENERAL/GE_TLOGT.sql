-- Table: ow_base_us.ge_tlogt

CREATE TABLE ow_base_us.ge_tlogt
(
    logt_logt numeric(8,0) NOT NULL,
    logt_proceso character varying(1024) COLLATE pg_catalog."default" NOT NULL,
    logt_valor text COLLATE pg_catalog."default",
    logt_fecha timestamp(0) without time zone
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tlogt
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_tlogt
    IS 'INFORMACION GENERAL DEL CLIENTE';

COMMENT ON COLUMN ow_base_us.ge_tlogt.logt_logt
    IS 'CODIGO UNICO';

COMMENT ON COLUMN ow_base_us.ge_tlogt.logt_proceso
    IS 'PROCESO';

COMMENT ON COLUMN ow_base_us.ge_tlogt.logt_valor
    IS 'FECHA DE CREACION';
    
--
-- Name: ge_tlogt pk_ge_tlogt; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tlogt
    ADD CONSTRAINT pk_ge_tlogt PRIMARY KEY (logt_logt);