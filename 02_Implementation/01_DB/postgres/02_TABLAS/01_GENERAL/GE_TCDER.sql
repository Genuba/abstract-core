-- Table: ow_base_us.ge_tcder

CREATE TABLE ow_base_us.ge_tcder
(
    cder_cder character varying(20) COLLATE pg_catalog."default" NOT NULL,
    cder_descri character varying(1000) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tcder
    OWNER to ow_base_us;
    
COMMENT ON TABLE ow_base_us.ge_tcder
    IS 'DEPARTAMENTOS/ESTADOS/PROVINCIAS';

COMMENT ON COLUMN ow_base_us.ge_tcder.cder_cder
    IS 'IDENTIFICADOR DEL CODIGO DE ERROR';

COMMENT ON COLUMN ow_base_us.ge_tcder.cder_descri
    IS 'DESCRIPCION DEL CODIGO DE ERROR';
    
--
-- Name: ge_tcder pk_ge_tcder; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tcder
    ADD CONSTRAINT pk_ge_tcder PRIMARY KEY (cder_cder);