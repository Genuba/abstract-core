-- FUNCTION: ow_base_us."api_ge_qutils$getmensajeporcodigo"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$getmensajeporcodigo"(
	p_codigo text,
	p_prcs text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    c_mensaje_rpta CURSOR FOR

    SELECT

        crta_descri

        FROM ow_base_us.ge_tcrta

        WHERE crta_crta = p_codigo AND crta_prcs = p_prcs

    /* */;

    v_mensaje_rpta OW_BASE_US.GE_TCRTA.CRTA_DESCRI%TYPE;

/* */

/* */

BEGIN

    OPEN c_mensaje_rpta;

    FETCH c_mensaje_rpta INTO v_mensaje_rpta;

    CLOSE c_mensaje_rpta;

    RETURN v_mensaje_rpta;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$getmensajeporcodigo"(text, text)
    OWNER TO ow_base_us;
