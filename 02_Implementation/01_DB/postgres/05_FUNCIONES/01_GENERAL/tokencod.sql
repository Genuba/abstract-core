-- FUNCTION: ow_base_us.tokencod(double precision, text)

CREATE OR REPLACE FUNCTION ow_base_us.tokencod(
	p_digitos double precision,
	p_alfa text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    cod CHARACTER VARYING(128);

    v_digitos DOUBLE PRECISION;

    v_alfa CHARACTER VARYING(10);

    v_digitos_def DOUBLE PRECISION;

    v_alfa_def CHARACTER VARYING(10);

    v_cant_digitos DOUBLE PRECISION;

    v_cant_alfa DOUBLE PRECISION;

BEGIN

    SELECT

        COUNT(config_valor)

        INTO STRICT v_cant_digitos

        FROM ow_base_us.ge_tconfig

        WHERE config_config = 'Token.Default.longitud';

    IF (v_cant_digitos > 0) THEN

        SELECT

            config_valor

            INTO STRICT v_digitos_def

            FROM ow_base_us.ge_tconfig

            WHERE config_config = 'Token.Default.longitud';

    ELSE

        v_digitos_def := 6;

    END IF;

    SELECT

        COUNT(config_valor)

        INTO STRICT v_cant_alfa

        FROM ow_base_us.ge_tconfig

        WHERE config_config = 'Token.Default.alfanumerico';

    IF (v_cant_alfa > 0) THEN

        SELECT

            config_valor

            INTO STRICT v_alfa_def

            FROM ow_base_us.ge_tconfig

            WHERE config_config = 'Token.Default.alfanumerico';

    ELSE

        v_alfa_def := 'FALSE';

    END IF;

    v_digitos := COALESCE(p_digitos, v_digitos_def);

    v_alfa := COALESCE(p_alfa, v_alfa_def);

    IF (UPPER(v_alfa) = 'FALSE') THEN

        SELECT

            ow_base_ext.to_char(ROUND(ow_base_ext.dbms_random$value(POWER(10, v_digitos - 1), POWER(10, v_digitos) - 1))) AS num

            INTO STRICT cod;

    ELSE

        SELECT

            ow_base_ext.dbms_random$string('X', v_digitos) AS num

            INTO STRICT cod;

    END IF;

    RETURN cod;

END;

$BODY$;

ALTER FUNCTION ow_base_us.tokencod(double precision, text)
    OWNER TO ow_base_us;
