-- Table: ada_db_us.aut_tmenu

CREATE TABLE ada_db_us.aut_tmenu
(
    menu_menu double precision NOT NULL,
    menu_orden double precision NOT NULL,
    menu_nombre character varying(100) COLLATE pg_catalog."default" NOT NULL,
    menu_descri character varying(512) COLLATE pg_catalog."default" NOT NULL,
    menu_icon character varying(100) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_tmenu
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_us.aut_tmenu
    IS 'TABLA QUE ALMACENA LOS MENUS DE LA APP';

COMMENT ON COLUMN ada_db_us.aut_tmenu.menu_menu
    IS 'ID DEL GRUPO DE MODULOS EN EL SISTEMA';

COMMENT ON COLUMN ada_db_us.aut_tmenu.menu_orden
    IS 'ORDEN DEL GRUPO DE MODILOS DENTRO DEL SISTEM';

COMMENT ON COLUMN ada_db_us.aut_tmenu.menu_nombre
    IS 'NOMBRE DEL GRUPO DE MODULOS';

COMMENT ON COLUMN ada_db_us.aut_tmenu.menu_descri
    IS 'OBSERVACION DE AYUDA';

COMMENT ON COLUMN ada_db_us.aut_tmenu.menu_icon
    IS 'NOMBRE DE ICON FONT ICON';
    
--
-- Name: aut_tmenu pk_aut_tmenu; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_tmenu
    ADD CONSTRAINT pk_aut_tmenu PRIMARY KEY (menu_menu);