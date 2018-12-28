-- FUNCTION: ow_base_us."ge_qlgtr$registrar_detalle_log"(text, text, text, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qlgtr$registrar_detalle_log"(
	p_lgtr text,
	p_prcs text,
	p_crta text,
	p_observ text,
	p_error text,
	OUT p_cod_rpta text,
	OUT p_cod_rpta_descri text)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* ---------------------------------------------- */

/* Se establece que creacion de detallle es */

/* transaccion autonoma */

/* ---------------------------------------------- */

DECLARE

    /*

    [5571 - Severity CRITICAL - Unable to convert %s pragma. Check converted code for perfomance issues and rewrite it manually, if necessary.]

    PRAGMA AUTONOMOUS_TRANSACTION

    */

    c_dlgtr CURSOR FOR

    SELECT

        CONCAT_WS('', ow_base_ext.to_char(CURRENT_TIMESTAMP, 'YYYYMMDD'), '-', ow_base_ext.to_char(CURRENT_TIMESTAMP, 'hh24:mi:ss.FF'));

    v_dlgtr OW_BASE_US.GE_TDLGTR.dlgtr_dlgtr%TYPE;

    c_lgtr CURSOR FOR

    SELECT

        lgtr_lgtr

        FROM ow_base_us.ge_tlgtr

        WHERE lgtr_lgtr = p_lgtr;

    r_lgtr record;

    c_crta CURSOR FOR

    SELECT

        crta_crta, crta_prcs

        FROM ow_base_us.ge_tcrta

        WHERE crta_crta = p_crta AND crta_prcs = p_prcs;

    r_crta record;

/* ---------------------------------------------- */

/* Validacion de parametros de entrada */

/* ---------------------------------------------- */

/* Validacion de log padre */

BEGIN

    IF (p_lgtr IS NULL) THEN

        p_cod_rpta := 'ER_LGTR_NU';

        p_cod_rpta_descri := 'Log de transacciones no puede ser nulo';

        RETURN;

    ELSE

        r_lgtr.lgtr_lgtr := NULL;

        OPEN c_lgtr;

        FETCH c_lgtr INTO r_lgtr;

        CLOSE c_lgtr;

        IF (r_lgtr.lgtr_lgtr IS NULL) THEN

            p_cod_rpta := 'ER_LGTR_NE';

            p_cod_rpta_descri := 'Log de transaccion no existe o no se ha creado correctamente';

            RETURN;

        END IF;

    END IF

    /* Validacion de proceso */;

    IF (p_prcs IS NULL) THEN

        p_cod_rpta := 'ER_PRCS_NU';

        p_cod_rpta_descri := 'Proceso de integracion no puede ser nulo';

        RETURN;

    END IF

    /* Validacion de codigo respuesta */;

    IF (p_crta IS NULL) THEN

        p_cod_rpta := 'ER_CRTA_NU';

        p_cod_rpta_descri := 'Codigo de respuesta del detalle no puede ser nulo';

        RETURN;

    ELSE

        r_crta.crta_crta := NULL;

        OPEN c_crta;

        FETCH c_crta INTO r_crta;

        CLOSE c_crta;

        IF (r_crta.crta_crta IS NULL) THEN

            p_cod_rpta := 'ER_CRTA_NE';

            p_cod_rpta_descri := 'Codigo de respuesta no es valido o no se ha creado en sistema';

            RETURN;

        END IF;

    END IF;

    IF (p_observ IS NULL) THEN

        p_cod_rpta := 'ER_OBSERV_NU';

        p_cod_rpta_descri := 'Observacion de detalle no puede ser nulo';

    END IF

    /* ---------------------------------------------- */

    /* detalle de log con los parametros enviados */

    /* ---------------------------------------------- */;

    OPEN c_dlgtr;

    FETCH c_dlgtr INTO v_dlgtr;

    CLOSE c_dlgtr;

    INSERT INTO ow_base_us.ge_tdlgtr (dlgtr_dlgtr, dlgtr_lgtr, dlgtr_feccre, dlgtr_prcs, dlgtr_crta, dlgtr_observ, dlgtr_error

    /* 1001 */)

    VALUES (v_dlgtr, r_lgtr.lgtr_lgtr, CURRENT_TIMESTAMP, r_crta.crta_prcs, r_crta.crta_crta, p_observ, p_error

    /* 1001 */)

    /*

    [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

    commit

    */;

    p_cod_rpta := 'OK';

    p_cod_rpta_descri := 'Registro en detalle de log realizada con exito';

    EXCEPTION

        WHEN unique_violation THEN

            p_cod_rpta := 'ER_DLGTR_REG';

            p_cod_rpta_descri := 'Ya existe detalle de log de operacion en BD';

        WHEN others THEN

            p_cod_rpta := 'ER_DLGTR_NC';

            p_cod_rpta_descri := CONCAT_WS('', 'Error no controlado', SQLERRM);

END;

$BODY$;

ALTER FUNCTION ow_base_us."ge_qlgtr$registrar_detalle_log"(text, text, text, text, text)
    OWNER TO ow_base_us;
