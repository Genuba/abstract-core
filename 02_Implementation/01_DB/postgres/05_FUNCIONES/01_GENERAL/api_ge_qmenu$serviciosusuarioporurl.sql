-- FUNCTION: ow_base_us."api_ge_qmenu$serviciosusuarioporurl"(ow_base_us.type_tt_ge_lgtr, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qmenu$serviciosusuarioporurl"(
	p_ctrl_operacion ow_base_us.type_tt_ge_lgtr,
	p_usuario text,
	p_url text,
	OUT p_tservicio ow_base_us.type_tt_ge_srvcio,
	OUT p_cod_rta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	OUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    v_crta_crta_gral OW_BASE_US.GE_TCRTA.crta_crta%TYPE

    /* Codigo interno de respuesta */;

    v_crta_prcs_gral OW_BASE_US.GE_TCRTA.crta_prcs%TYPE

    /* Proceso al cual pertenece el codigo de respuesta */;

    v_crta_http_gral OW_BASE_US.GE_TCRTA.crta_http_code%TYPE

    /* Codigo Http para el cogido interno de respuesta */;

    v_crta_descri_gral OW_BASE_US.GE_TCRTA.crta_descri%TYPE

    /* Descripcion general del codigo de respuesta */;

    v_lgtr OW_BASE_US.GE_TLGTR.lgtr_lgtr%TYPE

    /* Log de trasnsacciones */;

    v_lgtr_id_entidad OW_BASE_US.GE_TLGTR.lgtr_id_entidad%TYPE

    /* Id Entidad para el log de transacciones */;

    F$RESULT_REC RECORD;

    F$RESULT_REC_2 RECORD;

/* Excepcion exclusiva para el log de operaciones */

/* */

BEGIN

    v_crta_prcs_gral := 'API_GE_QMENU.serviciosUsuarioPorUrl'

    /* */;

    DECLARE

        v_cod_rspta_lgtr_v OW_BASE_US.GE_TCRTA.crta_crta%TYPE;

        v_cod_rpta_descri_lgtr_v OW_BASE_US.GE_TCRTA.crta_descri%TYPE;

    BEGIN

        SELECT

            *

            FROM ow_base_us.ge_qlgtr$validar_ctrl_operacion(p_ctrl_operacion, v_crta_prcs_gral)

            INTO F$RESULT_REC;

        v_cod_rspta_lgtr_v := F$RESULT_REC.P_COD_RPTA;

        v_cod_rpta_descri_lgtr_v := F$RESULT_REC.P_COD_RPTA_DESCRI;

        p_errores := F$RESULT_REC.P_ERRORES

        /* */;

        IF (v_cod_rspta_lgtr_v <> 'OK') THEN

            v_crta_crta_gral := 'ERROR_LGTR';

            

        END IF;

    END

    /* */

    /* ============================================= */

    /* Se inicializa el log general para toda */

    /* la transaccion. A traves del log se puende */

    /* consultar el estado final y los errores */

    /* ============================================= */;

    DECLARE

        v_cod_rspta_lgtr OW_BASE_US.GE_TCDER.cder_cder%TYPE;

        v_cod_rpta_descri_lgtr OW_BASE_US.GE_TCDER.cder_descri%TYPE;

    /* */

    BEGIN

        SELECT

            *

            FROM ow_base_us.ge_qlgtr$iniciar_log(p_ctrl_operacion := p_ctrl_operacion, p_prcs := v_crta_prcs_gral)

            INTO v_cod_rspta_lgtr, v_cod_rpta_descri_lgtr, v_lgtr;

        /* */

    END

    /* */;

    SELECT

        *

        FROM ow_base_us.ge_qmenu$serviciosusuarioporurl(v_crta_prcs_gral, p_usuario, p_url)

        INTO F$RESULT_REC_2;

    p_tservicio := F$RESULT_REC_2.P_TSERVICIO;

    p_cod_rta := F$RESULT_REC_2.P_COD_RPTA;

    p_errores := F$RESULT_REC_2.P_ERRORES;

    p_mensajes := F$RESULT_REC_2.P_MENSAJES

    /* */

    /* ============================================= */

    /* Luego de realizar todos los pasos se finaliza el log */

    /* de transaccion con el codigo general */

    /* ============================================= */;

    DECLARE

        v_cod_rspta_lgtr OW_BASE_US.GE_TCDER.cder_cder%TYPE;

        v_cod_rpta_descri_lgtr OW_BASE_US.GE_TCDER.cder_descri%TYPE;

    BEGIN

        IF (p_cod_rta = 'OK') THEN

            v_crta_crta_gral := 'COD_EXITOSO';

        ELSE

            v_crta_crta_gral := 'ERR_WHEN_OTHERS';

        END IF;

        SELECT

            *

            FROM ow_base_us.ge_qlgtr$finalizar_log(p_lgtr := v_lgtr, p_crta := v_crta_crta_gral, p_id_entidad := COALESCE(v_lgtr_id_entidad, '-'), p_error := v_crta_descri_gral)

            INTO v_cod_rspta_lgtr, v_cod_rpta_descri_lgtr;

    END

    /* */;

    /* */

    EXCEPTION

        WHEN raise_exception THEN

            DECLARE

                exc$name CHARACTER VARYING;

                exc$code CHARACTER VARYING;

            BEGIN

                GET STACKED DIAGNOSTICS exc$name := pg_exception_detail,

                    exc$code := pg_exception_hint;

                    v_crta_crta_gral := 'ERROR_LGTR';

                    DECLARE

                        v_cod_rspta_crta OW_BASE_US.GE_TCDER.cder_cder%TYPE;

                        v_cod_rpta_descri_crta OW_BASE_US.GE_TCDER.cder_descri%TYPE;

                    BEGIN

                        SELECT

                            *

                            FROM ow_base_us.ge_qcrta$consultar_crta(v_crta_prcs_gral, v_crta_crta_gral)

                            INTO v_crta_http_gral, v_crta_descri_gral, v_cod_rspta_crta, v_cod_rpta_descri_crta;

                    END;

                    p_cod_rta := 'ERROR';

            END;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qmenu$serviciosusuarioporurl"(ow_base_us.type_tt_ge_lgtr, text, text)
    OWNER TO ow_base_us;
