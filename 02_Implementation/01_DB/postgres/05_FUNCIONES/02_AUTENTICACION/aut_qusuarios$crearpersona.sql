-- FUNCTION: ow_base_us."aut_qusuarios$crearpersona"(text, ow_base_us.type_tt_au_tpersn)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$crearpersona"(
	p_prcs text,
	p_tpersona ow_base_us.type_tt_au_tpersn,
	OUT p_cod_rpta text,
	OUT p_cod_persona double precision,
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

    v_crta_http_gral CHARACTER VARYING(3) := 'OK'

    /* */;

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN 1..COALESCE(array_length(p_tpersona, 1), 0)

    /* */

    LOOP

        INSERT INTO ow_base_us.aut_tpersn (persn_persn, persn_tpident, persn_numident, persn_pnombre, persn_snombre, persn_papellido, persn_sapellido, persn_celular, persn_fijo, persn_email, persn_direccion, persn_ciud, persn_usrcre, persn_fecact, persn_feccre, persn_origen, persn_estado)

        VALUES (DEFAULT, p_tpersona[i].persn_tpident, p_tpersona[i].persn_numident, p_tpersona[i].persn_pnombre, p_tpersona[i].persn_snombre, p_tpersona[i].persn_papellido, p_tpersona[i].persn_sapellido, p_tpersona[i].persn_celular, p_tpersona[i].persn_fijo, p_tpersona[i].persn_email, p_tpersona[i].persn_direccion, p_tpersona[i].persn_ciud, p_tpersona[i].persn_usrcre, NULL, CURRENT_TIMESTAMP, p_tpersona[i].persn_origen, COALESCE(p_tpersona[i].persn_estado, 'PRE'));

        /* */

    END LOOP

    /* */;

    p_cod_persona := currval('ow_base_us.aut_spersn');

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

ALTER FUNCTION ow_base_us."aut_qusuarios$crearpersona"(text, ow_base_us.type_tt_au_tpersn)
    OWNER TO ow_base_us;
