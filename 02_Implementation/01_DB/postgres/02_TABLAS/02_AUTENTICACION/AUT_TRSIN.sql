-- Table: ow_base_us.aut_trsin

CREATE TABLE ow_base_us.aut_trsin
(
    rsin_rol character varying(20) COLLATE pg_catalog."default" NOT NULL,
    rsin_servicio double precision NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.aut_trsin
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.aut_trsin
    IS 'TABLA QUE ALMACENA EL SERVICIO DE INICIO POR ROL';

COMMENT ON COLUMN ow_base_us.aut_trsin.rsin_rol
    IS 'ROL DE USUARIO';

COMMENT ON COLUMN ow_base_us.aut_trsin.rsin_servicio
    IS 'SERVICIO DE INICIO';
    
    --
-- Name: aut_trsin pk_aut_trsin; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_trsin
    ADD CONSTRAINT pk_aut_trsin PRIMARY KEY (rsin_rol, rsin_servicio);
