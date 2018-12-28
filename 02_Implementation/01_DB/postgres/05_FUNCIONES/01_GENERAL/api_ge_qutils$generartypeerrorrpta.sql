-- FUNCTION: ow_base_us."api_ge_qutils$generartypeerrorrpta"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$generartypeerrorrpta"(
	p_codigo text,
	p_prcs text,
	OUT p_type_mensaje ow_base_us.type_tt_ge_erro)
    RETURNS ow_base_us.type_tt_ge_erro
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    errorObject ow_base_us.type_to_ge_erro;

    errorTable ow_base_us.type_tt_ge_erro;

/* */

/* */

BEGIN

    errorObject := ROW (CURRENT_TIMESTAMP, p_prcs, p_codigo, p_codigo)::ow_base_us.type_to_ge_erro;

    p_type_mensaje[COALESCE(array_length(p_type_mensaje, 1), 0)] := errorObject;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$generartypeerrorrpta"(text, text)
    OWNER TO ow_base_us;
