-- FUNCTION: ow_base_us."aut_qautenticacion$cambiarpassword"(text, text, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qautenticacion$cambiarpassword"(
	p_prcs text,
	p_usuario text,
	p_actual text,
	p_nuevo text,
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

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_crta_http_gral CHARACTER VARYING(5) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

    v_cant_usuario DOUBLE PRECISION;

/* */

/* */

BEGIN

    SELECT

        COUNT(usuario_usuario)

        INTO STRICT v_cant_usuario

        FROM ow_base_us.aut_tusuario

        WHERE usuario_clave = p_actual AND usuario_usuario = p_usuario;

    IF (v_cant_usuario > 0) THEN

        UPDATE ow_base_us.aut_tusuario

        SET usuario_clave = p_nuevo

            WHERE usuario_usuario = p_usuario AND usuario_clave = p_actual;

    ELSE

        v_crta_http_gral := 'NOTF';

    /* NOT FOUND */

    END IF

    /* */;

    p_cod_rta := COALESCE(v_crta_http_gral, 'OK');

    to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

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

            p_cod_rta := 'ERROR';

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

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

ALTER FUNCTION ow_base_us."aut_qautenticacion$cambiarpassword"(text, text, text, text)
    OWNER TO ow_base_us;
