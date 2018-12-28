-- FUNCTION: ow_base_us."ge_qmenu$modulosporusuario"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qmenu$modulosporusuario"(
	p_prcs text,
	p_usuario text,
	OUT p_tmodulo ow_base_us.type_tt_ge_modulo,
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

    c_modulosporusuario CURSOR FOR

    SELECT DISTINCT

        ow_base_us.aut_tmodul.*

        FROM ow_base_us.aut_turol, ow_base_us.aut_tsrol, ow_base_us.aut_tservc, ow_base_us.aut_tmodul, ow_base_us.aut_tsurl

        WHERE urol_usuario = p_usuario AND urol_rol = srol_rol AND servicio_servicio = srol_servicio AND surl_servicio = servicio_servicio AND modulo_modulo = servicio_modulo AND srol_visible = 'S'

        ORDER BY modulo_orden ASC

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    to_ge_modulo ow_base_us.type_to_ge_modulo;

    tt_ge_modulo ow_base_us.type_tt_ge_modulo

    /* */;

    v_crta_http_gral CHARACTER VARYING(5) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_modulosporusuario

    /* */

    LOOP

        to_ge_modulo := ROW (i.modulo_modulo, i.modulo_descri, i.modulo_nomb)::ow_base_us.type_to_ge_modulo

        /* */;

        tt_ge_modulo[COALESCE(array_length(tt_ge_modulo, 1), 0)] := to_ge_modulo;

        /* */

    END LOOP

    /* */;

    p_tmodulo := tt_ge_modulo;

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

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta('ERR_WHEN_OTHERS'::TEXT, p_prcs, p_mensajes)

                INTO p_mensajes;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."ge_qmenu$modulosporusuario"(text, text)
    OWNER TO ow_base_us;
