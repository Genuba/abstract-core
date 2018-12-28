-- FUNCTION: ow_base_us."api_ge_qutils$registrar_error"(ow_base_us.type_tt_ge_erro, text, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$registrar_error"(
	INOUT p_errores ow_base_us.type_tt_ge_erro,
	p_prcs text,
	p_crta text,
	p_detalle text DEFAULT NULL::text)
    RETURNS ow_base_us.type_tt_ge_erro
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    v_object_error ow_base_us.type_to_ge_erro;

BEGIN

    v_object_error := ROW (CURRENT_TIMESTAMP, p_prcs, p_crta, p_detalle)::ow_base_us.type_to_ge_erro;

    p_errores[COALESCE(array_length(p_errores, 1), 0)] := v_object_error;

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$registrar_error"(ow_base_us.type_tt_ge_erro, text, text, text)
    OWNER TO ow_base_us;
