-- FUNCTION: ow_base_us."api_ge_qparametros$obtenerlistatipodocumentos"(text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qparametros$obtenerlistatipodocumentos"(
	OUT p_listtpdoc ow_base_us.type_tt_ge_tpdoc,
	p_tpclient text,
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

    c_cl_ttpdoc CURSOR FOR

    SELECT

        tdoc_tdoc, tdoc_doc, tdoc_tper

        FROM ow_base_us.ge_ttdoc

        WHERE tdoc_tper = COALESCE(p_tpClient, tdoc_tper)

    /* */;

    to_cl_tpdoc ow_base_us.type_to_ge_tpdoc;

    tt_cl_tpdoc ow_base_us.type_tt_ge_tpdoc

    /* type de tipos de documentos */;

    v_crta_gral CHARACTER VARYING(5) := 'OK';

    v_proceso CHARACTER VARYING(50) := 'API_GE_QPARAMETROS.obtenerListaTipoDocumentos';

    v_mensaje ow_base_us.type_tt_ge_mnsje

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

/* */

/* */

BEGIN

    FOR i IN c_cl_ttpdoc

    /* */

    LOOP

        to_cl_tpdoc := ROW (i.tdoc_tdoc, i.tdoc_doc, i.tdoc_tper)::ow_base_us.type_to_ge_tpdoc

        /* */;

        tt_cl_tpdoc[COALESCE(array_length(tt_cl_tpdoc, 1), 0)] := to_cl_tpdoc;

        /* */

    END LOOP

    /* */;

    p_listTpDoc := tt_cl_tpdoc;

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

    /* */

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

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qparametros$obtenerlistatipodocumentos"(text)
    OWNER TO ow_base_us;
