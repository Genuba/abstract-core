-- Table: ada_db_us.aut_tsurl

CREATE TABLE ada_db_us.aut_tsurl
(
    surl_url character varying(512) COLLATE pg_catalog."default" NOT NULL,
    surl_servicio double precision NOT NULL,
    surl_tipo character varying(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'S'::character varying,
    CONSTRAINT ch_aut_tsurl_tipo CHECK (surl_tipo::text = ANY (ARRAY['P'::character varying::text, 'S'::character varying::text]))
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_us.aut_tsurl
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_us.aut_tsurl
    IS 'TABLA QUE ALMACENA LAS RUTAS ĂšNICAS DE LOCALIZACIĂ“N (URL) DE LAS PĂ�GINAS PERTENECIENTES AL CN_SGR ASĂŤ COMO SU RELACIĂ“N CON EL SERVICIO AL QUE PERTENECE Y SI ES UN ARCHIVO DE TIPO PRIMARIO O SECUNDARIO';

COMMENT ON COLUMN ada_db_us.aut_tsurl.surl_url
    IS 'ID Y URL DEL SERVICIO O ARCHIVO QUE SE ESTA UBICANDO';

COMMENT ON COLUMN ada_db_us.aut_tsurl.surl_servicio
    IS 'SERVICIO QUE SE PRESTA Y ES UBICADO EN UN ARCHIVO EN LA URL RELACIONADA';

COMMENT ON COLUMN ada_db_us.aut_tsurl.surl_tipo
    IS 'TIPO DE URL P-PRINCIPAL, S-SECUNDARIA';
    
    --
-- Name: aut_tsurl pk_aut_tsurl; Type: CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_tsurl
    ADD CONSTRAINT pk_aut_tsurl PRIMARY KEY (surl_url, surl_servicio);