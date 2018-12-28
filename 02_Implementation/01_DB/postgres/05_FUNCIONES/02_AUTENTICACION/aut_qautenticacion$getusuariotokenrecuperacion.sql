-- FUNCTION: ow_base_us."aut_qautenticacion$getusuariotokenrecuperacion"(text, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qautenticacion$getusuariotokenrecuperacion"(
	p_prcs text,
	p_usuario text,
	p_token text,
	OUT p_usuariotoken ow_base_us.type_tt_au_usuario,
	OUT p_cod_rta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	OUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    c_consulta CURSOR FOR

    SELECT

        usuario_usuario, usuario_persn, persn_email AS usuario_mail, persn_celular AS usuario_celular, usuario_medio_tok, usuario_tipo_aut, usuario_recup_tok, usuario_fecrec_tok, usuario_usrcre, usuario_feccre, usuario_estado, usuario_cambio_clave, usuario_avatar,

        CASE usuario_estado

            WHEN 'INA' THEN 'Inactivo'

            WHEN 'ACT' THEN 'Activo'

            WHEN 'PPA' THEN 'Pendiente'

            WHEN 'PRE' THEN 'Precargado'

            ELSE 'Sin valor'

        END AS usuario_estado_desc

        FROM ow_base_us.aut_tusuario, ow_base_us.aut_tpersn

        WHERE usuario_usuario = p_usuario AND usuario_recup_tok = p_token AND usuario_persn = persn_persn AND CURRENT_TIMESTAMP <= usuario_fecrec_tok + (1::NUMERIC / 24::NUMERIC || ' days')::INTERVAL

    /* */;

    to_ge_usua ow_base_us.type_to_au_usuario;

    tt_ge_usua ow_base_us.type_tt_au_usuario

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    v_crta_gral OW_BASE_US.GE_TCRTA.crta_crta%TYPE := 'OK';

    v_cod_mensaje OW_BASE_US.GE_TCRTA.crta_crta%TYPE

    /* */;

    v_mensaje ow_base_us.type_tt_ge_mnsje;

BEGIN

    FOR i IN c_consulta LOOP

        to_ge_usua := ROW (i.usuario_usuario, i.usuario_persn, NULL, i.usuario_mail, i.usuario_celular, i.usuario_medio_tok, i.usuario_tipo_aut, i.usuario_recup_tok, i.usuario_fecrec_tok, i.usuario_usrcre, i.usuario_feccre, i.usuario_estado, i.usuario_cambio_clave, i.usuario_avatar, i.usuario_estado_desc)::ow_base_us.type_to_au_usuario;

        tt_ge_usua[COALESCE(array_length(tt_ge_usua, 1), 0)] := to_ge_usua;

    END LOOP;

    p_usuarioToken := tt_ge_usua;

    p_cod_rta := v_crta_gral;

    to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

    tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

    p_errores := tt_ge_erro;

    SELECT

        *

        FROM ow_base_us.api_ge_qutils$generartypemensajerpta('COD_EXITOSO'::TEXT, p_prcs, v_mensaje)

        INTO v_mensaje;

    p_mensajes := v_mensaje;

    EXCEPTION

        WHEN others THEN

            p_cod_rta := 'ERROR';

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, SQLSTATE, SQLERRM)::ow_base_us.type_to_ge_erro;

            tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

            p_errores := tt_ge_erro;

            v_cod_mensaje := 'ERR_WHEN_OTHERS';

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta(v_cod_mensaje, p_prcs, v_mensaje)

                INTO v_mensaje;

            p_mensajes := v_mensaje;

END;

$BODY$;

ALTER FUNCTION ow_base_us."aut_qautenticacion$getusuariotokenrecuperacion"(text, text, text)
    OWNER TO ow_base_us;
