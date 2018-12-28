-- FUNCTION: ow_base_us.now()

CREATE OR REPLACE FUNCTION ow_base_us.now(
	)
    RETURNS timestamp without time zone
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

BEGIN

    RETURN (CURRENT_TIMESTAMP);

END;

$BODY$;

ALTER FUNCTION ow_base_us.now()
    OWNER TO ow_base_us;
