-- Table: ow_base_us.ge_tciud

CREATE TABLE ow_base_us.ge_tciud
(
    ciud_ciud double precision NOT NULL,
    ciud_nombre character varying(128) COLLATE pg_catalog."default" NOT NULL,
    ciud_depto double precision
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tciud
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_tciud
    IS 'TABLA DE CIUDADES';

COMMENT ON COLUMN ow_base_us.ge_tciud.ciud_ciud
    IS 'LLAVE PRIMARIA CIUDAD';

COMMENT ON COLUMN ow_base_us.ge_tciud.ciud_nombre
    IS 'NOMBRE DE LA CIUDAD';

COMMENT ON COLUMN ow_base_us.ge_tciud.ciud_depto
    IS 'CODIGO LLAVE FORANEA DEPARTAMENTO';

-- Index: ixfk_ge_tciud_ge_tdepto

CREATE INDEX ixfk_ge_tciud_ge_tdepto
    ON ow_base_us.ge_tciud USING btree
    (ciud_depto)
    TABLESPACE pg_default;

--
-- Name: ge_tciud pk_ge_tciud; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tciud
    ADD CONSTRAINT pk_ge_tciud PRIMARY KEY (ciud_ciud);