-- FUNCTION: ow_base_us."api_ge_qparametros$obtenerlistaciudades"(double precision)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qparametros$obtenerlistaciudades"(
	OUT p_listciudades ow_base_us.type_tt_ge_ciud,
	p_depto double precision,
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

    c_ciud CURSOR FOR

    SELECT

        ciud_ciud, ciud_nombre, ciud_depto

        FROM ow_base_us.ge_tciud

        WHERE ciud_depto = p_depto

    /* NVL(p_depto,CIUD_DEPTO); */

    /* NVL(p_depto,CIUD_DEPTO); */

    /* */;

    to_ge_tciud ow_base_us.type_to_ge_ciud;

    tt_ge_tciud ow_base_us.type_tt_ge_ciud

    /* type de tipos de documentos */;

    v_crta_gral CHARACTER VARYING(5) := 'OK';

    v_proceso CHARACTER VARYING(50) := 'API_GE_QPARAMETROS.obtenerListaCiudades';

    v_mensaje ow_base_us.type_tt_ge_mnsje

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

/* */

/* */

BEGIN

    FOR i IN c_ciud

    /* */

    LOOP

        to_ge_tciud := ROW (i.ciud_ciud, i.ciud_nombre, i.ciud_depto)::ow_base_us.type_to_ge_ciud

        /* */;

        tt_ge_tciud[COALESCE(array_length(tt_ge_tciud, 1), 0)] := to_ge_tciud;

        /* */

    END LOOP

    /* */;

    p_listCiudades := tt_ge_tciud;

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

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qparametros$obtenerlistaciudades"(double precision)
    OWNER TO ow_base_us;
