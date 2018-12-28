-- FUNCTION: ow_base_us."api_ge_qutils$generartypemensajerpta"(text, text, ow_base_us.type_tt_ge_mnsje, text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$generartypemensajerpta"(
	p_codigo text,
	p_prcs text,
	INOUT p_type_mensaje ow_base_us.type_tt_ge_mnsje,
	p_textoadicional text DEFAULT ' '::text)
    RETURNS ow_base_us.type_tt_ge_mnsje
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    mensajeObject ow_base_us.type_to_ge_mnsje;

/* mensajeTabe   TYPE_TT_GE_MNSJE := TYPE_TT_GE_MNSJE(); */

/* */

/* */

BEGIN

    mensajeObject := ROW (CURRENT_TIMESTAMP, NULL, p_codigo, CONCAT_WS('', ow_base_us.api_ge_qutils$getmensajeporcodigo(p_codigo, p_prcs), ' ', p_textoAdicional))::ow_base_us.type_to_ge_mnsje

    /* mensajeTabe := TYPE_TT_GE_MNSJE(mensajeObject); */;

    p_type_mensaje[COALESCE(array_length(p_type_mensaje, 1), 0)] := mensajeObject;

    /* p_type_mensaje := mensajeTabe; */

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$generartypemensajerpta"(text, text, ow_base_us.type_tt_ge_mnsje, text)
    OWNER TO ow_base_us;
