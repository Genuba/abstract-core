-- FUNCTION: ow_base_us."aut_qusuarios$actualizarusuario"(text, ow_base_us.type_tt_au_usuario)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$actualizarusuario"(
	p_prcs text,
	p_usuario ow_base_us.type_tt_au_usuario,
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

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    v_crta_http_gral CHARACTER VARYING(5) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN 1..COALESCE(array_length(p_usuario, 1), 0) LOOP

        UPDATE ow_base_us.aut_tusuario

        SET usuario_medio_tok = COALESCE(p_usuario[i].usuario_medio_tok, usuario_medio_tok), usuario_tipo_aut = COALESCE(p_usuario[i].usuario_tipo_aut, usuario_tipo_aut), usuario_cambio_clave = COALESCE(p_usuario[i].usuario_cambio_clave, 'N'), usuario_avatar = COALESCE(p_usuario[i].usuario_avatar, usuario_avatar)

            WHERE usuario_usuario = p_usuario[i].usuario_usuario;

    END LOOP

    /* */;

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

ALTER FUNCTION ow_base_us."aut_qusuarios$actualizarusuario"(text, ow_base_us.type_tt_au_usuario)
    OWNER TO ow_base_us;
