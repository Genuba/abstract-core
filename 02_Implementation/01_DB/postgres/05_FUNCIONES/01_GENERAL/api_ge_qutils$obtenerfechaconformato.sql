-- FUNCTION: ow_base_us."api_ge_qutils$obtenerfechaconformato"(text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$obtenerfechaconformato"(
	p_fecha_in text,
	OUT p_fecha_out text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    v_fecha CHARACTER VARYING(20);

/* */

BEGIN

    SELECT

        ow_base_ext.to_char(ow_base_ext.to_date(p_fecha_in, 'dd/mm/yy'), 'dd/mm/yyyy')

        INTO STRICT v_fecha

    /* */;

    p_fecha_out := v_fecha;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$obtenerfechaconformato"(text)
    OWNER TO ow_base_us;
