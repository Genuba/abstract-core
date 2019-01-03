-- Table: ada_db_us.aut_tservc

CREATE TABLE ada_db_us.aut_tservc
(
    servicio_servicio double precision NOT NULL,
    servicio_modulo character varying(20) COLLATE pg_catalog."default" NOT NULL,
    servicio_descri character varying(200) COLLATE pg_catalog."default" NOT NULL,
    servicio_nomb character varying(100) COLLATE pg_catalog."default" NOT NULL,
    servicio_tipo character varying(2) COLLATE pg_catalog."default" NOT NULL,
    servicio_orden double precision NOT NULL,
    CONSTRAINT ch_aut_tservc_tipo CHECK (servicio_tipo::text = ANY (ARRAY['L'::character varying::text, 'O'::character varying::text]))
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_tservc
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_us.aut_tservc
    IS 'TABLA QUE ALMACENA LOS SERVICIOS PRESTADOS DENTRO DEL CN_SGR, ASĂŤ COMO LOS MODULOS A LOS QUE PERTENECEN';

COMMENT ON COLUMN ada_db_us.aut_tservc.servicio_servicio
    IS 'ID DEL SERVICIO PRESTADO EN EL SISTEMA';

COMMENT ON COLUMN ada_db_us.aut_tservc.servicio_modulo
    IS 'ID DEL MODULO AL QUE PERTENECE EL SERVICI? RELACIONADO';

COMMENT ON COLUMN ada_db_us.aut_tservc.servicio_descri
    IS 'DESCRIPCI?N DEL SERVICIO RELACIONADO';

COMMENT ON COLUMN ada_db_us.aut_tservc.servicio_nomb
    IS 'NOMBRE DEL SERVICIO RELACIONADO';

COMMENT ON COLUMN ada_db_us.aut_tservc.servicio_tipo
    IS 'TIPO SERVICIO. L=LISTADO, O=OPERATIVO';

COMMENT ON COLUMN ada_db_us.aut_tservc.servicio_orden
    IS 'ORDEN DEL SERVICIO DENTRO DEL MODULO';
    
    --
-- Name: aut_tservc pk_aut_tservc; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_tservc
    ADD CONSTRAINT pk_aut_tservc PRIMARY KEY (servicio_servicio);