-- FUNCTION: ow_base_us."aut_qusuarios$getrol"(text, text, ow_base_us.type_tt_ge_mnsje)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$getrol"(
	p_prcs text,
	OUT p_aut_trol ow_base_us.type_tt_au_rol,
	p_rol_rol text,
	OUT p_cod_rta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	INOUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    c_consulta CURSOR FOR

    SELECT

        rol_rol, rol_descri, rol_is_sistema

        FROM ow_base_us.aut_trol

        WHERE rol_rol = p_rol_rol;

    to_sgc_to_aut_trol ow_base_us.type_to_au_rol;

    tt_sgc_tt_aut_trol ow_base_us.type_tt_au_rol;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_crta_gral OW_BASE_US.GE_TCRTA.crta_crta%TYPE := 'OK';

    v_cod_mensaje OW_BASE_US.GE_TCRTA.crta_crta%TYPE;

BEGIN

    FOR i IN c_consulta LOOP

        to_sgc_to_aut_trol := ROW (i.rol_rol, i.rol_descri, i.rol_is_sistema)::ow_base_us.type_to_au_rol;

        tt_sgc_tt_aut_trol[COALESCE(array_length(tt_sgc_tt_aut_trol, 1), 0)] := to_sgc_to_aut_trol;

    END LOOP;

    p_aut_trol := tt_sgc_tt_aut_trol;

    p_cod_rta := v_crta_gral;

    to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

    tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

    p_errores := tt_ge_erro;

    SELECT

        *

        FROM ow_base_us.api_ge_qutils$generartypemensajerpta('COD_EXITOSO'::TEXT, p_prcs, p_mensajes)

        INTO p_mensajes;

    EXCEPTION

        WHEN others THEN

            p_cod_rta := 'ERROR';

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, SQLSTATE, SQLERRM)::ow_base_us.type_to_ge_erro;

            tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

            p_errores := tt_ge_erro;

            v_cod_mensaje := 'ERR_WHEN_OTHERS';

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta(v_cod_mensaje, p_prcs, p_mensajes)

                INTO p_mensajes;

END;

$BODY$;

ALTER FUNCTION ow_base_us."aut_qusuarios$getrol"(text, text, ow_base_us.type_tt_ge_mnsje)
    OWNER TO ow_base_us;
