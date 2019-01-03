-- Table: ada_db_us.aut_tpersn

CREATE TABLE ada_db_us.aut_tpersn
(
    persn_persn double precision NOT NULL DEFAULT nextval('ada_db_us.aut_spersn'::regclass),
    persn_tpident character varying(2) COLLATE pg_catalog."default" NOT NULL,
    persn_numident character varying(16) COLLATE pg_catalog."default" NOT NULL,
    persn_pnombre character varying(64) COLLATE pg_catalog."default" NOT NULL,
    persn_snombre character varying(64) COLLATE pg_catalog."default",
    persn_papellido character varying(64) COLLATE pg_catalog."default" NOT NULL,
    persn_sapellido character varying(64) COLLATE pg_catalog."default",
    persn_celular character varying(32) COLLATE pg_catalog."default",
    persn_fijo character varying(32) COLLATE pg_catalog."default",
    persn_email character varying(128) COLLATE pg_catalog."default",
    persn_direccion character varying(256) COLLATE pg_catalog."default",
    persn_ciud double precision,
    persn_usrcre character varying(32) COLLATE pg_catalog."default",
    persn_fecact timestamp(0) without time zone,
    persn_feccre timestamp(0) without time zone,
    persn_origen character varying(128) COLLATE pg_catalog."default",
    persn_estado character varying(128) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_tpersn
    OWNER to ada_db_us;
    
    --
-- Name: aut_tpersn pk_aut_tpersn; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_tpersn
    ADD CONSTRAINT pk_aut_tpersn PRIMARY KEY (persn_persn);