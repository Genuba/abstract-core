-- FUNCTION: ow_base_us."ge_qmenu$serviciosusuarioporurl"(text, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qmenu$serviciosusuarioporurl"(
	p_prcs text,
	p_usuario text,
	p_url text,
	OUT p_tservicio ow_base_us.type_tt_ge_srvcio,
	OUT p_cod_rpta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	OUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    c_serviciousuariourl CURSOR FOR

    SELECT DISTINCT

        ow_base_us.aut_tservc.*, ow_base_us.aut_tmodul.*, surl_url

        FROM ow_base_us.aut_turol, ow_base_us.aut_tsrol, ow_base_us.aut_tservc, ow_base_us.aut_tmodul, ow_base_us.aut_tsurl

        WHERE urol_usuario = p_usuario AND urol_rol = srol_rol AND servicio_servicio = srol_servicio AND surl_servicio = servicio_servicio AND modulo_modulo = servicio_modulo AND surl_url = p_url

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    to_ge_servicio ow_base_us.type_to_ge_srvcio;

    tt_ge_servicio ow_base_us.type_tt_ge_srvcio

    /* */;

    v_crta_http_gral CHARACTER VARYING(5) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_serviciousuariourl

    /* */

    LOOP

        to_ge_servicio := ROW (i.servicio_servicio, i.servicio_modulo, i.servicio_descri, i.servicio_nomb, i.surl_url, i.modulo_modulo, i.modulo_descri, i.modulo_nomb, ' ', ' ', 0)::ow_base_us.type_to_ge_srvcio

        /* */;

        tt_ge_servicio[COALESCE(array_length(tt_ge_servicio, 1), 0)] := to_ge_servicio;

        /* */

    END LOOP

    /* */;

    p_tservicio := tt_ge_servicio;

    p_cod_rpta := COALESCE(v_crta_http_gral, 'OK');

    to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rpta, p_cod_rpta)::ow_base_us.type_to_ge_erro;

    tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

    p_errores := tt_ge_erro;

    SELECT

        *

        FROM ow_base_us.api_ge_qutils$generartypemensajerpta('COD_EXITOSO'::TEXT, p_prcs, v_mensaje)

        INTO v_mensaje;

    p_mensajes := v_mensaje

    /* */;

    EXCEPTION

        WHEN others THEN

            p_cod_rpta := 'ERROR'

            /* */;

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, SQLSTATE, SQLERRM)::ow_base_us.type_to_ge_erro;

            tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

            p_errores := tt_ge_erro;

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta('ERR_WHEN_OTHERS'::TEXT, p_prcs, v_mensaje)

                INTO v_mensaje;

            p_mensajes := v_mensaje;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."ge_qmenu$serviciosusuarioporurl"(text, text, text)
    OWNER TO ow_base_us;
