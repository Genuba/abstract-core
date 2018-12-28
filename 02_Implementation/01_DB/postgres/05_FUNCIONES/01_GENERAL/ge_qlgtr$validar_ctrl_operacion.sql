-- FUNCTION: ow_base_us."ge_qlgtr$validar_ctrl_operacion"(ow_base_us.type_tt_ge_lgtr, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qlgtr$validar_ctrl_operacion"(
	p_ctrl_operacion ow_base_us.type_tt_ge_lgtr,
	p_prcs text,
	OUT p_cod_rpta text,
	OUT p_cod_rpta_descri text,
	OUT p_errores ow_base_us.type_tt_ge_erro)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    v_errores ow_base_us.type_tt_ge_erro;

BEGIN

    IF p_ctrl_operacion IS NOT NULL AND COALESCE(array_length(p_ctrl_operacion, 1), 0) = 1

    /* Validar trans */

    THEN

        IF (p_ctrl_operacion[1].trans IS NULL) THEN

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_LGTR_TRANS_NL'::TEXT)

                INTO v_errores;

        END IF

        /* Validar terminal */;

        IF (p_ctrl_operacion[1].terminal IS NULL) THEN

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_LGTR_TERM_NL'::TEXT)

                INTO v_errores;

        END IF

        /* Validar usuario */;

        IF (p_ctrl_operacion[1].usuario IS NULL) THEN

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_LGTR_USUA_NL'::TEXT)

                INTO v_errores;

        END IF

        /* Validar fech_oper */;

        IF (p_ctrl_operacion[1].fech_oper IS NULL) THEN

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_LGTR_FOPER_NL'::TEXT)

                INTO v_errores;

        END IF

        /* Validar hora_oper */;

        IF (p_ctrl_operacion[1].hora_oper IS NULL) THEN

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_LGTR_HOPER_NL'::TEXT)

                INTO v_errores;

        END IF

        /* Validar observacion */;

        IF (p_ctrl_operacion[1].observacion IS NULL) THEN

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_LGTR_OBSERV_NL'::TEXT)

                INTO v_errores;

        END IF;

    ELSE

        SELECT

            *

            FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_LGTR_NV'::TEXT)

            INTO v_errores;

    END IF

    /* ---------------------------------------------- */

    /* Se valida si existen errores */

    /* ---------------------------------------------- */;

    IF (COALESCE(array_length(v_errores, 1), 0) > 0) THEN

        p_cod_rpta := 'ERROR';

        p_cod_rpta_descri := 'Existen errores de validacion. Consultar listado de errores';

        p_errores := v_errores;

    ELSE

        p_cod_rpta := 'OK';

        p_cod_rpta_descri := 'Validaciones realizadas con exito';

        p_errores := NULL;

    END IF;

    EXCEPTION

        WHEN others THEN

            p_cod_rpta := 'ERROR_NC';

            p_cod_rpta_descri := 'Error no controlado en validaciones de ctrl de operacion';

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$registrar_error(v_errores, p_prcs, 'ER_ERROR_NC_VL_LGTR'::TEXT)

                INTO v_errores;

END;

$BODY$;

ALTER FUNCTION ow_base_us."ge_qlgtr$validar_ctrl_operacion"(ow_base_us.type_tt_ge_lgtr, text)
    OWNER TO ow_base_us;
