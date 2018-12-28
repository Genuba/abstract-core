-- FUNCTION: ow_base_ext.nls_parameters_init()

CREATE OR REPLACE FUNCTION ow_base_ext.nls_parameters_init(
	)
    RETURNS void
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vNlsTerritory VARCHAR;

    rec RECORD;

BEGIN

--TRY to get-set NLS

    vNlsTerritory := CURRENT_SETTING('NLS.TERRITORY', TRUE);

    

    IF vNlsTerritory IS NULL THEN

        SELECT COALESCE(MAX(nls_territory),'AMERICA')

        INTO vNlsTerritory

        FROM

        (

            SELECT nls_territory 

            FROM ow_base_ext.nls_parameters 

            WHERE pg_territory_ux = 

            (

                SELECT REGEXP_REPLACE(pd.datctype, '\..*', '')

                FROM pg_database pd

                WHERE pd.datname = CURRENT_DATABASE()

            )

            UNION

            SELECT nls_territory 

            FROM ow_base_ext.nls_parameters 

            WHERE pg_territory_win = 

            (

                SELECT REGEXP_REPLACE(pd.datctype, '\..*', '')

                FROM pg_database pd

                WHERE pd.datname = CURRENT_DATABASE()

            )

        ) nls;

        

        FOR rec IN

        (

            SELECT anp.nls_territory,

                anp.params_dictionary ->> 'NLS_CURRENCY' AS NLS_CURRENCY,

                anp.params_dictionary ->> 'NLS_ISO_CURRENCY' AS NLS_ISO_CURRENCY,

                anp.params_dictionary ->> 'NLS_DATE_FORMAT' AS NLS_DATE_FORMAT,

                anp.params_dictionary ->> 'NLS_DUAL_CURRENCY' AS NLS_DUAL_CURRENCY,

                anp.params_dictionary ->> 'NLS_NUMERIC_CHARACTERS' AS NLS_NUMERIC_CHARACTERS

            FROM ow_base_ext.nls_parameters anp

            WHERE anp.nls_territory = vNlsTerritory

        )

        LOOP

            vNlsTerritory := SET_CONFIG('NLS.TERRITORY', rec.nls_territory, FALSE);

            vNlsTerritory := SET_CONFIG('NLS.CURRENCY', rec.NLS_CURRENCY, FALSE);

            vNlsTerritory := SET_CONFIG('NLS.ISO_CURRENCY', rec.NLS_ISO_CURRENCY,  FALSE);

            vNlsTerritory := SET_CONFIG('NLS.DATE_FORMAT', rec.NLS_DATE_FORMAT, FALSE);

            vNlsTerritory := SET_CONFIG('NLS.DUAL_CURRENCY', rec.NLS_DUAL_CURRENCY,  FALSE);

            vNlsTerritory := SET_CONFIG('NLS.NUMERIC_CHARACTERS', rec.NLS_NUMERIC_CHARACTERS,  FALSE);

        END LOOP;

    END IF;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.nls_parameters_init()
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.nls_parameters_init()
    IS 'Set some NLS session parameters on first to_char/to_date/to_number call';
