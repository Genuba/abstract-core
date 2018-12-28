-- FUNCTION: ow_base_us."ge_qlgtr$finalizar_log"(text, text, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qlgtr$finalizar_log"(
	p_lgtr text,
	p_crta text,
	p_id_entidad text,
	p_error text,
	OUT p_cod_rpta text,
	OUT p_cod_rpta_descri text)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* ---------------------------------------------- */

/* Se establece que la log es atonoma */

/* ---------------------------------------------- */

DECLARE

    /*

    [5571 - Severity CRITICAL - Unable to convert %s pragma. Check converted code for perfomance issues and rewrite it manually, if necessary.]

    PRAGMA AUTONOMOUS_TRANSACTION

    */

    c_lgtr CURSOR FOR

    SELECT

        lgtr_lgtr

        FROM ow_base_us.ge_tlgtr

        WHERE lgtr_lgtr = p_lgtr;

    r_lgtr record;

    c_crta CURSOR FOR

    SELECT DISTINCT

        crta_crta

        FROM ow_base_us.ge_tcrta

        WHERE crta_crta = p_crta;

    r_crta record;

/* ---------------------------------------------- */

/* Validaciones de parametros de entrada */

/* ---------------------------------------------- */

/* Validacion de log de transaccion */

BEGIN

    r_lgtr.lgtr_lgtr := NULL;

    OPEN c_lgtr;

    FETCH c_lgtr INTO r_lgtr;

    CLOSE c_lgtr;

    IF (r_lgtr.lgtr_lgtr IS NULL) THEN

        p_cod_rpta := 'ER_LGTR_NE';

        p_cod_rpta_descri := 'Log de transaccion no existe o no se ha creado correctamente';

        RETURN;

    END IF

    /* Validacion codigo de respuesta de entrada */;

    r_crta.crta_crta := NULL;

    OPEN c_crta;

    FETCH c_crta INTO r_crta;

    CLOSE c_crta;

    IF (r_crta.crta_crta IS NULL) THEN

        p_cod_rpta := 'ER_CRTA_NE';

        p_cod_rpta_descri := 'Codigo de respuesta no es valido o no se ha creado en sistema';

        RETURN;

    END IF

    /* ---------------------------------------------- */

    /* Se actualiza el log con el codigo de rspta */

    /* correspondiente y la fecha actual */

    /* ---------------------------------------------- */;

    UPDATE ow_base_us.ge_tlgtr

    SET lgtr_crta = p_crta, lgtr_fech_fin = CURRENT_TIMESTAMP, lgtr_id_entidad = COALESCE(p_id_entidad, lgtr_id_entidad)

        WHERE lgtr_lgtr = p_lgtr

    /*

    [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

    commit

    */;

    p_cod_rpta := 'OK';

    p_cod_rpta_descri := 'Finalizacion de log realizada con exito';

    EXCEPTION

        WHEN others THEN

            p_cod_rpta := 'ER_LGTR_NC';

            p_cod_rpta_descri := CONCAT_WS('', 'Error no controlado', SQLERRM);

END;

$BODY$;

ALTER FUNCTION ow_base_us."ge_qlgtr$finalizar_log"(text, text, text, text)
    OWNER TO ow_base_us;
