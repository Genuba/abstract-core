-- Table: ow_base_us.ge_tdepto

CREATE TABLE ow_base_us.ge_tdepto
(
    depto_depto double precision NOT NULL,
    depto_nombre character varying(128) COLLATE pg_catalog."default" NOT NULL,
    depto_pais double precision NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tdepto
    OWNER to ow_base_us;

COMMENT ON COLUMN ow_base_us.ge_tdepto.depto_depto
    IS 'LLAVE PRIMARI DEPARTAMENTO';

COMMENT ON COLUMN ow_base_us.ge_tdepto.depto_nombre
    IS 'NOMBRE DEL DEPARTAMENTO';

COMMENT ON COLUMN ow_base_us.ge_tdepto.depto_pais
    IS 'LLAVE FORANEA PAIS';

-- Index: ixfk_ge_tdepto_ge_tpais

CREATE INDEX ixfk_ge_tdepto_ge_tpais
    ON ow_base_us.ge_tdepto USING btree
    (depto_pais)
    TABLESPACE pg_default;
    
--
-- Name: ge_tdepto pk_ge_tdepto; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tdepto
    ADD CONSTRAINT pk_ge_tdepto PRIMARY KEY (depto_depto);
