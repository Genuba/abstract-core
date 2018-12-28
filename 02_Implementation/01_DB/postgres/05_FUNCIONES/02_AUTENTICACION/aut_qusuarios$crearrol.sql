-- FUNCTION: ow_base_us."aut_qusuarios$crearrol"(text, ow_base_us.type_tt_au_rol, ow_base_us.type_tt_ge_mnsje)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$crearrol"(
	p_prcs text,
	p_aut_trol ow_base_us.type_tt_au_rol,
	OUT p_cod_rta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	INOUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_crta_gral OW_BASE_US.GE_TCRTA.crta_crta%TYPE := 'OK';

    v_cod_mensaje OW_BASE_US.GE_TCRTA.crta_crta%TYPE;

    v_error CHARACTER VARYING(10) := 'ERROR';

    v_ok CHARACTER VARYING(2) := 'OK';

BEGIN

    FOR i IN 1..COALESCE(array_length(p_aut_trol, 1), 0) LOOP

        INSERT INTO ow_base_us.aut_trol (rol_rol, rol_descri, rol_is_sistema)

        VALUES (p_aut_trol[i].rol_rol, p_aut_trol[i].rol_descri, 'N');

    END LOOP;

    p_cod_rta := COALESCE(v_crta_gral, 'OK');

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

ALTER FUNCTION ow_base_us."aut_qusuarios$crearrol"(text, ow_base_us.type_tt_au_rol, ow_base_us.type_tt_ge_mnsje)
    OWNER TO ow_base_us;
