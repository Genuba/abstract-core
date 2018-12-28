-- FUNCTION: ow_base_us."api_ge_qparametros$obtenerciuddeppais"(double precision)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qparametros$obtenerciuddeppais"(
	p_ciud_ciud double precision,
	OUT p_listciudades ow_base_us.type_tt_ge_ciud,
	OUT p_listadepto ow_base_us.type_tt_ge_depto,
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

    v_to_ciud ow_base_us.type_to_ge_ciud;

    v_tt_ciud ow_base_us.type_tt_ge_ciud;

    v_to_pais ow_base_us.type_to_ge_pais;

    v_tt_pais ow_base_us.type_tt_ge_pais;

    v_to_depto ow_base_us.type_to_ge_depto;

    v_tt_depto ow_base_us.type_tt_ge_depto;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_crta_gral OW_BASE_US.GE_TCRTA.crta_crta%TYPE := 'OK';

    v_cod_mensaje OW_BASE_US.GE_TCRTA.crta_crta%TYPE;

    v_mensaje ow_base_us.type_tt_ge_mnsje;

    v_proceso CHARACTER VARYING(50) := 'API_GE_QPARAMETROS.obtenerCiudDepPais'

    /* */;

    c_ciud CURSOR FOR

    SELECT

        ciud_ciud, ciud_nombre, ciud_depto

        FROM ow_base_us.ge_tciud

        WHERE ciud_ciud = p_ciud_ciud

    /* */;

    c_depto CURSOR (pc_depto TEXT) FOR

    SELECT

        depto_depto, depto_nombre, depto_pais

        FROM ow_base_us.ge_tdepto

        WHERE depto_depto = pc_depto::NUMERIC

    /* */;

    c_pais CURSOR (pc_pais DOUBLE PRECISION) FOR

    SELECT

        pais_pais, pais_nombre, pais_cod_iso, pais_cod_area

        FROM ow_base_us.ge_tpais

        WHERE pais_pais = pc_pais;

/* */

/* */

BEGIN

    FOR i IN c_ciud

    /* */

    LOOP

        v_to_ciud := ROW (i.ciud_ciud, i.ciud_nombre, i.ciud_depto)::ow_base_us.type_to_ge_ciud

        /* */;

        v_tt_ciud[COALESCE(array_length(v_tt_ciud, 1), 0)] := v_to_ciud

        /* */;

        FOR j IN c_depto (i.ciud_depto)

        /* */

        LOOP

            v_to_depto := ROW (j.depto_depto, j.depto_nombre, j.depto_pais)::ow_base_us.type_to_ge_depto

            /* */;

            v_tt_depto[COALESCE(array_length(v_tt_depto, 1), 0)] := v_to_depto

            /* */;

            FOR k IN c_pais (j.depto_pais)

            /* */

            LOOP

                v_to_pais := ROW (k.pais_pais, k.pais_nombre, k.pais_cod_iso, k.pais_cod_area)::ow_base_us.type_to_ge_pais

                /* */;

                v_tt_pais[COALESCE(array_length(v_tt_pais, 1), 0)] := v_to_pais;

                /* */

            END LOOP;

            /* */

        END LOOP;

        /* */

    END LOOP

    /* */;

    p_listCiudades := v_tt_ciud;

    p_listaPaises := v_tt_pais;

    p_listaDepto := v_tt_depto

    /* */;

    p_cod_rta := v_crta_gral;

    to_ge_erro := ROW (CURRENT_TIMESTAMP, v_proceso, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

    tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

    p_errores := tt_ge_erro;

    SELECT

        *

        FROM ow_base_us.api_ge_qutils$generartypemensajerpta('COD_EXITOSO'::TEXT, v_proceso, v_mensaje)

        INTO v_mensaje;

    p_mensajes := v_mensaje;

    EXCEPTION

        WHEN others THEN

            p_cod_rta := 'ERROR';

            to_ge_erro := ROW (CURRENT_TIMESTAMP, v_proceso, SQLSTATE, SQLERRM)::ow_base_us.type_to_ge_erro;

            tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

            p_errores := tt_ge_erro;

            v_cod_mensaje := 'ERR_WHEN_OTHERS';

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta(v_cod_mensaje, v_proceso, v_mensaje)

                INTO v_mensaje;

            p_mensajes := v_mensaje;

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qparametros$obtenerciuddeppais"(double precision)
    OWNER TO ow_base_us;
