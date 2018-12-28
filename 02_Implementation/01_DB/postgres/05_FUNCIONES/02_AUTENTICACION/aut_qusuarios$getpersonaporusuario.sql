-- FUNCTION: ow_base_us."aut_qusuarios$getpersonaporusuario"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$getpersonaporusuario"(
	p_prcs text,
	p_usuario text,
	OUT p_cod_rpta text,
	OUT p_tpersona ow_base_us.type_tt_au_tpersn,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	OUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    c_personaporusuario CURSOR FOR

    SELECT

        p.persn_persn AS persn_persn, p.persn_tpident AS persn_tpident, p.persn_numident AS persn_numident, p.persn_pnombre AS persn_pnombre, p.persn_snombre AS persn_snombre, p.persn_papellido AS persn_papellido, p.persn_sapellido AS persn_sapellido, p.persn_celular AS persn_celular, p.persn_fijo AS persn_fijo, p.persn_email AS persn_email, p.persn_direccion AS persn_direccion, pais_pais AS persn_pais, depto_depto AS persn_depto, p.persn_ciud AS persn_ciud, p.persn_usrcre AS persn_usrcre, p.persn_fecact AS persn_fecact, p.persn_feccre AS persn_feccre, p.persn_origen AS persn_origen, p.persn_estado AS persn_estado, pais_nombre AS persn_pais_desc, depto_nombre AS persn_depto_desc, ciud_nombre AS persn_ciud_desc

        FROM ow_base_us.aut_tusuario, ow_base_us.aut_tpersn AS p

        LEFT OUTER JOIN (ow_base_us.ge_tciud

        LEFT OUTER JOIN (ow_base_us.ge_tdepto

        LEFT OUTER JOIN ow_base_us.ge_tpais

            ON (ow_base_us.ge_tdepto.depto_pais = ow_base_us.ge_tpais.pais_pais))

            ON (ow_base_us.ge_tciud.ciud_depto = ow_base_us.ge_tdepto.depto_depto))

            ON (p.persn_ciud = ow_base_us.ge_tciud.ciud_ciud)

        WHERE persn_persn = usuario_persn AND usuario_usuario = p_usuario

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    to_aut_persona ow_base_us.type_to_au_tpersn;

    tt_aut_persona ow_base_us.type_tt_au_tpersn

    /* */;

    v_crta_http_gral CHARACTER VARYING(5) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_personaporusuario

    /* */

    LOOP

        to_aut_persona := ROW (i.persn_persn, i.persn_tpident, i.persn_numident, i.persn_pnombre, i.persn_snombre, i.persn_papellido, i.persn_sapellido, i.persn_celular, i.persn_fijo, i.persn_email, i.persn_direccion, i.persn_pais, i.persn_depto, i.persn_ciud, i.persn_usrcre, i.persn_fecact, i.persn_feccre, i.persn_origen, i.persn_estado, i.persn_pais_desc, i.persn_depto_desc, i.persn_ciud_desc)::ow_base_us.type_to_au_tpersn;

        tt_aut_persona := ARRAY[to_aut_persona]::ow_base_us.type_tt_au_tpersn;

        /* */

    END LOOP

    /* */;

    p_tpersona := tt_aut_persona;

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

ALTER FUNCTION ow_base_us."aut_qusuarios$getpersonaporusuario"(text, text)
    OWNER TO ow_base_us;
