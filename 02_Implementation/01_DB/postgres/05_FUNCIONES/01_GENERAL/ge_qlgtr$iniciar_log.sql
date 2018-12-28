-- FUNCTION: ow_base_us."ge_qlgtr$iniciar_log"(ow_base_us.type_tt_ge_lgtr, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qlgtr$iniciar_log"(
	p_ctrl_operacion ow_base_us.type_tt_ge_lgtr,
	p_prcs text,
	OUT p_cod_rpta text,
	OUT p_cod_rpta_descri text,
	OUT p_lgtr text)
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

        CONCAT_WS('', ow_base_ext.to_char(CURRENT_TIMESTAMP, 'YYYYMMDD'), '-', ow_base_ext.to_char(CURRENT_TIMESTAMP, 'hh24:mi:ss.FF'));

    v_lgtr OW_BASE_US.GE_TLGTR.lgtr_lgtr%TYPE;

    c_prcs CURSOR FOR

    SELECT

        prcs_prcs

        FROM ow_base_us.ge_tprcs

        WHERE prcs_prcs = p_prcs;

    r_prcs record;

BEGIN

    OPEN c_lgtr;

    FETCH c_lgtr INTO v_lgtr;

    CLOSE c_lgtr;

    IF p_ctrl_operacion IS NOT NULL AND COALESCE(array_length(p_ctrl_operacion, 1), 0) = 1 THEN

        FOR i IN 1..COALESCE(array_length(p_ctrl_operacion, 1), 0)

        /* ---------------------------------------------- */

        /* Validacion de campos de entrada */

        /* ---------------------------------------------- */

        LOOP

            IF (p_ctrl_operacion[i].trans IS NULL) THEN

                p_cod_rpta := 'ER_TRANS_NU';

                p_cod_rpta_descri := 'Numero de transaccion no puede ser nulo';

                RETURN;

            END IF;

            IF (p_ctrl_operacion[i].terminal IS NULL) THEN

                p_cod_rpta := 'ER_TERM_NU';

                p_cod_rpta_descri := 'Numero de terminal no puede ser nulo';

                RETURN;

            END IF;

            IF (p_ctrl_operacion[i].usuario IS NULL) THEN

                p_cod_rpta := 'ER_USUA_NU';

                p_cod_rpta_descri := 'Usuario de transaccion no puede ser nulo';

                RETURN;

            END IF;

            IF (p_ctrl_operacion[i].fech_oper IS NULL) THEN

                p_cod_rpta := 'ER_FECH_NU';

                p_cod_rpta_descri := 'Fecha de operacion no puede ser nula';

                RETURN;

            END IF;

            IF (p_ctrl_operacion[i].hora_oper IS NULL) THEN

                p_cod_rpta := 'ER_HORA_NU';

                p_cod_rpta_descri := 'Hora de operacion no puede ser nula';

                RETURN;

            END IF;

            IF (p_ctrl_operacion[i].observacion IS NULL) THEN

                p_cod_rpta := 'ER_OBSERV_NU';

                p_cod_rpta_descri := 'Hora de operacion no puede ser nulo';

                RETURN;

            END IF;

            IF (p_prcs IS NULL) THEN

                p_cod_rpta := 'ER_PRCS_NU';

                p_cod_rpta_descri := 'Proceso de integracion no puede ser nulo';

                RETURN;

            ELSE

                r_prcs.prcs_prcs := NULL;

                OPEN c_prcs;

                FETCH c_prcs INTO r_prcs;

                CLOSE c_prcs;

                IF (r_prcs.prcs_prcs IS NULL) THEN

                    p_cod_rpta := 'ER_PRCS_NE';

                    p_cod_rpta_descri := 'Proceso de integracion no existe o no se ha creado correctamente';

                    RETURN;

                END IF;

            END IF

            /* ---------------------------------------------- */

            /* crea registro de para la log */

            /* ---------------------------------------------- */;

            INSERT INTO ow_base_us.ge_tlgtr (lgtr_lgtr, lgtr_trans, lgtr_terminal, lgtr_usuario, lgtr_fech_oper, lgtr_hora_oper, lgtr_observ, lgtr_prcs, lgtr_fech_ini, lgtr_id_entidad, lgtr_fech_fin, lgtr_crta)

            VALUES (v_lgtr, p_ctrl_operacion[i].trans, p_ctrl_operacion[i].terminal, p_ctrl_operacion[i].usuario, p_ctrl_operacion[i].fech_oper, p_ctrl_operacion[i].hora_oper, p_ctrl_operacion[i].observacion, r_prcs.prcs_prcs, CURRENT_TIMESTAMP, '-'

            /* Campo que se diligencia al finalizar el log */, NULL

            /* Campo que se diligencia al finalizar el log */, NULL

            /* Campo que se diligencia al finalizar el log */);

        END LOOP

        /*

        [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

        commit

        */;

        p_lgtr := v_lgtr;

        p_cod_rpta := 'OK';

        p_cod_rpta_descri := 'Inicio de log realizada con exito';

    ELSIF (p_ctrl_operacion IS NULL) THEN

        /*

        [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

        rollback

        */

        p_lgtr := NULL;

        p_cod_rpta := 'ER_LGTR_NL';

        p_cod_rpta_descri := 'La variable p_ctrl_operacion no puede ser nula';

        RETURN;

    ELSIF (COALESCE(array_length(p_ctrl_operacion, 1), 0) > 1) THEN

        /*

        [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

        rollback

        */

        p_lgtr := NULL;

        p_cod_rpta := 'ER_LGTR_MR';

        p_cod_rpta_descri := 'La variable p_ctrl_operacion solo debe tener un registro';

        RETURN;

    END IF;

    EXCEPTION

        WHEN unique_violation THEN

            p_lgtr := NULL;

            p_cod_rpta := 'ER_LGTR_REG';

            p_cod_rpta_descri := 'Ya existe log de operacion en BD';

        WHEN others THEN

            p_lgtr := NULL;

            p_cod_rpta := 'ER_LGTR_NC';

            p_cod_rpta_descri := CONCAT_WS('', 'Error no controlado', SQLERRM);

END;

$BODY$;

ALTER FUNCTION ow_base_us."ge_qlgtr$iniciar_log"(ow_base_us.type_tt_ge_lgtr, text)
    OWNER TO ow_base_us;
