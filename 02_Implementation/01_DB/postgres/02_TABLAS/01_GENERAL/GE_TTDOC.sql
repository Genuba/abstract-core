-- Table: ow_base_us.ge_ttdoc

CREATE TABLE ow_base_us.ge_ttdoc
(
    tdoc_tdoc character varying(3) COLLATE pg_catalog."default" NOT NULL,
    tdoc_doc character varying(64) COLLATE pg_catalog."default" NOT NULL,
    tdoc_tper character varying(3) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_ttdoc
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_ttdoc
    IS 'TABLA QUE ALMACENA LOS DIFERENTES TIPOS DE DOCUMENTOS CON QUE SE PUEDE REGISTRAR UN USUARIO';

COMMENT ON COLUMN ow_base_us.ge_ttdoc.tdoc_tdoc
    IS 'IDENTIFICADOR DEL TIPO DE DOCUMENTO DE IDENTIFICACIĂ“N INSCRITO';

COMMENT ON COLUMN ow_base_us.ge_ttdoc.tdoc_doc
    IS 'NOMBRE DEL TIPO DE DOCUMENTO INSCRITO: TARJETA DE IDENTIDAD, CEDULA DE CIUDADANĂŤA, CEDULA DE EXTRANJERĂŤA';
    
--
-- Name: ge_ttdoc pk_ge_ttdoc; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_ttdoc
    ADD CONSTRAINT pk_ge_ttdoc PRIMARY KEY (tdoc_tdoc);