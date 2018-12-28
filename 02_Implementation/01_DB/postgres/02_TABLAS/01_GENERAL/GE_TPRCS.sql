-- Table: ow_base_us.ge_tprcs

CREATE TABLE ow_base_us.ge_tprcs
(
    prcs_prcs character varying(100) COLLATE pg_catalog."default" NOT NULL,
    prcs_descri character varying(512) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tprcs
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_tprcs
    IS 'TABLA QUE CONTINE LOS PROCESO QUE REALIZA LA APLICACION';

COMMENT ON COLUMN ow_base_us.ge_tprcs.prcs_prcs
    IS 'IDENTIFICADOR UNICO DE PROCESO';

COMMENT ON COLUMN ow_base_us.ge_tprcs.prcs_descri
    IS 'DESCRIPCION GENERAL DEL PROCESO DE INTEGRACION';
    
--
-- Name: ge_tprcs pk_ge_tprcs; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tprcs
    ADD CONSTRAINT pk_ge_tprcs PRIMARY KEY (prcs_prcs);