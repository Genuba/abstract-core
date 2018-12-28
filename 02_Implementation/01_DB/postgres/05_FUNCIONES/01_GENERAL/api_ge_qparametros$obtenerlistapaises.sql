-- FUNCTION: ow_base_us."api_ge_qparametros$obtenerlistapaises"()

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qparametros$obtenerlistapaises"(
	OUT p_listapaises ow_base_us.type_tt_ge_pais,
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

    c_ge_tpais CURSOR FOR

    SELECT

        pais_pais, pais_nombre, pais_cod_iso, pais_cod_area

        FROM ow_base_us.ge_tpais

    /* */;

    to_ge_tpais ow_base_us.type_to_ge_pais;

    tt_ge_tpais ow_base_us.type_tt_ge_pais

    /* type de tipos de documentos */;

    v_crta_gral CHARACTER VARYING(5) := 'OK';

    v_proceso CHARACTER VARYING(50) := 'API_GE_QPARAMETROS.obtenerListaPaises'

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_ge_tpais

    /* */

    LOOP

        to_ge_tpais := ROW (i.pais_pais, i.pais_nombre, i.pais_cod_iso, i.pais_cod_area)::ow_base_us.type_to_ge_pais;

        tt_ge_tpais[COALESCE(array_length(tt_ge_tpais, 1), 0)] := to_ge_tpais;

        /* */

    END LOOP

    /* */;

    p_listaPaises := tt_ge_tpais;

    p_cod_rta := v_crta_gral

    /* */;

    to_ge_erro := ROW (CURRENT_TIMESTAMP, v_proceso, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

    tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

    p_errores := tt_ge_erro;

    SELECT

        *

        FROM ow_base_us.api_ge_qutils$generartypemensajerpta('COD_EXITOSO'::TEXT, v_proceso, v_mensaje)

        INTO v_mensaje;

    p_mensajes := v_mensaje

    /* */;

    EXCEPTION

        WHEN others THEN

            p_cod_rta := 'ERROR'

            /* */;

            to_ge_erro := ROW (CURRENT_TIMESTAMP, v_proceso, SQLSTATE, SQLERRM)::ow_base_us.type_to_ge_erro;

            tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

            p_errores := tt_ge_erro;

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta('ERR_WHEN_OTHERS'::TEXT, v_proceso, v_mensaje)

                INTO v_mensaje;

            p_mensajes := v_mensaje;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qparametros$obtenerlistapaises"()
    OWNER TO ow_base_us;
