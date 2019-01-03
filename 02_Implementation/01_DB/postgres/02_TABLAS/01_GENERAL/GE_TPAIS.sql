-- Table: ada_db_us.ge_tpais

CREATE TABLE ada_db_us.ge_tpais
(
    pais_pais double precision NOT NULL,
    pais_nombre character varying(128) COLLATE pg_catalog."default" NOT NULL,
    pais_cod_iso character varying(3) COLLATE pg_catalog."default" NOT NULL,
    pais_cod_area character varying(16) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.ge_tpais
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_us.ge_tpais
    IS 'PAISES';

COMMENT ON COLUMN ada_db_us.ge_tpais.pais_pais
    IS 'LLAVE PRIMARIA PAIS';

COMMENT ON COLUMN ada_db_us.ge_tpais.pais_nombre
    IS 'NOMRBE DEL PAIS';

COMMENT ON COLUMN ada_db_us.ge_tpais.pais_cod_iso
    IS 'CODIGO ISO DEL PAIS (2 DIGITOS)';

COMMENT ON COLUMN ada_db_us.ge_tpais.pais_cod_area
    IS 'CODIGO DE AREA TELEFONICA';
    
--
-- Name: ge_tpais pk_ge_tpais_pais; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.ge_tpais
    ADD CONSTRAINT pk_ge_tpais_pais PRIMARY KEY (pais_pais);