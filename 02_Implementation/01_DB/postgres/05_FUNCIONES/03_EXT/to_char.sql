-- FUNCTION: ow_base_ext.to_char

-- FUNCTION: ow_base_ext.to_char(character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL AND pVal <> '' THEN

    

        vResult := ow_base_ext.to_char_formatter

        (

            pVal => pVal

        );

    END IF;

    RETURN vResult;

    

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(character varying)
    IS 'to_char convertion VARCHAR2 as Oracle does';
    
-- FUNCTION: ow_base_ext.to_char(character)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval character)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL AND pVal <> '' THEN

    

        vResult := ow_base_ext.to_char_formatter

        (

            pVal => pVal

        );

    END IF;

    RETURN vResult;

    

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(character)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(character)
    IS 'to_char convertion CHAR as Oracle does';

-- FUNCTION: ow_base_ext.to_char(double precision)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval double precision)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => '', -- not used

            pNoNumberFormat => '' -- value is just a flag

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(double precision)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(double precision)
    IS 'to_char convertion Number as Oracle does';


-- FUNCTION: ow_base_ext.to_char(double precision, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval double precision,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => pFmt,

            pNlsParam => pNlsParam

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(double precision, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(double precision, character varying, character varying)
    IS 'to_char convertion Number as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

-- FUNCTION: ow_base_ext.to_char(integer)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval integer)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => '', -- not used

            pNoNumberFormat => '' -- value is just a flag

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(integer)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(integer)
    IS 'to_char convertion Number as Oracle does';

-- FUNCTION: ow_base_ext.to_char(integer, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval integer,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => pFmt,

            pNlsParam => pNlsParam

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(integer, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(integer, character varying, character varying)
    IS 'to_char convertion Number as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

-- FUNCTION: ow_base_ext.to_char(interval)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval interval)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    RETURN ow_base_ext.to_char

    (

        pVal => pVal,

        pFmt => 'd' -- won't be used, just to pass something correct

    );

    

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(interval)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(interval)
    IS 'to_char convertion interval with TZ as Oracle does';

-- FUNCTION: ow_base_ext.to_char(interval, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval interval,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult VARCHAR DEFAULT NULL;

    vFmt VARCHAR;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        IF LENGTH(pFmt) <> 0 THEN

            vFmt := ow_base_ext.to_char_formatter

            (

                pVal      => pVal,

                pFormat   => pFmt,

                pNlsParam => pNlsParam

            );

            -- it is year to month 

            IF pVal::TEXT ~* 'YEAR' OR pVal::TEXT ~* 'MON' THEN

                vResult := CONCAT

                (

                    COALESCE(SUBSTRING(EXTRACT(year FROM pVal)::TEXT FROM '-'),'+'),

                    CASE

                        WHEN EXTRACT(year FROM pVal) < 2 THEN

                            LPAD(SUBSTRING(EXTRACT(year FROM pVal)::TEXT FROM '\d+'), 2, '0')

                        ELSE

                            SUBSTRING(EXTRACT(year FROM pVal)::TEXT FROM '\d+')

                    END,

                    '-',

                    LPAD(ABS(EXTRACT(month FROM pVal))::TEXT, 2, '0')

                );

            -- it is day to second

            ELSE

                vResult := CONCAT

                (

                    COALESCE(SUBSTRING(EXTRACT(day FROM pVal)::TEXT FROM '\-'),'+'),

                    LPAD(SUBSTRING(EXTRACT(day FROM pVal)::TEXT FROM '\d+'), 2, '0'),

                    ' ',

                    LPAD(EXTRACT(hour FROM pVal)::TEXT, 2, '0'),

                    ':',

                    LPAD(EXTRACT(minute FROM pVal)::TEXT, 2, '0'),

                    ':',

                    CASE 

                        WHEN STRPOS(pVal::TEXT, '.') >0 THEN

                            REGEXP_REPLACE(LPAD(EXTRACT(microseconds FROM pVal)::TEXT, 8, '0'), '(\d\d)(\d+)', '\1.\2')

                        ELSE

                            LPAD(EXTRACT(seconds FROM pVal)::TEXT, 2, '0')

                    END

                );

            END IF;

        END IF;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(interval, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(interval, character varying, character varying)
    IS 'to_char convertion interval with TZ as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

-- FUNCTION: ow_base_ext.to_char(numeric)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval numeric)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => '', -- not used

            pNoNumberFormat => '' -- value is just a flag

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(numeric)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(numeric)
    IS 'to_char convertion Number as Oracle does';

    -- FUNCTION: ow_base_ext.to_char(numeric, character varying, character varying)

-- DROP FUNCTION ow_base_ext.to_char(numeric, character varying, character varying);

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval numeric,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => pFmt,

            pNlsParam => pNlsParam

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(numeric, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(numeric, character varying, character varying)
    IS 'to_char convertion Number as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

    -- FUNCTION: ow_base_ext.to_char(real)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval real)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => '', -- not used

            pNoNumberFormat => '' -- value is just a flag

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(real)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(real)
    IS 'to_char convertion Number as Oracle does';

    -- FUNCTION: ow_base_ext.to_char(real, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval real,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt     VARCHAR;

    vResult  VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => pFmt,

            pNlsParam => pNlsParam

        );

        vResult := vFmt;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(real, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(real, character varying, character varying)
    IS 'to_char convertion Number as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

    -- FUNCTION: ow_base_ext.to_char(text)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval text)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult VARCHAR DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL AND pVal <> '' THEN

    

        vResult := ow_base_ext.to_char_formatter

        (

            pVal => pVal

        );

    END IF;

    RETURN vResult;

    

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(text)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(text)
    IS 'to_char convertion CLOB as Oracle does';

    -- FUNCTION: ow_base_ext.to_char(timestamp with time zone)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval timestamp with time zone)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt VARCHAR;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    SELECT nls_timestamp_tz_format

    INTO vFmt

    FROM ow_base_ext.v$nls_parameters;

    RETURN ow_base_ext.to_char

    (

        pVal => pVal,

        pFmt => vFmt

    );

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(timestamp with time zone)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(timestamp with time zone)
    IS 'to_char convertion timestamp with TZ as Oracle does';

    -- FUNCTION: ow_base_ext.to_char(timestamp with time zone, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval timestamp with time zone,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult VARCHAR DEFAULT NULL;

    vFmt VARCHAR;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => pFmt,

            pNlsParam => pNlsParam

        );

        vResult := TO_CHAR(pVal, vFmt);

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(timestamp with time zone, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(timestamp with time zone, character varying, character varying)
    IS 'to_char convertion timestamp with TZ as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

    -- FUNCTION: ow_base_ext.to_char(timestamp without time zone)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval timestamp without time zone)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt VARCHAR;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF SUBSTRING(TO_CHAR(EXTRACT('epoch' FROM pVal), '9999999999D9999999'),12,6) = '.00000' THEN

        SELECT nls_date_format

        INTO vFmt

        FROM ow_base_ext.v$nls_parameters;

    ELSE

        SELECT nls_timestamp_format

        INTO vFmt

        FROM ow_base_ext.v$nls_parameters;

    END IF;

    RETURN ow_base_ext.to_char

    (

        pVal => pVal,

        pFmt => vFmt

    );

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(timestamp without time zone)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(timestamp without time zone)
    IS 'to_char convertion date or timestamp without TZ as Oracle does';

    -- FUNCTION: ow_base_ext.to_char(timestamp without time zone, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char(
	pval timestamp without time zone,
	pfmt character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult VARCHAR DEFAULT NULL;

    vFmt VARCHAR;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vFmt := ow_base_ext.to_char_formatter

        (

            pVal      => pVal,

            pFormat   => pFmt,

            pNlsParam => pNlsParam

        );

        vResult := TO_CHAR(pVal, vFmt);

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char(timestamp without time zone, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char(timestamp without time zone, character varying, character varying)
    IS 'to_char convertion date or timestamp without TZ as Oracle does. Some Format models could return incorrect results. Only NLS_DATE_LANGUAGE is allowed for NLS param. Value must be correct as lc_time value';

-- FUNCTION: ow_base_ext.to_char_formatter(anyelement, character varying, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_char_formatter(
	pval anyelement,
	pformat character varying DEFAULT NULL::character varying,
	pnlsparam character varying DEFAULT NULL::character varying,
	pnonumberformat character varying DEFAULT NULL::character varying)
    RETURNS character varying
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vFmt VARCHAR;

    rec RECORD;

    vResult VARCHAR;

    vDataType VARCHAR;

    vIsDateTime BOOLEAN DEFAULT FALSE;

    cAllowedDatatypes CONSTANT VARCHAR[] := ARRAY

    [

        -- numeric

        'REAL',

        'DOUBLE PRECISION',

        'NUMERIC',

        'INTEGER',

        --datetime

        'INTERVAL',

        'TIMESTAMP WITHOUT TIME ZONE',

        'TIMESTAMP WITH TIME ZONE',

        -- char

        'CHARACTER',

        'CHARACTER VARYING',

        'TEXT'

    ];

    vIsDate BOOLEAN DEFAULT FALSE;

    vIsNumeric BOOLEAN DEFAULT FALSE;

    vIsChar BOOLEAN DEFAULT FALSE;

    verrorMessages CONSTANT VARCHAR[] := ARRAY

    [

        'ORA-01722: invalid number', --1

        'ORA-01821: date format not recognized', --2

        'ORA-01822: era format code is not valid with this calendar', --3

        'not implemented', --4

        'ORA-12702: invalid NLS parameter string used in SQL function', --5

        'ORA-01481: invalid number format model', --6

        'ORA-22835: Buffer too small for CLOB to CHAR', --7

        'ORA-00902: invalid datatype' --8

    ];

    v_lctime VARCHAR;

    vNlsParam VARCHAR;

    vNlsParamCopy VARCHAR;

    vDayMaxLengh INTEGER;

    vDyMaxLengh INTEGER;

    vMonthMaxLength INTEGER;

    vMonMaxLength INTEGER;

    --used to calculate localized day/month names

    cDayMonthNumbers CONSTANT INTEGER[] := ARRAY[1,2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];

    vTm VARCHAR;

    vtail VARCHAR;

    vfm VARCHAR;

    vIsDollarSign BOOLEAN DEFAULT FALSE;

    vGroupSeparator VARCHAR(2) DEFAULT NULL;

    vDecimalSeparator VARCHAR(2) DEFAULT NULL;

    vCurrencySymbol VARCHAR;

    vIsoCurrency VARCHAR;

    vDualCurrency VARCHAR;

BEGIN

    vDataType := UPPER(PG_TYPEOF(pVal)::VARCHAR);

    IF ARRAY_POSITION(cAllowedDatatypes,  vDataType) IS NULL THEN

        RAISE USING MESSAGE := verrorMessages[8];

    END IF;

    CASE

        WHEN vDataType IN

        (

            'INTERVAL',

            'TIMESTAMP WITHOUT TIME ZONE',

            'TIMESTAMP WITH TIME ZONE'

        ) THEN

            vIsDateTime := TRUE;

        WHEN vDataType IN

        (

            'REAL',

            'DOUBLE PRECISION',

            'NUMERIC',

            'INTEGER'

        ) THEN

            vIsNumeric := TRUE;

        ELSE

            vIsChar := TRUE; 

    END CASE;

    IF (vIsDateTime OR  (vIsNumeric AND pNoNumberFormat IS NULL)) AND (pFormat IS NULL OR pFormat = '') THEN

        IF vIsNumeric AND pFormat = '' THEN

            vResult := '#';

        

        ELSE

            vResult := NULL;

        END IF;

    ELSE

        CASE

            WHEN vIsDateTime AND vDataType <> 'INTERVAL' AND pFormat ~* '^FX$' THEN

                vResult := NULL;

            WHEN vIsDateTime THEN

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

                            RAISE USING MESSAGE := verrorMessages[5];

                        END IF;

                        -- store original language

                        v_lctime := CURRENT_SETTING('lc_time');

                        vNlsParam := REGEXP_REPLACE(vNlsParam, 'DATE_LANGUAGE=', '', 'i');

                        -- try to set NLS

                        BEGIN

                        

                            vTm := SET_CONFIG

                            (

                                'lc_time',

                                vNlsParam,

                                TRUE

                            );

                        EXCEPTION 

                            WHEN OTHERS THEN

                                RAISE USING MESSAGE := verrorMessages[5]; 

                        END;

                    END IF;

                END IF;

                -- exact set of dates is chosen to be sure about day names

                

                --calculate max day of week name length for language

                IF vDataType <> 'INTERVAL' THEN

                    SELECT MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0') , '102017'), 'ddmmyyyy'),'TMDAY'))),

                                MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '102017'), 'ddmmyyyy'),'TMDY')))

                    INTO vDayMaxLengh,

                        vDyMaxLengh

                    FROM UNNEST(cDayMonthNumbers) AS val

                    WHERE val BETWEEN 2 AND 8;

                    --calculate max month name length for language

                    SELECT MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'),'TMMONTH'))),

                        MAX(LENGTH(TO_CHAR(TO_DATE(CONCAT(LPAD(val::TEXT, 2, '0'), '2017'), 'mmyyyy'),'TMMON')))

                    INTO vMonthMaxLength,

                        vMonMaxLength

                    FROM UNNEST(cDayMonthNumbers) AS val;

                END IF;

                

                IF vDataType = 'TIMESTAMP WITHOUT TIME ZONE' AND

                

                    SUBSTRING(TO_CHAR(EXTRACT('epoch' FROM pVal), '9999999999D9999999'),12,6) = '.00000' THEN

                    vIsDate := TRUE;

                END IF;

        

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

                    IF vFmt !~ '"' THEN

                    

                        IF vDataType <> 'INTERVAL' THEN

    

                            FOR rec IN

                            (

                                SELECT fm.fmt

                                FROM ow_base_ext.format_models fm

                                WHERE fm.tp = 'datetime'

                                AND fm.grp = UPPER(SUBSTR(vFmt,1,1))

                                AND

                                (

                                    fm.fmt LIKE '%SP%' OR

                                    fm.fmt IN ('SYEAR', 'YEAR')

                                )

                            )

                            LOOP

                                

                                IF vFmt ~* CONCAT('^', rec.fmt, '$') THEN

                                    RAISE USING MESSAGE := verrorMessages[4];

                                

                                END IF;

                            END LOOP;

                            IF vFmt ~* '^E$' OR vFmt ~* '^EE$' THEN

                                RAISE USING MESSAGE := verrorMessages[3];

                            END IF;

                       

                        END IF;

                        IF vFmt ~* 'TZ[HM]' AND vDataType = 'TIMESTAMP WITHOUT TIME ZONE' THEN

                            FOR rec IN

                            (

                                SELECT fm.fmt

                                FROM ow_base_ext.format_models fm

                                WHERE fm.tp = 'datetime'

                                AND fm.grp = UPPER(SUBSTR(vFmt,1,1))

                                AND 

                                (

                                    fm.fmt LIKE 'TZH%' OR 

                                    fm.fmt LIKE 'TZM%'

                                )

                            )

                            LOOP

                                IF vFmt ~* CONCAT('^', rec.fmt) THEN

                                    RAISE USING MESSAGE := verrorMessages[2];

                                END IF;

                            END LOOP;

                        END IF;

                        IF vIsDate AND vFmt ~* 'FF|X|TZ[DHMR]' THEN

                            FOR rec IN

                            (

                                SELECT fm.fmt

                                FROM ow_base_ext.format_models fm

                                WHERE fm.tp = 'datetime'

                                AND fm.grp = UPPER(SUBSTR(vFmt,1,1))

                                AND 

                                (

                                    fm.fmt = 'X' OR

                                    fm.fmt LIKE 'FF%' OR

                                    fm.fmt LIKE 'TZ%'

                                )

                            )

                            LOOP

                                IF vFmt ~* CONCAT('^', rec.fmt) THEN

                                    RAISE USING MESSAGE := verrorMessages[2];

                                END IF;

                            END LOOP;

                        END IF; 

                        IF vDataType <> 'INTERVAL' THEN

                        

                            IF vDataType = 'TIMESTAMP WITHOUT TIME ZONE' THEN

                                vFmt := REGEXP_REPLACE(vFmt, 'tzr', '"+00:00"', 'ig');

                            END IF;

                            vFmt := REGEXP_REPLACE(vFmt, 'tzd', '', 'ig');

                            -- Unable to calculate TS correctly, will produce

                            -- Oracle behavior 9:01:01 AM

                            IF vFmt ~* 'TS' THEN

                            

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'ts',

                                    CONCAT

                                    (

                                        '"',

                                        TRIM(TO_CHAR(pVal, 'hh'),'0'),

                                        ':',

                                        TO_CHAR(pVal, 'mi'),

                                        ':',

                                        TO_CHAR(pVal, 'ss'),

                                        ' ',

                                        TO_CHAR(pVal, 'AM'),

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            -- X will be .

                            IF vFmt !~* 'FX' AND vFmt ~* '^x' THEN

                                vFmt := REGEXP_REPLACE(vFmt, 'x', '.', 'ig');

                            END IF;

                            -- Fix cases

                            vFmt := REPLACE(vFmt, 'A.d.', 'A.D.');

                            vFmt := REPLACE(vFmt, 'A.m.', 'A.M.');

                            vFmt := REPLACE(vFmt, 'B.c.', 'B.C.');

                            vFmt := REPLACE(vFmt, 'P.m.', 'P.M.');

                            FOR rec IN

                            (

                                SELECT

                                    ARRAY_TO_STRING

                                    (

                                        REGEXP_MATCHES(vFmt, 'Rm|Ad|Bc|Pm|Am', 'g'),

                                        ''

                                    ) case_match

                            ) LOOP

                                vFmt := REPLACE

                                (

                                    vFmt,

                                    rec.case_match,

                                    CONCAT

                                    (

                                        '"',

                                        INITCAP(TO_CHAR(pVal, UPPER(rec.case_match))),

                                        '"'

                                    )

                                );

                            END LOOP;

                            -- PG has SSSS, but Oracle SSSSS, so we need to convert SSSSS to SSSS

                            -- ssss to ss + ss

                            IF vFmt ~* '^FMS{2}$' OR vFmt ~* '^S{2}$' THEN

                                vFmt := CONCAT

                                (

                                    '"',

                                    TO_CHAR(pVal, 'ss'),

                                    '"'

                                );

                            END IF;

                            IF vFmt ~* '^FMS{5}$' OR vFmt ~* '^S{5}$' THEN

                                vFmt := CONCAT

                                (

                                    '"',

                                    TO_CHAR(pVal, REGEXP_REPLACE(vFmt, 's{5}', 'ssss', 'i')),

                                    '"'

                                );

                            END IF;

                            -- PG has ID, but Oracle use it as I + D, no ID

                            IF vFmt ~* '^i$' THEN

                                vFmt := 

                                    CONCAT

                                    (

                                        '"',

                                        TO_CHAR(pVal, 'I'),

                                        '"'

                                    );

                            

                            END IF;

                            /* PG unable to convert TH if contains lower case letters in model */

                            IF vFmt ~* 'TH' AND vFmt !~* 'MONTH' AND vFmt ~ '[[:lower:]]' THEN

                                vFmt := CONCAT

                                (

                                    '"',

                                    REGEXP_REPLACE(TO_CHAR(pVal, vFmt), '(\d+)(\D+)', '\1', 'i'),

                                    LOWER(REGEXP_REPLACE(TO_CHAR(pVal, UPPER(vFmt)), '(\d+)(\D+)', '\2', 'i')),

                                    '"'

                                );

                            

                            END IF;

                            -- hard to calculate correct DS format, will set to fmmm/fmdd/fmyyyy

                            IF vFmt ~* 'ds' THEN

                            

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'ds',

                                    CONCAT

                                    (

                                        '"',

                                        LTRIM(TO_CHAR(pVal, 'mm'), '0'),

                                        '/',

                                        LTRIM(TO_CHAR(pVal, 'dd'), '0'),

                                        '/',

                                        LTRIM(TO_CHAR(pVal, 'yyyy'), '0'), 

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            IF vFmt ~* 'SYYYY' THEN

                            

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'syyyy',

                                    CONCAT

                                    (

                                        '"',

                                        CASE

                                            WHEN TO_CHAR(pVal,'BC') = 'BC' THEN

                                                CONCAT('-', TO_CHAR(pVal, 'YYYY'))

                                            ELSE

                                                CONCAT(' ', TO_CHAR(pVal, 'YYYY'))

                                        END,

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            IF vFmt ~* 'CC' AND vFmt !~* 'SCC' THEN

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'cc',

                                    CONCAT

                                    (

                                        '"',

                                        CASE

                                            WHEN TO_CHAR(pVal,'BC') = 'BC' THEN

                                                REPLACE(TO_CHAR(pVal, 'CC'),'-','')

                                            ELSE

                                                TO_CHAR(pVal, 'CC')

                                        END,

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            IF vFmt ~* 'SCC' THEN

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'scc',

                                    CONCAT

                                    (

                                        '"',

                                        CASE

                                            WHEN TO_CHAR(pVal,'BC') = 'BC' THEN

                                                TO_CHAR(pVal, 'CC')

                                            ELSE

                                                CONCAT(' ', TO_CHAR(pVal, 'CC'))

                                        END,

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            IF vFmt ~* 'TZH' THEN

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'tzh',

                                    CONCAT

                                    (

                                        '"',

                                        SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\D'),

                                        LPAD

                                        (

                                            SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\d+'),

                                            2,

                                            '0'

                                        ),

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            IF vFmt ~* 'TZM' THEN

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'tzm',

                                    CONCAT

                                    (

                                        '"',

                                        SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\D'),

                                        LPAD

                                        (

                                            SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\d+'),

                                            2,

                                            '0'

                                        ),

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            IF vFmt ~* 'TZR' THEN

                                vFmt := REGEXP_REPLACE

                                (

                                    vFmt,

                                    'tzr',

                                    CONCAT

                                    (

                                        '"',

                                        SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\D'),

                                        LPAD

                                        (

                                            SUBSTRING(EXTRACT(TIMEZONE_HOUR FROM pVal)::TEXT FROM '\d+'),

                                            2,

                                            '0'

                                        ),

                                        ':',

                                        SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\D'),

                                        LPAD

                                        (

                                            SUBSTRING(EXTRACT(TIMEZONE_MINUTES FROM pVal)::TEXT FROM '\d+'),

                                            2,

                                            '0'

                                        ),

                                        '"'

                                    ),

                                    'ig'

                                );

                            END IF;

                            -- hard to calculate correct DL, set to hardcoded format

                            IF vFmt ~* '^DL' THEN

                                vFmt := 

                                    CONCAT

                                    (

                                        '"',

                                        TRIM(TO_CHAR(pVal, 'TMDay')),

                                        ', ',

                                        TRIM(TO_CHAR(pVal, 'TMMonth')),

                                        ' ',

                                        TO_CHAR(pVal, 'dd'),

                                        ', ',

                                        TO_CHAR(pVal, 'yyyy'),

                                        

                                        '"'

                                    );

                            END IF;

                            --FF[1..6]

                            IF vFmt ~* '^FF\d' THEN

                                vFmt := CONCAT('"', SUBSTR(TO_CHAR(pVal, 'US'), 1, SUBSTRING(vFmt FROM '\d')::INTEGER), '"');

                            END IF;

                            IF vFmt ~* '^tmMON$' THEN

                                vFmt := CONCAT

                                (

                                    '"',

                                    RPAD(TO_CHAR(pVal, vFmt), vMonMaxLength),

                                    '"'

                                );

                            END IF;

                            IF vFmt ~* '^tmMONTH$' THEN

                                vFmt := CONCAT

                                (

                                    '"',

                                    RPAD(TO_CHAR(pVal, vFmt), vMonthMaxLength),

                                    '"'

                                );

                            END IF;

                            IF vFmt ~* '^tmDAY$' THEN

                                vFmt := CONCAT

                                (

                                    '"',

                                    RPAD(TO_CHAR(pVal, vFmt), vDayMaxLengh),

                                    '"'

                                );

                            END IF;

                            IF vFmt ~* '^tmDY$' THEN

                                vFmt := CONCAT

                                (

                                    '"',

                                    RPAD(TO_CHAR(pVal, vFmt), vDyMaxLengh),

                                    '"'

                                );

                            END IF;

                        END IF;

                    END IF;

                    vResult := CONCAT(vResult, vFmt);

                    EXIT WHEN vtail IS NULL;

                END LOOP;

                -- restore language setting if they were changed

                IF CURRENT_SETTING('lc_time') <> v_lctime THEN

                    vTm := SET_CONFIG('lc_time', v_lctime, TRUE);

                END IF;

            WHEN vIsNumeric AND pNoNumberFormat IS NULL AND pNlsParam = '' THEN

                vResult := NULL;

            WHEN vIsNumeric THEN

                IF pNoNumberFormat IS NULL THEN

                    IF pNlsParam IS NOT NULL THEN

                        SELECT STRING_AGG(CASE WHEN nls ~* 'CALENDAR' THEN '' ELSE nls END, '')

                        INTO vNlsParamCopy

                        FROM REGEXP_SPLIT_TO_TABLE

                        ( 

                            pNlsParam,

                            'NLS_',

                        'i') nls;

                        -- check if paramters are allowed

                        IF pNlsParam ~ '^\s+$' THEN

                            RAISE USING MESSAGE := verrorMessages[5];

                        END IF;

                        

                        vNlsParam := REGEXP_REPLACE

                        (

                            vNlsParamCopy,

                            'NUMERIC_CHARACTERS\s*=\s*\''..\''',

                            '',

                            'i'

                        );

                        vNlsParam := REGEXP_REPLACE

                        (

                            vNlsParam,

                            'CURRENCY\s*=\s*\''.+\''',

                            '',

                            'i'

                        );

                        vNlsParam := REGEXP_REPLACE

                        (

                            vNlsParam,

                            'ISO_CURRENCY\s*=\s*\S+',

                            '',

                            'i'

                        );

                        IF LENGTH(TRIM(vNlsParam)) > 0 THEN

                            RAISE USING MESSAGE := verrorMessages[5];

                        END IF;

                        

                        -- Try to get set NLS parts

                        FOR rec IN 

                        (

                            SELECT ARRAY_TO_STRING

                            (

                                REGEXP_MATCHES

                                (

                                    vNlsParamCopy,

                                    'NUMERIC_CHARACTERS\s*=\s*\''..\''',

                                    'i'

                                ),''

                            ) m

                        ) LOOP

                            vDecimalSeparator := SUBSTR(REGEXP_REPLACE(SUBSTRING(rec.m FROM '=\s*\S.{3}'), '=\s*', ''), 2, 1);

                            

                            IF LENGTH(vDecimalSeparator) = 0 THEN

                                RAISE USING MESSAGE := verrorMessages[5];

                            END IF;

                            vGroupSeparator := SUBSTR(REGEXP_REPLACE(SUBSTRING(rec.m FROM '=\s*\S.{3}'), '=\s*', ''), 3, 1);

                            IF LENGTH(vGroupSeparator) = 0 THEN

                                RAISE USING MESSAGE := verrorMessages[5];

                            END IF;

                            PERFORM SET_CONFIG('NLS.NUMERIC_CHARACTERS', CONCAT(vDecimalSeparator, vGroupSeparator), TRUE);

                        END LOOP;

                        FOR rec IN 

                        (

                            SELECT ARRAY_TO_STRING

                            (

                                REGEXP_MATCHES

                                (

                                    vNlsParamCopy,

                                    'CURRENCY\s*=\s*\''.+\''',

                                    'i'

                                ),''

                            ) m

                        ) LOOP

                            vCurrencySymbol := REGEXP_REPLACE(SUBSTRING(rec.m FROM '=\s*\''.+\'''),'=\s*', '');

                            vCurrencySymbol := SUBSTR(vCurrencySymbol, 2, LENGTH(vCurrencySymbol)-2);

                            IF LENGTH(vCurrencySymbol) = 0 THEN

                                RAISE USING MESSAGE := verrorMessages[5];

                            END IF;

                            vCurrencySymbol := SET_CONFIG('NLS.CURRENCY', vCurrencySymbol, TRUE);

                        END LOOP;

                        FOR rec IN 

                        (

                            SELECT ARRAY_TO_STRING

                            (

                                REGEXP_MATCHES

                                (

                                    vNlsParamCopy,

                                    'ISO_CURRENCY\s*=\s*\S+',

                                    'i'

                                ),''

                            ) m

                        ) LOOP

                            vIsoCurrency := REGEXP_REPLACE(SUBSTRING(rec.m FROM '=\s*\S+'), '(=\s*)(\S+)', '\2');

                            IF LENGTH(vIsoCurrency) = 0 THEN

                                RAISE USING MESSAGE := verrorMessages[5];

                            END IF;

                            BEGIN

                                SELECT anp.params_dictionary ->> 'NLS_ISO_CURRENCY' AS NLS_ISO_CURRENCY,

                                    COALESCE(vCurrencySymbol, anp.params_dictionary ->> 'NLS_CURRENCY') AS NLS_CURRENCY,

                                    anp.params_dictionary ->> 'NLS_DUAL_CURRENCY' AS NLS_DUAL_CURRENCY

                                INTO vIsoCurrency,

                                    vCurrencySymbol,

                                    vDualCurrency

                                FROM ow_base_ext.nls_parameters anp

                                WHERE anp.nls_territory = UPPER(TRIM(vIsoCurrency));

                                IF NOT FOUND THEN

                                    RAISE USING MESSAGE := verrorMessages[5];

                                END IF;

                                vIsoCurrency := SET_CONFIG('NLS.ISO_CURRENCY', vIsoCurrency, TRUE);

                                vCurrencySymbol := SET_CONFIG('NLS.CURRENCY', vCurrencySymbol, TRUE);

                                vDualCurrency := SET_CONFIG('NLS.DUAL_CURRENCY', vDualCurrency, TRUE);

                            EXCEPTION

                                WHEN NO_DATA_FOUND THEN

                                  RAISE USING MESSAGE := verrorMessages[5];

                            END;

                        END LOOP;

                    END IF;

                    vtail:= pFormat;

                    LOOP

                        SELECT ok, tail, fm

                        INTO vFmt, vtail, vfm

                        FROM ow_base_ext.to_char_parser

                        (

                            pStr  => vtail,

                            pType => 'number',

                            pFm   => vfm

                        );

                        

                    

                        vResult := CONCAT(vResult, vFmt);

                        EXIT WHEN vtail IS NULL;

                    END LOOP;

                    /* Restrictions */

                    --A comma element cannot begin a number format model

                    IF SUBSTR(vResult, 1, 1) = ',' THEN

                        RAISE USING MESSAGE := verrorMessages[6];

                    END IF;

                    -- A comma cannot appear to the right of a decimal

                    -- character or period in a number format model

                    CASE 

                        WHEN vResult ~* '[\.D].*\,' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        --only one period in a number format model

                        WHEN vResult ~ '\..*\.' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- only one decimal character in a number format model

                        WHEN vResult ~* 'd.*d' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- group separator cannot appear to the right of a decimal 

                        -- character or period in a number format model

                        -- V also

                        WHEN vResult ~* '[\.DV].*g' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- Start with g is not allowed

                        WHEN vResult ~* '^G' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- It's not allowed to mix different type group and

                        -- decimal model symbols

                        WHEN vResult ~ '\.|\,' AND vResult ~* 'D|G' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- The MI format element can appear only in the last position 

                        -- of a number format model

                        WHEN vResult ~* 'MI.+' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        --The PR format element can appear only in the last position

                        -- of a number format model

                        WHEN vResult ~* 'PR.+' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- The S format element can appear only in the first 

                        -- or last position of a number format model

                        WHEN vResult ~* '[^S]+S[^S]+' OR vResult ~* 'S[^S]*S' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- You cannot precede this element with any other element

                        WHEN vResult ~* '.+TM' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- You can follow this element only with one 9 or 

                        -- one E (or e), but not with any combination of these

                        WHEN vResult ~* 'TM.{2,}' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        WHEN vResult ~* 'TM[^9e]' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- You can precede this element only with 0 (which returns leading zeroes)

                        -- or FM. Any other elements return an error

                        WHEN vResult ~* '.*X.?'

                            AND vResult !~* '^0+X{1,}$'

                            AND vResult !~* '^FMX{1,}$'

                            AND vResult !~* '^FM0{1,}X{1,}$'

                            AND vResult !~* '^X{1,}$' THEN

                                RAISE USING MESSAGE := verrorMessages[6];

                        -- only one $ allowed

                        WHEN vResult ~ '\$.*\$' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- only one C allowed

                        WHEN vResult ~* 'C.*C' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- only one L allowed

                        WHEN vResult ~* 'L.*L' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- only one U allowed

                        WHEN vResult ~* 'U.*U' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- C, L, $, U together is not allowed

                        WHEN vResult ~* 'C.*[\$LU]' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        WHEN vResult ~* '[UL\$].*C' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- only one V allowed

                        WHEN vResult ~* 'V.*V' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- V and period or decimal is not allowed

                        WHEN vResult ~* 'V.*[\.D]' OR vResult ~* '[\.D].*V' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- If RN - no other models allowed

                        WHEN vResult ~* '.+RN' OR vResult ~* 'RN.+' THEN

                            RAISE USING MESSAGE := verrorMessages[6];

                        -- Only EEEE is not allowed. No chars after EEEE. No comma before EEEE

                        WHEN vResult ~* '^EEEE$' 

                            OR vResult ~* 'EEEE[^S]+' 

                            OR vResult ~* '\,.*EEEE'

                            OR vResult ~* 'EEEE.{2,}' THEN

                                RAISE USING MESSAGE := verrorMessages[6];

                        ELSE

                            NULL;

                    END CASE;

                    /* Some Oracle actions repeated */

                    IF UPPER(vResult) = 'S' THEN

                        vResult := '#';

                    END IF;

                    FOR rec IN

                    (

                        SELECT np.nls_iso_currency,

                            np.nls_currency,

                            np.nls_dual_currency

                        FROM ow_base_ext.v$nls_parameters np

                    )

                    LOOP

                        IF vResult ~* 'U' THEN

                            vResult := REGEXP_REPLACE(vResult, 'U',  CONCAT('"', rec.nls_dual_currency, '"') , 'i');

                        END IF;

                        IF vResult ~* 'C' THEN

                            vResult := REGEXP_REPLACE(vResult, 'C',  CONCAT('"', rec.nls_iso_currency, '"') , 'i');

                        END IF;

                        IF vResult ~* 'L' THEN

                            vResult := REGEXP_REPLACE(vResult, 'L',  CONCAT('"', rec.nls_currency, '"') , 'i');

                        END IF;

                    END LOOP;

                    IF vResult ~ '\$' AND vResult !~ '"\$"' THEN

                        vResult := CONCAT('"$"', REPLACE(vResult, '$', ''));

                    END IF;

                    -- converting

                    CASE

                        WHEN vResult ~* 'X' AND vResult !~ '"' THEN

                            

                            vResult := CONCAT

                            (

                                CASE WHEN vResult ~* 'FM' THEN '' ELSE ' ' END,

                                TO_HEX(ROUND(pVal,0)::INTEGER)

                            );

                            

                        WHEN vResult ~* 'EEEE' THEN

                            vResult := 

                            CASE 

                                WHEN vResult ~* 'FM' THEN 

                                    LTRIM

                                    (

                                        REPLACE

                                        (

                                            REGEXP_REPLACE

                                            (

                                                TO_CHAR

                                                (

                                                    pVal,

                                                    REGEXP_REPLACE(vResult, 'FM', '', 'i')

                                                ),

                                                '00(\d)',

                                                '0\1'

                                            ),

                                            'e',

                                            'E'

                                        )

                                    )

                                ELSE

                                    CONCAT(' ', REPLACE(REGEXP_REPLACE(TO_CHAR(pVal, vResult), '00(\d)', '0\1'), 'e', 'E'))

                            END;

                        WHEN vResult ~* 'G|D' AND vDecimalSeparator IS NOT NULL AND vGroupSeparator IS NOT NULL THEN

                            vResult := REPLACE(REPLACE(TO_CHAR(pVal, REGEXP_REPLACE(vResult, 'FM', 'FM', 'i')), REPLACE(TO_CHAR(1.1, 'FM9D9'),'1',''), vDecimalSeparator), REPLACE(TO_CHAR(1111, 'FM9G999'),'1',''), vGroupSeparator);

                        

                        ELSE

                            vResult := TO_CHAR

                            (

                                pVal,

                                REGEXP_REPLACE(vResult, 'FM', 'FM', 'i')

                            );

                    END CASE;

                

                ELSE

                        vResult := REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(REGEXP_REPLACE(pVal::TEXT, '^0\.(\d+)', '.\1'), '\.0{2,}$', ''), '\.$', ''), '(.[^0])0+$', '\1');

                END IF;

                

            ELSE

                IF pFormat IS NOT NULL THEN

                    

                    RAISE USING MESSAGE := verrorMessages[1];

                END IF;

                

                IF LENGTH(pVal) > 4000 THEN

                    RAISE USING MESSAGE := verrorMessages[7];

                END IF;

                vResult := pVal::VARCHAR;

        END CASE;

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char_formatter(anyelement, character varying, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char_formatter(anyelement, character varying, character varying, character varying)
    IS 'Utility function making to_char results similar to expected on Oracle side';

    -- FUNCTION: ow_base_ext.to_char_parser(character varying, character varying, character varying)

-- DROP FUNCTION ow_base_ext.to_char_parser(character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION ow_base_ext.to_char_parser(
	pstr character varying,
	ptype character varying,
	pfm character varying DEFAULT NULL::character varying)
    RETURNS TABLE(ok character varying, tail character varying, fm character varying) 
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
    ROWS 1
AS $BODY$

DECLARE

    vRes VARCHAR;

    vStr VARCHAR;

    vPos INTEGER;

    vChunk VARCHAR;

    vGrp VARCHAR;

    vWrapTo VARCHAR;

    vYYYY VARCHAR;

    

    curDateFmtModels CURSOR (pGrp VARCHAR, pYYY VARCHAR) FOR

    SELECT fm.fmt,

        fm.wrapto

    FROM ow_base_ext.format_models fm

    WHERE tp = 'datetime'

    AND grp = pGrp

    AND (pYYY IS NULL OR (pYYY IS NOT NULL AND fm.fmt = pYYY))

    ORDER BY ord,

        fmt;

    eDateFormatNotRecognized CONSTANT VARCHAR := 'ORA-01821: date format not recognized';

    curNumberFmtModels CURSOR FOR

    SELECT fmt

    FROM ow_base_ext.format_models fm

    WHERE tp = 'number';

    eInvalidNumberFormat CONSTANT VARCHAR := 'ORA-01481: invalid number format model';

    vModel VARCHAR;

    vFM VARCHAR;

BEGIN

    vStr := pStr;

    vPos := 1;

    vFm := COALESCE(pFm,'');

    CASE

        

        WHEN pType = 'number' THEN

            

            OPEN curNumberFmtModels;

            

            LOOP

                            

                FETCH curNumberFmtModels INTO vModel;

                

                EXIT WHEN NOT FOUND;

                vChunk := SUBSTR(vStr,1,  LENGTH(REPLACE(vModel, '\', '')));

                IF UPPER(vChunk) <> REPLACE(vModel, '\', '') THEN

                    vChunk := NULL;

                END IF;

                            

                IF vChunk IS NOT NULL THEN

                    vRes := CONCAT(vRes, SUBSTR(vStr, 1, LENGTH(vChunk)));

                    vPos := vPos + LENGTH(vChunk);

                    vStr := SUBSTR(vStr, vPos);

                    EXIT;

                END IF;

            END LOOP;

            CLOSE curNumberFmtModels;

            IF vChunk IS NULL THEN

                            

                RAISE USING MESSAGE := eInvalidNumberFormat;

            END IF;

        ELSE

            LOOP

            

                    -- special treat for FM/FX

                    IF UPPER(SUBSTR(vStr,1,2)) = 'FM' THEN

                        vFM := CASE WHEN vFM <> 'FM' THEN 'FM' ELSE '' END;

                        vStr := SUBSTR(vStr,3);

                    

                    END IF;

                    --If quotted - grab it

                    IF SUBSTR(vStr,1,1) = '"' THEN

                        vChunk := SUBSTRING(vStr FROM '"[^"]*"');

                        -- if unclosed quota - raise

                        IF vChunk IS NULL THEN

                            RAISE USING MESSAGE := eDateFormatNotRecognized;

                        END IF;

                        vRes := CONCAT(vFm, vRes, vChunk);

                        vPos := vPos + LENGTH(vChunk);

                        vStr := SUBSTR(vStr, vPos);

                        EXIT;

                    END IF;

                    -- spacers grab it

                    -- we will treat , and . specialy because of A.M. likes or Y,YYYY

                    IF SUBSTR(vStr,1,1) ~ '^[\.\,]' THEN

                        vChunk := SUBSTRING(vStr FROM '[\.\,]+');

                        vRes := CONCAT(vFM, vRes, vChunk);

                        vPos := vPos + LENGTH(vChunk);

                        vStr := SUBSTR(vStr, vPos);

                        EXIT;

                    END IF;

                    IF SUBSTR(vStr,1,1) ~ '[\s\!\\\/\#\$\%\&\''\(\)\*\+\\\-\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~]' THEN

                        

                        vChunk := SUBSTRING(vStr FROM '[\s\!\\\/\#\$\%\&\''\(\)\*\+\\\-\:\;\<\=\>\?\@\[\]\^\_\`\{\|\}\~]+');

                        vRes := CONCAT(vFM, vRes, vChunk);

                        vPos := vPos + LENGTH(vChunk);

                        vStr := SUBSTR(vStr, vPos);

                        EXIT;

                    END IF;

                    vGrp := UPPER(SUBSTR(vStr,1,1));

                    

                    IF vGrp = 'Y' THEN

      

                        CASE

                            WHEN UPPER(SUBSTR(vStr,1,9)) IN ('Y,YYYTHSP', 'Y,YYYSPTH') THEN

                                vYYYY := REPLACE(UPPER(SUBSTR(vStr,1,9)),',','\,');

                            WHEN UPPER(SUBSTR(vStr,1,7)) IN ('Y,YYYTH', 'Y,YYYSP') THEN

                                vYYYY := REPLACE(UPPER(SUBSTR(vStr,1,7)),',','\,');

                            WHEN UPPER(SUBSTR(vStr,1,5)) = 'Y,YYY' THEN

                                vYYYY := REPLACE(UPPER(SUBSTR(vStr,1,5)),',','\,');

                            ELSE

                                vYYYY := NULL;

                        END CASE;

                    END IF;

                    OPEN curDateFmtModels(CASE WHEN vGrp = 'E' THEN 'Y' ELSE vGrp END, vYYYY);

                    LOOP

                        

                        FETCH curDateFmtModels INTO vModel, vWrapTo;

                        

                        EXIT WHEN NOT FOUND;

        

                        vChunk := SUBSTR(vStr,1,  LENGTH(REPLACE(vModel, '\', '')));

                        IF UPPER(vChunk) <> REPLACE(vModel, '\', '') THEN

                            vChunk := NULL;

                        END IF;

                        

                        IF vChunk IS NOT NULL THEN

                            vRes := CONCAT

                            (

                                vFM,

                                vRes,

                                CASE 

                                    WHEN vWrapTo IS NOT NULL THEN

                                        CASE 

                                            WHEN  vWrapTo = 'R->Y' THEN

                                                REPLACE(REPLACE(vChunk, 'R', 'Y'), 'r', 'y')

                                            ELSE

                                                REGEXP_REPLACE(SUBSTR(vStr, 1, LENGTH(vChunk)), CONCAT('(',SUBSTR(vStr, 1, LENGTH(vChunk)),')'), vWrapTo)

                                        END

                                    ELSE 

                                        SUBSTR(vStr, 1, LENGTH(vChunk)) 

                                END

                            );

                            vPos := vPos + LENGTH(vChunk);

                            vStr := SUBSTR(vStr, vPos);

                            EXIT;

                        END IF;

                    END LOOP;

                    CLOSE curDateFmtModels;

                    IF vChunk IS NULL THEN

                        

                        RAISE USING MESSAGE := eDateFormatNotRecognized;

                    END IF;

                    EXIT;

                END LOOP;

        END CASE;

    RETURN QUERY VALUES (vRes, CASE WHEN LENGTH(vStr) = 0 THEN NULL::VARCHAR ELSE vStr END, vFM);

        

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_char_parser(character varying, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_char_parser(character varying, character varying, character varying)
    IS 'Parse to_char format parameter value to check it against Oracle rules';
    
    -- FUNCTION: ow_base_ext.to_date(character varying)

-- DROP FUNCTION ow_base_ext.to_date(character varying);

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

    

