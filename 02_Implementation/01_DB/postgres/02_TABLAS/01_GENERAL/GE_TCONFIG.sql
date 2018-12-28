-- Table: ow_base_us.ge_tconfig

CREATE TABLE ow_base_us.ge_tconfig
(
    config_config character varying(128) COLLATE pg_catalog."default" NOT NULL,
    config_categoria character varying(50) COLLATE pg_catalog."default" NOT NULL,
    config_descri character varying(512) COLLATE pg_catalog."default" NOT NULL,
    config_tipo_dato double precision NOT NULL,
    config_valor character varying(512) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT ch_ge_tconfig_tipo_dato CHECK (config_tipo_dato = ANY (ARRAY[1::double precision, 2::double precision, 3::double precision]))
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tconfig
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_tconfig
    IS 'TABLA QUE ALMACENA LAS VARIABLES GENERALES DEL SISTEMA';

COMMENT ON COLUMN ow_base_us.ge_tconfig.config_config
    IS 'IDENTIFICADOR UNICO DE LA ACTIVIDAD';

COMMENT ON COLUMN ow_base_us.ge_tconfig.config_categoria
    IS 'CATEGORIA DE LA CONFIGURACIĂ“N';

COMMENT ON COLUMN ow_base_us.ge_tconfig.config_descri
    IS 'DESCRIPCION DE LA CONFIGURACIĂ“N';

COMMENT ON COLUMN ow_base_us.ge_tconfig.config_tipo_dato
    IS 'TIPO DE DATO. 1-NUMERICO, 2-STRING, 3-BOOLEAN';

COMMENT ON COLUMN ow_base_us.ge_tconfig.config_valor
    IS 'VALOR DE LA CONFGIURACIĂ“N';

--
-- Name: ge_tconfig pk_ge_tconfig; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tconfig
    ADD CONSTRAINT pk_ge_tconfig PRIMARY KEY (config_config);