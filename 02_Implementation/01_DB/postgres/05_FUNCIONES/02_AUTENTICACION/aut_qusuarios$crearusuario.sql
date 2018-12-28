-- FUNCTION: ow_base_us."aut_qusuarios$crearusuario"(text, ow_base_us.type_tt_au_usuario, double precision)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$crearusuario"(
	p_prcs text,
	p_tusuario ow_base_us.type_tt_au_usuario,
	p_cod_persona double precision,
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

    v_crta_http_gral CHARACTER VARYING(3) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN 1..COALESCE(array_length(p_tusuario, 1), 0)

    /* */

    LOOP

        INSERT INTO ow_base_us.aut_tusuario (usuario_usuario, usuario_persn, usuario_clave, usuario_medio_tok, usuario_tipo_aut, usuario_usrcre, usuario_feccre, usuario_estado, usuario_cambio_clave, usuario_avatar)

        VALUES (p_tusuario[i].usuario_usuario, p_cod_persona, p_tusuario[i].usuario_clave, p_tusuario[i].usuario_medio_tok, p_tusuario[i].usuario_tipo_aut, p_tusuario[i].usuario_usrcre, CURRENT_TIMESTAMP, COALESCE(p_tusuario[i].usuario_estado, 'PRE'), p_tusuario[i].usuario_cambio_clave, 'usuario-default.png');

        /* */

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

ALTER FUNCTION ow_base_us."aut_qusuarios$crearusuario"(text, ow_base_us.type_tt_au_usuario, double precision)
    OWNER TO ow_base_us;
