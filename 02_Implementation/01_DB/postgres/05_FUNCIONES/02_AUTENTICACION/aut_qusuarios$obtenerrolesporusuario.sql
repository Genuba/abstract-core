-- FUNCTION: ow_base_us."aut_qusuarios$obtenerrolesporusuario"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$obtenerrolesporusuario"(
	p_prcs text,
	p_usuario text,
	OUT p_rol ow_base_us.type_tt_au_rol,
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

    c_rolesporusuario CURSOR FOR

    SELECT DISTINCT

        r.*

        FROM ow_base_us.aut_turol AS ur, ow_base_us.aut_trol AS r

        WHERE ur.urol_usuario = p_usuario AND rol_rol = urol_rol

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    to_ge_rol ow_base_us.type_to_au_rol;

    tt_ge_rol ow_base_us.type_tt_au_rol

    /* */;

    v_crta_http_gral CHARACTER VARYING(3) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_rolesporusuario

    /* */

    LOOP

        to_ge_rol := ROW (i.rol_rol, i.rol_descri, i.rol_is_sistema)::ow_base_us.type_to_au_rol

        /* */;

        tt_ge_rol[COALESCE(array_length(tt_ge_rol, 1), 0)] := to_ge_rol;

        /* */

    END LOOP

    /* */;

    p_rol := tt_ge_rol;

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

            p_cod_rpta := 'ERROR';

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rpta, p_cod_rpta)::ow_base_us.type_to_ge_erro;

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

ALTER FUNCTION ow_base_us."aut_qusuarios$obtenerrolesporusuario"(text, text)
    OWNER TO ow_base_us;
