-- FUNCTION: ow_base_us.add_days(timestamp without time zone, double precision)

CREATE OR REPLACE FUNCTION ow_base_us.add_days(
	fecha timestamp without time zone,
	dias double precision)
    RETURNS timestamp without time zone
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

BEGIN

    RETURN (fecha + (dias::NUMERIC || ' days')::INTERVAL);

END;

$BODY$;

ALTER FUNCTION ow_base_us.add_days(timestamp without time zone, double precision)
    OWNER TO ow_base_us;
