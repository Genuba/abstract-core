-- FUNCTION: ada_db_us."api_aut_qautenticacion$actualizarusuario"(ada_db_us.type_tt_ge_lgtr, ada_db_us.type_tt_au_usuario)

CREATE OR REPLACE FUNCTION ada_db_us."api_aut_qautenticacion$actualizarusuario"(
	p_ctrl_operacion ada_db_us.type_tt_ge_lgtr,
	p_usuario ada_db_us.type_tt_au_usuario,
	OUT p_cod_rta text,
	OUT p_errores ada_db_us.type_tt_ge_erro,
	OUT p_mensajes ada_db_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    v_crta_crta_gral ADA_DB_US.GE_TCRTA.crta_crta%TYPE

    /* Codigo interno de respuesta */;

    v_crta_prcs_gral ADA_DB_US.GE_TCRTA.crta_prcs%TYPE

    /* Proceso al cual pertenece el codigo de respuesta */;

    v_crta_http_gral ADA_DB_US.GE_TCRTA.crta_http_code%TYPE

    /* Codigo Http para el cogido interno de respuesta */;

    v_crta_descri_gral ADA_DB_US.GE_TCRTA.crta_descri%TYPE

    /* Descripcion general del codigo de respuesta */;

    v_lgtr ADA_DB_US.GE_TLGTR.lgtr_lgtr%TYPE

    /* Log de trasnsacciones */;

    v_lgtr_id_entidad ADA_DB_US.GE_TLGTR.lgtr_id_entidad%TYPE

    /* Id Entidad para el log de transacciones */;

    

    

    v_errores ada_db_us.type_tt_ge_erro;

    v_mensajes ada_db_us.type_tt_ge_mnsje;

    F$RESULT_REC RECORD;

    F$RESULT_REC_2 RECORD;

/* */

/* */

BEGIN

    v_crta_prcs_gral := 'API_AUT_QAUTENTICACION.actualizarUsuario'

    /* */;

    DECLARE

        v_cod_rspta_lgtr_v ADA_DB_US.GE_TCRTA.crta_crta%TYPE;

        v_cod_rpta_descri_lgtr_v ADA_DB_US.GE_TCRTA.crta_descri%TYPE;

    BEGIN

        SELECT

            *

            FROM ada_db_us.ge_qlgtr$validar_ctrl_operacion(p_ctrl_operacion, v_crta_prcs_gral)

            INTO F$RESULT_REC;

        v_cod_rspta_lgtr_v := F$RESULT_REC.P_COD_RPTA;

        v_cod_rpta_descri_lgtr_v := F$RESULT_REC.P_COD_RPTA_DESCRI;

        v_errores := F$RESULT_REC.P_ERRORES

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

        v_cod_rspta_lgtr ADA_DB_US.GE_TCDER.cder_cder%TYPE;

        v_cod_rpta_descri_lgtr ADA_DB_US.GE_TCDER.cder_descri%TYPE;

    /* */

    BEGIN

        SELECT

            *

            FROM ada_db_us.ge_qlgtr$iniciar_log(p_ctrl_operacion := p_ctrl_operacion, p_prcs := v_crta_prcs_gral)

            INTO v_cod_rspta_lgtr, v_cod_rpta_descri_lgtr, v_lgtr;

        /* */

    END

    /* */;

    SELECT

        *

        FROM ada_db_us.aut_qusuarios$actualizarusuario(v_crta_prcs_gral, p_usuario)

        INTO F$RESULT_REC_2;

    p_cod_rta := F$RESULT_REC_2.P_COD_RPTA;

    p_errores := F$RESULT_REC_2.P_ERRORES;

    v_mensajes := F$RESULT_REC_2.P_MENSAJES

    /* */;

    IF (p_cod_rta = 'OK')

    /* */

    THEN

        /*

        [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

        commit

        */

        BEGIN

        END;

    /* */

    /* */

    ELSE

        /*

        [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

        rollback

        */

        BEGIN

        END;

    /* */

    END IF

    /* */;

    p_mensajes := v_mensajes

    /* */

    /* ============================================= */

    /* Luego de realizar todos los pasos se finaliza el log */

    /* de transaccion con el codigo general */

    /* ============================================= */;

    DECLARE

        v_cod_rspta_lgtr ADA_DB_US.GE_TCDER.cder_cder%TYPE;

        v_cod_rpta_descri_lgtr ADA_DB_US.GE_TCDER.cder_descri%TYPE;

    BEGIN

        IF (p_cod_rta = 'OK') THEN

            v_crta_crta_gral := 'COD_EXITOSO';

        ELSE

            v_crta_crta_gral := p_cod_rta;

        END IF;

        SELECT

            *

            FROM ada_db_us.ge_qlgtr$finalizar_log(p_lgtr := v_lgtr, p_crta := v_crta_crta_gral, p_id_entidad := COALESCE(v_lgtr_id_entidad, '-'), p_error := v_crta_descri_gral)

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

                        v_cod_rspta_crta ADA_DB_US.GE_TCDER.cder_cder%TYPE;

                        v_cod_rpta_descri_crta ADA_DB_US.GE_TCDER.cder_descri%TYPE;

                    BEGIN

                        SELECT

                            *

                            FROM ada_db_us.ge_qcrta$consultar_crta(v_crta_prcs_gral, v_crta_crta_gral)

                            INTO v_crta_http_gral, v_crta_descri_gral, v_cod_rspta_crta, v_cod_rpta_descri_crta;

                    END;

                    p_cod_rta := 'ERROR';

            END;

    /* */

END;

$BODY$;

ALTER FUNCTION ada_db_us."api_aut_qautenticacion$actualizarusuario"(ada_db_us.type_tt_ge_lgtr, ada_db_us.type_tt_au_usuario)
    OWNER TO ada_db_us;
