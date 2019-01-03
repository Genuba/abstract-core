-- Table: ada_db_us.aut_turol

CREATE TABLE ada_db_us.aut_turol
(
    urol_usuario character varying(32) COLLATE pg_catalog."default" NOT NULL,
    urol_rol character varying(32) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_turol
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_us.aut_turol
    IS 'TABLA QUE RELACIONA LOS USUARIOS DEL CN_SGR CON LOS ROLES ESTABLECIDOS EN Ă‰L';

COMMENT ON COLUMN ada_db_us.aut_turol.urol_usuario
    IS 'USUARIO DEL CN_SGR';

COMMENT ON COLUMN ada_db_us.aut_turol.urol_rol
    IS 'ROL ASOCIADO AL USUARIO';