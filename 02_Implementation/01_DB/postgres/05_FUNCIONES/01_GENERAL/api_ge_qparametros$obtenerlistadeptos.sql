-- FUNCTION: ow_base_us."api_ge_qparametros$obtenerlistadeptos"(double precision)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qparametros$obtenerlistadeptos"(
	OUT p_listapaises ow_base_us.type_tt_ge_depto,
	p_pais double precision,
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

    c_ge_depto CURSOR FOR

    SELECT

        depto_depto, depto_nombre, depto_pais

        FROM ow_base_us.ge_tdepto

        WHERE depto_pais = p_pais

    /* nvl(p_pais,DEPTO_PAIS); */

    /* */;

    to_ge_tdepto ow_base_us.type_to_ge_depto;

    tt_ge_tdepto ow_base_us.type_tt_ge_depto

    /* type de tipos de documentos */;

    v_crta_gral CHARACTER VARYING(5) := 'OK';

    v_proceso CHARACTER VARYING(50) := 'API_GE_QPARAMETROS.obtenerListaDeptos'

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_ge_depto

    /* */

    LOOP

        to_ge_tdepto := ROW (i.depto_depto, i.depto_nombre, i.depto_pais)::ow_base_us.type_to_ge_depto;

        tt_ge_tdepto[COALESCE(array_length(tt_ge_tdepto, 1), 0)] := to_ge_tdepto;

        /* */

    END LOOP

    /* */;

    p_listaPaises := tt_ge_tdepto;

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

ALTER FUNCTION ow_base_us."api_ge_qparametros$obtenerlistadeptos"(double precision)
    OWNER TO ow_base_us;
