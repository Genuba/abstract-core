-- Table: ow_base_us.aut_tsrol

-- DROP TABLE ow_base_us.aut_tsrol;

CREATE TABLE ow_base_us.aut_tsrol
(
    srol_servicio double precision NOT NULL,
    srol_rol character varying(20) COLLATE pg_catalog."default" NOT NULL,
    srol_visible character varying(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::character varying,
    CONSTRAINT ch_pi_taut_tsrol_visible CHECK (srol_visible::text = ANY (ARRAY['S'::character varying::text, 'N'::character varying::text]))
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.aut_tsrol
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.aut_tsrol
    IS 'TABLA QUE RELACIONA LOS SERVICIOS PRESTADOS EN EL SISTEMA CON LOS ROLES DE USUARIO QUE PUEDEN ACCEDER A ELLOS ';

COMMENT ON COLUMN ow_base_us.aut_tsrol.srol_servicio
    IS 'SERVICIO ASOCIADO AL ROL';

COMMENT ON COLUMN ow_base_us.aut_tsrol.srol_rol
    IS 'ROL QUE TIENE ASOCIADO SERVICIOS';

COMMENT ON COLUMN ow_base_us.aut_tsrol.srol_visible
    IS 'SERA VISIBLE EL SERVICIO EN EL MENĂš DEL ROL CORRESPONDIENTE ''S'' SI O ''N'' NO';
    
    --
-- Name: aut_tsrol pk_aut_tsrol; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tsrol
    ADD CONSTRAINT pk_aut_tsrol PRIMARY KEY (srol_servicio, srol_rol);