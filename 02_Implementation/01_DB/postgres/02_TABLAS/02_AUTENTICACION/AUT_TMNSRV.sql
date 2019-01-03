-- Table: ada_db_us.aut_tmnsrv

CREATE TABLE ada_db_us.aut_tmnsrv
(
    mser_menu double precision NOT NULL,
    mser_servicio double precision NOT NULL,
    mser_orden double precision NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_tmnsrv
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_us.aut_tmnsrv
    IS 'TABLA QUE ALMACENA LOS MENUS PRESTADOS DENTRO DEL APP, ASĂŤ COMO LOS ITEMS A LOS QUE PERTENECEN';

COMMENT ON COLUMN ada_db_us.aut_tmnsrv.mser_menu
    IS 'ID DEL MENU EN EL SISTEMA';

COMMENT ON COLUMN ada_db_us.aut_tmnsrv.mser_servicio
    IS 'ID DEL SERVICIO';

COMMENT ON COLUMN ada_db_us.aut_tmnsrv.mser_orden
    IS 'ORDEN DEL SERVICIOS DENTRO DEL MENU';
    
    --
-- Name: aut_tmnsrv pk_aut_tmnsrv; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_tmnsrv
    ADD CONSTRAINT pk_aut_tmnsrv PRIMARY KEY (mser_menu, mser_servicio);