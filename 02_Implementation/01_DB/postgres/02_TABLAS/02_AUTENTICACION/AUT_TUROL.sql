-- Table: ow_base_us.aut_turol

CREATE TABLE ow_base_us.aut_turol
(
    urol_usuario character varying(32) COLLATE pg_catalog."default" NOT NULL,
    urol_rol character varying(32) COLLATE pg_catalog."default" NOT NULL
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.aut_turol
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.aut_turol
    IS 'TABLA QUE RELACIONA LOS USUARIOS DEL CN_SGR CON LOS ROLES ESTABLECIDOS EN Ă‰L';

COMMENT ON COLUMN ow_base_us.aut_turol.urol_usuario
    IS 'USUARIO DEL CN_SGR';

COMMENT ON COLUMN ow_base_us.aut_turol.urol_rol
    IS 'ROL ASOCIADO AL USUARIO';