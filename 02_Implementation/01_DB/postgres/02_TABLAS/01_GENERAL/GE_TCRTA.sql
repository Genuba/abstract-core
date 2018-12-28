-- Table: ow_base_us.ge_tcrta

CREATE TABLE ow_base_us.ge_tcrta
(
    crta_crta character varying(100) COLLATE pg_catalog."default" NOT NULL,
    crta_prcs character varying(100) COLLATE pg_catalog."default" NOT NULL,
    crta_http_code double precision NOT NULL,
    crta_descri character varying(256) COLLATE pg_catalog."default" NOT NULL,
    crta_idioma character varying(10) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tcrta
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_tcrta
    IS 'Codigos de respuesta utilizados por los servicios de integracion';

COMMENT ON COLUMN ow_base_us.ge_tcrta.crta_crta
    IS 'Identificador interno para codigo de error';

COMMENT ON COLUMN ow_base_us.ge_tcrta.crta_prcs
    IS 'Proceso de integracion al cual esta asociado el codigo de respuesta';

COMMENT ON COLUMN ow_base_us.ge_tcrta.crta_http_code
    IS 'Codigo http que se retorna como respuesta. Ver codificacion estandar http 2XX-Peticiones correctas, 3XX-Redirecciones, 4XX-Errores de usuario, 5XX-Errores de servidor';

COMMENT ON COLUMN ow_base_us.ge_tcrta.crta_descri
    IS 'Descripcion funcional de codigo de respuesta. ';

COMMENT ON COLUMN ow_base_us.ge_tcrta.crta_idioma
    IS 'CĂłdigos de paĂ­ses e idiomas I18N';

--
-- Name: ge_tcrta pk_ge_tcrta; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tcrta
    ADD CONSTRAINT pk_ge_tcrta PRIMARY KEY (crta_crta, crta_prcs, crta_idioma);