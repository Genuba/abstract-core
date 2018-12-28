-- FUNCTION: ow_base_us."aut_qusuarios$actualizarpersona"(text, ow_base_us.type_tt_au_tpersn)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$actualizarpersona"(
	p_prcs text,
	p_persona ow_base_us.type_tt_au_tpersn,
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

    v_crta_http_gral CHARACTER VARYING(3) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN 1..COALESCE(array_length(p_persona, 1), 0) LOOP

        UPDATE ow_base_us.aut_tpersn

        SET persn_pnombre = COALESCE(p_persona[i].persn_pnombre, persn_pnombre), persn_snombre = p_persona[i].persn_snombre, persn_papellido = COALESCE(p_persona[i].persn_papellido, persn_papellido), persn_sapellido = p_persona[i].persn_sapellido, persn_celular = COALESCE(p_persona[i].persn_celular, persn_celular), persn_fijo = p_persona[i].persn_fijo, persn_email = COALESCE(p_persona[i].persn_email, persn_email), persn_direccion = p_persona[i].persn_direccion, persn_ciud = COALESCE(p_persona[i].persn_ciud, persn_ciud), persn_fecact = CURRENT_TIMESTAMP

            WHERE persn_persn = p_persona[i].persn_persn;

    END LOOP

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

ALTER FUNCTION ow_base_us."aut_qusuarios$actualizarpersona"(text, ow_base_us.type_tt_au_tpersn)
    OWNER TO ow_base_us;
