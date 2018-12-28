-- FUNCTION: ow_base_ext."dbms_random$value"(double precision, double precision)

CREATE OR REPLACE FUNCTION ow_base_ext."dbms_random$value"(
	p_start double precision DEFAULT 0,
	p_high double precision DEFAULT 1)
    RETURNS double precision
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE STRICT 
AS $BODY$

BEGIN

    RETURN random() * (p_high - p_start) + p_start;

END;

$BODY$;

ALTER FUNCTION ow_base_ext."dbms_random$value"(double precision, double precision)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext."dbms_random$value"(double precision, double precision)
    IS 'The first version of this function gets a random number greater than or equal to 0 and less than 1. The other version gets a random number "x", where "x" is greater than or equal to a specified lower limit and less than a specified higher limit.';
