-- Table: ow_base_us.ge_tdlgtr

CREATE TABLE ow_base_us.ge_tdlgtr
(
    dlgtr_dlgtr character varying(100) COLLATE pg_catalog."default" NOT NULL,
    dlgtr_lgtr character varying(100) COLLATE pg_catalog."default" NOT NULL,
    dlgtr_feccre timestamp(0) without time zone NOT NULL,
    dlgtr_prcs character varying(100) COLLATE pg_catalog."default" NOT NULL,
    dlgtr_crta character varying(100) COLLATE pg_catalog."default" NOT NULL,
    dlgtr_observ character varying(1000) COLLATE pg_catalog."default" NOT NULL,
    dlgtr_error character varying(4000) COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ow_base_us.ge_tdlgtr
    OWNER to ow_base_us;
COMMENT ON TABLE ow_base_us.ge_tdlgtr
    IS 'Detalle de Log de transacciones de integraciones SIFI-SAF';

COMMENT ON COLUMN ow_base_us.ge_tdlgtr.dlgtr_dlgtr
    IS 'Identificador unico del detalle de log';

COMMENT ON COLUMN ow_base_us.ge_tdlgtr.dlgtr_lgtr
    IS 'Log de transaccion al que pertenece el detalle';

COMMENT ON COLUMN ow_base_us.ge_tdlgtr.dlgtr_feccre
    IS 'Fecha de creacion del detalle';

COMMENT ON COLUMN ow_base_us.ge_tdlgtr.dlgtr_prcs
    IS 'Proceso asociado a la transaccion. Ver tabla IS_TPRCS';

COMMENT ON COLUMN ow_base_us.ge_tdlgtr.dlgtr_crta
    IS 'Codigo de respuesta que ocurre durante la transaccion. Ver tabnla IS_TCRTA';

COMMENT ON COLUMN ow_base_us.ge_tdlgtr.dlgtr_observ
    IS 'Observacion referente a la operacion realizada';

COMMENT ON COLUMN ow_base_us.ge_tdlgtr.dlgtr_error
    IS 'Descripcion error generado en el proceso';
    
--
-- Name: ge_tdlgtr pk_ge_tdlgtr; Type: CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tdlgtr
    ADD CONSTRAINT pk_ge_tdlgtr PRIMARY KEY (dlgtr_dlgtr);