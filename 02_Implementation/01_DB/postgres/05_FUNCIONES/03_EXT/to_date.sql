-- FUNCTION: ow_base_ext.to_date

-- FUNCTION: ow_base_ext.to_date(character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_date(
	pval character varying)
    RETURNS timestamp without time zone
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    

    vResult TIMESTAMP DEFAULT NULL;

    vFmt VARCHAR;

BEGIN

    

    PERFORM ow_base_ext.nls_parameters_init();

    

    SELECT nls_date_format

    INTO vFmt

    FROM ow_base_ext.v$nls_parameters;

    vResult := ow_base_ext.to_date

    (

        pVal => pVal,

        pFmt => vFmt

    );

    RETURN vResult::TIMESTAMP(0);

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_date(character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_date(character varying)
    IS 'Converts VARCHAR2 to DATE as Oracle does';

    -- FUNCTION: ow_base_ext.to_date(character varying, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_date(
	pval character varying,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS timestamp without time zone
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult TIMESTAMP DEFAULT NULL;

    vFmt VARCHAR;

    vValFormatted VARCHAR;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        SELECT vval,

            format

        INTO vValFormatted,

            vFmt

        FROM ow_base_ext.to_date_formatter

        (

            pVal      => pVal,

            pFormat   => pFmt,

            pNlsParam => pNlsParam

        );

        vResult := TO_TIMESTAMP(vValFormatted, vFmt);

    END IF;

    RETURN vResult::TIMESTAMP(0);

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_date(character varying, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_date(character varying, character varying, character varying)
    IS 'Converts VARCHAR2 to DATE as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

    -- FUNCTION: ow_base_ext.to_date_formatter(character varying, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_date_formatter(
	pval character varying,
	pformat character varying DEFAULT NULL::character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS TABLE(vval character varying, format character varying) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1
AS $BODY$

DECLARE

    v_lctime VARCHAR;

    vNlsParam VARCHAR;

    vFmt VARCHAR;

    rec RECORD;

    vVal VARCHAR;

    vResult VARCHAR;

    vtail VARCHAR;

    vfm VARCHAR;

    verrorMessages CONSTANT VARCHAR[] := ARRAY

    [

        'ORA-01821: date format not recognized', --1

        'not implemented', --2

        'ORA-12702: invalid NLS parameter string used in SQL function', --3

        'ORA-01843: not a valid month', --4

        'ORA-01846: not a valid day of the week' --5

    ];

    --used to calculate localized day/month names

    cDayMonthNumbers CONSTANT INTEGER[] := ARRAY[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    vMonthNumber INTEGER DEFAULT NULL;

    vLocalName VARCHAR;

    vGlobalName VARCHAR;

    vDayNumber INTEGER DEFAULT NULL;

    vIncompleteYear INTEGER;

BEGIN

    vVal := pVal;

    IF pFormat = '' THEN

        vResult := NULL;

    ELSE

        vtail:= pFormat;

        LOOP

            SELECT ok, tail, fm

            INTO vFmt, vtail, vfm

            FROM ow_base_ext.to_char_parser

            (

                pStr  => vtail,

                pType => 'datetime',

                pFm   => vfm

            );

            vResult := CONCAT(vResult, vFmt);

            EXIT WHEN vtail IS NULL;

        END LOOP;

    END IF;

    -- store original language

    v_lctime := CURRENT_SETTING('lc_time');

    IF pNlsParam IS NOT NULL THEN

        vNlsParam := REPLACE(pNlsParam,' ', '');

        SELECT STRING_AGG(TRIM(nls),'')

        INTO vNlsParam

        FROM  REGEXP_SPLIT_TO_TABLE

        ( 

            vNlsParam,

            'NLS_',

            'i'

        ) nls

        WHERE TRIM(nls) <> '' AND TRIM(nls) !~* 'CALENDAR';

        IF vNlsParam IS NOT NULL THEN

            IF vNlsParam  !~* 'DATE_LANGUAGE=' THEN

                RAISE USING MESSAGE := verrorMessages[3];

            END IF;

            vNlsParam := REGEXP_REPLACE(vNlsParam, 'DATE_LANGUAGE=', '', 'i');

            -- try to set NLS

            BEGIN

            

                PERFORM SET_CONFIG('lc_time', vNlsParam, TRUE);

            EXCEPTION 

                WHEN OTHERS THEN

                    RAISE USING MESSAGE := verrorMessages[3]; 

            END;

            

        END IF;

    END IF;

    -- month literal

    IF vResult ~* 'TMMONTH' THEN

        FOR rec IN

        (

            WITH mnames AS

            (

                SELECT val,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'), 'TMMONTH') AS localMonthName,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'), 'MONTH') AS monthName

                FROM UNNEST(cDayMonthNumbers) AS val

            )

            SELECT m.val,

                m.localMonthName,

                m.monthName

            FROM mnames m

            WHERE pVal ~* m.localMonthName

        )

        LOOP

            vMonthNumber := rec.val;

            vLocalName := rec.localMonthName;

            vGlobalName := rec.monthName;

        END LOOP;

        IF vMonthNumber IS NULL THEN

            RAISE USING MESSAGE := verrorMessages[4];

        END IF;

        vResult := REGEXP_REPLACE(vResult, 'TMMONTH', 'MONTH', 'i');

        vVal := REGEXP_REPLACE(vVal, vLocalName, vGlobalName, 'i');

    END IF;

    IF vResult ~* 'TMMON' THEN

        FOR rec IN

        (

            WITH mnames AS

            (

                SELECT val,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'), 'TMMON') AS localMonthName,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'), 'MON') AS monthName

                FROM UNNEST(cDayMonthNumbers) AS val

            )

            SELECT m.val,

                m.localMonthName,

                m.monthName

            FROM mnames m

            WHERE pVal ~* m.localMonthName

        )

        LOOP

            vMonthNumber := rec.val;

            vLocalName := rec.localMonthName;

            vGlobalName := rec.monthName;

        END LOOP;

        IF vMonthNumber IS NULL THEN

            RAISE USING MESSAGE := verrorMessages[4];

        END IF;

            vResult := REGEXP_REPLACE(vResult, 'TMMON', 'MON', 'i');

            vVal := REGEXP_REPLACE(vVal, vLocalName, vGlobalName, 'i');

    END IF;

    -- day literal

    IF vResult ~* 'TMDAY' THEN

        FOR rec IN

        (

            WITH mnames AS

            (

                SELECT val,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '102017'), 'ddmmyyyy'), 'TMDAY') AS localDayName,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '102017'), 'ddmmyyyy'), 'DAY') AS dayName

                FROM UNNEST(cDayMonthNumbers) AS val

                WHERE val BETWEEN 2 AND 8

            )

            SELECT m.val,

                m.localDayName,

                m.dayName

            FROM mnames m

            WHERE pVal ~* m.localDayName

        )

        LOOP

            vDayNumber := rec.val;

            vLocalName := rec.localDayName;

            vGlobalName := rec.dayName;

        END LOOP;

        IF vDayNumber IS NULL THEN

            RAISE USING MESSAGE := verrorMessages[5];

        END IF;

            vResult := REGEXP_REPLACE(vResult, 'TMDAY', 'DAY', 'i');

            vVal := REGEXP_REPLACE(vVal, vLocalName, vGlobalName, 'i');

    END IF;

    IF vResult ~* 'TMDY' THEN

        FOR rec IN

        (

            WITH mnames AS

            (

                SELECT val,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '102017'), 'ddmmyyyy'), 'TMDY') AS localDayName,

                    TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '102017'), 'ddmmyyyy'), 'DY') AS dayName

                FROM UNNEST(cDayMonthNumbers) AS val

                WHERE val BETWEEN 2 AND 8

            )

            SELECT m.val,

                m.localDayName,

                m.dayName

            FROM mnames m

            WHERE pVal ~* m.localDayName

        )

        LOOP

            vDayNumber := rec.val;

            vLocalName := rec.localDayName;

            vGlobalName := rec.dayName;

        END LOOP;

        IF vDayNumber IS NULL THEN

            RAISE USING MESSAGE := verrorMessages[5];

        END IF;

            vResult := REGEXP_REPLACE(vResult, 'TMDY', 'DY', 'i');

            vVal := REGEXP_REPLACE(vVal, vLocalName, vGlobalName, 'i');

    END IF;

    -- try to calculate incomplete dates

    BEGIN

        vIncompleteYear := EXTRACT(YEAR FROM TO_TIMESTAMP(vVal, vResult));

    EXCEPTION

        WHEN OTHERS THEN

            vIncompleteYear := -1;

    END;

    IF vIncompleteYear = -1 THEN

        vVal := CONCAT

        (

            LPAD(EXTRACT(YEAR FROM CLOCK_TIMESTAMP()::TIMESTAMP(0))::TEXT, 4, '0'),

            CASE WHEN vResult !~* 'MM|MON|MONTH' THEN LPAD(EXTRACT(MONTH FROM CLOCK_TIMESTAMP()::TIMESTAMP(0))::TEXT, 2, '0') ELSE '' END,

            vVal

        );

        vResult := CONCAT

        (

            'YYYY',

            CASE WHEN vResult !~* 'MM|MON|MONTH' THEN 'MM' ELSE '' END,

            vResult

        );

    END IF;

    -- restore language setting if they were changed

    IF CURRENT_SETTING('lc_time') <> v_lctime THEN

        v_lctime := SET_CONFIG('lc_time', v_lctime, TRUE);

    END IF;

    RETURN QUERY VALUES(vVal, vResult);

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_date_formatter(character varying, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_date_formatter(character varying, character varying, character varying)
    IS 'Utility function making to_char results similar to expected on Oracle side';
