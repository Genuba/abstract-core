-- Table: ow_base_us.ge_ttper

CREATE TABLE ow_base_us.ge_ttper
(
    tper_tper character varying(3) COLLATE pg_catalog."default" NOT NULL,
    tper_per character varying(64) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_ttper
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_ttper
    IS 'TABLA QUE ALMACENA LOS DIFERENTES TIPOS DE PERSONAS/CLIENTES';

COMMENT ON COLUMN ow_base_us.ge_ttper.tper_tper
    IS 'IDENTIFICADOR ĂšNICO DE TIPO DE CLIENTE/PERSONA';

COMMENT ON COLUMN ow_base_us.ge_ttper.tper_per
    IS 'DESCRIPCIĂ“N DE TIPO DE CLIENTE/PERSONA';
    
--
-- Name: ge_ttper pk_ge_ttper; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_ttper
    ADD CONSTRAINT pk_ge_ttper PRIMARY KEY (tper_tper);
    
