-- FUNCTION: ow_base_us."aut_qusuarios$getallusuarios"(text)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$getallusuarios"(
	p_prcs text,
	OUT p_tusuario ow_base_us.type_tt_au_usuario,
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

    c_usuario CURSOR FOR

    SELECT

        usuario_usuario, usuario_persn, persn_email AS usuario_mail, persn_celular AS usuario_celular, usuario_medio_tok, usuario_tipo_aut, usuario_usrcre, usuario_feccre, usuario_estado, usuario_cambio_clave, usuario_avatar,

        CASE usuario_estado

            WHEN 'INA' THEN 'Inactivo'

            WHEN 'ACT' THEN 'Activo'

            WHEN 'PPA' THEN 'Pendiente'

            WHEN 'PRE' THEN 'Precargado'

            ELSE 'Sin valor'

        END AS usuario_estado_desc

        FROM ow_base_us.aut_tusuario, ow_base_us.aut_tpersn

        WHERE usuario_persn = persn_persn

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    to_ge_usua ow_base_us.type_to_au_usuario;

    tt_ge_usua ow_base_us.type_tt_au_usuario

    /* */;

    v_crta_http_gral CHARACTER VARYING(3) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_usuario

    /* */

    LOOP

        to_ge_usua := ROW (i.usuario_usuario, i.usuario_persn, NULL, i.usuario_mail, i.usuario_celular, i.usuario_medio_tok, i.usuario_tipo_aut, NULL, NULL, i.usuario_usrcre, i.usuario_feccre, i.usuario_estado, i.usuario_cambio_clave, i.usuario_avatar, i.usuario_estado_desc)::ow_base_us.type_to_au_usuario

        /* */;

        tt_ge_usua[COALESCE(array_length(tt_ge_usua, 1), 0)] := to_ge_usua;

        /* */

    END LOOP;

    p_tusuario := tt_ge_usua;

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

ALTER FUNCTION ow_base_us."aut_qusuarios$getallusuarios"(text)
    OWNER TO ow_base_us;
