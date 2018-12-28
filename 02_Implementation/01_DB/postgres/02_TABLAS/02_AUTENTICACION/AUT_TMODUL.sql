-- Table: ow_base_us.aut_tmodul

CREATE TABLE ow_base_us.aut_tmodul
(
    modulo_modulo character varying(20) COLLATE pg_catalog."default" NOT NULL,
    modulo_descri character varying(200) COLLATE pg_catalog."default" NOT NULL,
    modulo_nomb character varying(100) COLLATE pg_catalog."default" NOT NULL,
    modulo_orden double precision NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.aut_tmodul
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.aut_tmodul
    IS 'MODULOS DEL SISTEMA';

COMMENT ON COLUMN ow_base_us.aut_tmodul.modulo_modulo
    IS 'IDENTIFICADOR MODULO';

COMMENT ON COLUMN ow_base_us.aut_tmodul.modulo_descri
    IS 'DESCRIPCION DEL MODULO';

COMMENT ON COLUMN ow_base_us.aut_tmodul.modulo_nomb
    IS 'NOMBRE DEL MODULO';

COMMENT ON COLUMN ow_base_us.aut_tmodul.modulo_orden
    IS 'ORDEN QUE TENDRA EL MODULO';
    
    --
-- Name: aut_tmodul pk_aut_tmodul; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tmodul
    ADD CONSTRAINT pk_aut_tmodul PRIMARY KEY (modulo_modulo);