-- FUNCTION: ow_base_us.nextvalue(text)

CREATE OR REPLACE FUNCTION ow_base_us.nextvalue(
	sequencename text)
    RETURNS double precision
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    result DOUBLE PRECISION;

BEGIN

    EXECUTE (CONCAT_WS('', 'SELECT      ', sequencename, '.nextval')) INTO STRICT result;

    RETURN (result);

END;

$BODY$;

ALTER FUNCTION ow_base_us.nextvalue(text)
    OWNER TO ow_base_us;
