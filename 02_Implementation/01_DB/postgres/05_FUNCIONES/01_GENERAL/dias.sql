-- FUNCTION: ow_base_us.dias(timestamp without time zone, timestamp without time zone)

CREATE OR REPLACE FUNCTION ow_base_us.dias(
	fechamenor timestamp without time zone,
	fechamayor timestamp without time zone)
    RETURNS double precision
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

BEGIN

    RETURN TRUNC((EXTRACT (EPOCH FROM fechaMayor - fechaMenor) / 86400)::NUMERIC);

END;

$BODY$;

ALTER FUNCTION ow_base_us.dias(timestamp without time zone, timestamp without time zone)
    OWNER TO ow_base_us;
