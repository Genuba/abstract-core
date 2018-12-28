-- FUNCTION: ow_base_us."aut_qusuarios$getserviciosporrol"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$getserviciosporrol"(
	p_prcs text,
	OUT p_aut_tservicio ow_base_us.type_tt_ge_srvcio,
	p_rol_rol text,
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

    c_serviciorol CURSOR FOR

    SELECT

        servicio_servicio, servicio_modulo, servicio_descri, servicio_nomb

        FROM ow_base_us.aut_tservc, ow_base_us.aut_tsrol

        WHERE servicio_servicio = srol_servicio AND srol_rol = p_rol_rol

        ORDER BY servicio_modulo

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

    FOR i IN c_serviciorol

    /* */

    LOOP

        to_ge_servicio := ROW (i.servicio_servicio, i.servicio_modulo, i.servicio_descri, i.servicio_nomb, NULL, NULL, NULL, NULL, NULL, NULL, NULL)::ow_base_us.type_to_ge_srvcio

        /* */;

        tt_ge_servicio[COALESCE(array_length(tt_ge_servicio, 1), 0)] := to_ge_servicio;

        /* */

    END LOOP

    /* */;

    p_aut_tservicio := tt_ge_servicio;

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

ALTER FUNCTION ow_base_us."aut_qusuarios$getserviciosporrol"(text, text)
    OWNER TO ow_base_us;
