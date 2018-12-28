-- FUNCTION: ow_base_us."api_ge_qutils$getnextvalue"(text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$getnextvalue"(
	p_nombre_secuencia text,
	OUT p_valor double precision)
    RETURNS double precision
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    c_next_value CURSOR (pc_nombre_secuencia TEXT) FOR

    SELECT

        ow_base_us.nextvalue(pc_nombre_secuencia);

/* */

/* */

BEGIN

    OPEN c_next_value (p_nombre_secuencia);

    FETCH c_next_value INTO p_valor;

    CLOSE c_next_value;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$getnextvalue"(text)
    OWNER TO ow_base_us;
