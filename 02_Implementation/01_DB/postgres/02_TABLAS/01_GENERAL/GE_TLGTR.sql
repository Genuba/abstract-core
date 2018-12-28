-- Table: ow_base_us.ge_tlgtr

CREATE TABLE ow_base_us.ge_tlgtr
(
    lgtr_lgtr character varying(100) COLLATE pg_catalog."default" NOT NULL,
    lgtr_trans character varying(100) COLLATE pg_catalog."default" NOT NULL,
    lgtr_terminal character varying(100) COLLATE pg_catalog."default" NOT NULL,
    lgtr_usuario character varying(100) COLLATE pg_catalog."default" NOT NULL,
    lgtr_fech_oper character varying(12) COLLATE pg_catalog."default" NOT NULL,
    lgtr_hora_oper character varying(12) COLLATE pg_catalog."default" NOT NULL,
    lgtr_observ character varying(1000) COLLATE pg_catalog."default" NOT NULL,
    lgtr_prcs character varying(100) COLLATE pg_catalog."default" NOT NULL,
    lgtr_id_entidad character varying(100) COLLATE pg_catalog."default" NOT NULL,
    lgtr_fech_ini timestamp(0) without time zone NOT NULL,
    lgtr_fech_fin timestamp(0) without time zone,
    lgtr_crta character varying(100) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tlgtr
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_tlgtr
    IS 'LOG DE TRANSACCIONES DE INTEGRACIONES SIFI-SAF';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_lgtr
    IS 'IDENTIFICADOR UNICO DEL LOG DE TRANSACCION';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_trans
    IS 'TRANSACCION UNICA ENVIADA POR EL PROCESO DE INTEGRACION';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_terminal
    IS 'CODIGO DE TERMINAL O MAQUINA DESDE LA CUAL SE REALIZA LA OPERACION';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_usuario
    IS 'USUARIO QUE ENVIA LA TRANSACCION';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_fech_oper
    IS 'FECHA PROPIA DE LA OPERACION. FORMATO DDMMYYYY';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_hora_oper
    IS 'HORA  PROPIA DE LA OPERACION. FORMATO HH24MISS';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_observ
    IS 'OBSERVACION REFERENTE A LA OPERACION REALIZADA';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_prcs
    IS 'PROCESO ASOCIADO A LA TRANSACCION. VER TABLA "CN_SGR_US"."GE_TPRCS';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_id_entidad
    IS 'IDENTIFICADOR UNICO DE ENTIDAD / OBJETO PRINCIPAL QUE SE VE AFECTADO POR LA OPERACION. ';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_fech_ini
    IS 'FECHA EN LA QUE INICIA LA OPERACION.';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_fech_fin
    IS 'FECHA EN LA QUE FINALIZA LA OPERACION';

COMMENT ON COLUMN ow_base_us.ge_tlgtr.lgtr_crta
    IS 'CODIGO DE RESPUESTA CON LA QUE SE FINALIZA LA OPERACION. VER TABNLA "CN_SGR_US"."GE_TCRTA';
    
--
-- Name: ge_tlgtr pk_ge_tlgtr; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tlgtr
    ADD CONSTRAINT pk_ge_tlgtr PRIMARY KEY (lgtr_lgtr);