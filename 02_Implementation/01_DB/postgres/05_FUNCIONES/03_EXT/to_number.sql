-- FUNCTION: ow_base_ext.to_number(character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_number(
	pval character varying)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult NUMERIC DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL AND pVal <> '' THEN

        vResult := ow_base_ext.to_number_formatter

        (

            pVal => pVal,

            pNoNumberFormat => 'Y'

        );

    END IF;

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_number(character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_number(character varying)
    IS 'Converts VARCHAR to NUMBER when no additional params set';
    
    -- FUNCTION: ow_base_ext.to_number(character varying, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_number(
	pval character varying,
	pformat character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult NUMERIC DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL AND pVal <> '' THEN

        vResult := ow_base_ext.to_number_formatter

        (

            pVal      => pVal,

            pFormat   => pFormat,

            pNlsParam => pNlsParam

        );

    END IF;

    

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_number(character varying, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_number(character varying, character varying, character varying)
    IS 'Converts VARCHAR to NUMBER. Some format models could return incorrect result. NLS params must be valid.';

    -- FUNCTION: ow_base_ext.to_number(double precision)

CREATE OR REPLACE FUNCTION ow_base_ext.to_number(
	pval double precision)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    RETURN ow_base_ext.number_limit_correct(pVal::NUMERIC);

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_number(double precision)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_number(double precision)
    IS 'Converts BINARY_DOUBLE to NUMBER, no additional params allowed';

    -- FUNCTION: ow_base_ext.to_number(numeric)

CREATE OR REPLACE FUNCTION ow_base_ext.to_number(
	pval numeric)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    RETURN ow_base_ext.number_limit_correct(pVal);

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_number(numeric)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_number(numeric)
    IS 'Converts NUMBER to NUMBER when no additional params set';

    -- FUNCTION: ow_base_ext.to_number(numeric, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_number(
	pval numeric,
	pformat character varying,
	pnlsparam character varying DEFAULT NULL::character varying)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    vResult NUMERIC DEFAULT NULL;

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    IF pVal IS NOT NULL THEN

        vResult := ow_base_ext.to_number_formatter

        (

            pVal      => pVal,

            pFormat   => pFormat,

            pNlsParam => pNlsParam

        );

    END IF;

    

    RETURN vResult;

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_number(numeric, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_number(numeric, character varying, character varying)
    IS 'Converts NUMBER to NUMBER when additional params are set. Some format models could return incorrect result. NLS params must be valid.';

    -- FUNCTION: ow_base_ext.to_number(real)

CREATE OR REPLACE FUNCTION ow_base_ext.to_number(
	pval real)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

BEGIN

    PERFORM ow_base_ext.nls_parameters_init();

    RETURN ow_base_ext.number_limit_correct(pVal::NUMERIC);

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_number(real)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_number(real)
    IS 'Converts BINARY_FLOAT to NUMBER, no additional params allowed';

    -- FUNCTION: ow_base_ext.to_number_formatter(anyelement, character varying, character varying, character varying)

CREATE OR REPLACE FUNCTION ow_base_ext.to_number_formatter(
	pval anyelement,
	pformat character varying DEFAULT NULL::character varying,
	pnlsparam character varying DEFAULT NULL::character varying,
	pnonumberformat character varying DEFAULT NULL::character varying)
    RETURNS numeric
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    rec RECORD;

    cAllowedDatatypes CONSTANT VARCHAR[] := ARRAY

    [

        'NUMERIC',

        'INTEGER',

        'CHARACTER',

        'CHARACTER VARYING',

        'TEXT'

    ];

    vResult NUMERIC DEFAULT NULL;

    vDataType VARCHAR;

    verrorMessages CONSTANT VARCHAR[] := ARRAY

    [

        'ORA-00902: invalid datatype', --1

        'ORA-22835: Buffer too small for CLOB to CHAR', --2

        'ORA-01481: invalid number format model', --3

        'ORA-12702: invalid NLS parameter string used in SQL function', --4

        'ORA-01722: invalid number', --5

        'ORA-01481: invalid number format model' --6

    ];

    vNlsParam VARCHAR;

    vNlsParamCopy VARCHAR;

    vGroupSeparator VARCHAR(2) DEFAULT NULL;

    vDecimalSeparator VARCHAR(2) DEFAULT NULL;

    vCurrencySymbol VARCHAR;

    vIsoCurrency VARCHAR;

    vDualCurrency VARCHAR;

    vVal VARCHAR;

    vFmt VARCHAR;

    vtail VARCHAR;

    vfm VARCHAR;

    vTextResult VARCHAR;

BEGIN

    vDataType := UPPER(PG_TYPEOF(pVal)::VARCHAR);

    IF ARRAY_POSITION(cAllowedDatatypes,  vDataType) IS NULL THEN

        RAISE USING MESSAGE := verrorMessages[1];

    END IF;

    vVal := pVal::TEXT;

    IF LENGTH(vVal) > 4000 THEN

        RAISE USING MESSAGE := verrorMessages[2];

    END IF;

    IF pNoNumberFormat IS NOT NULL THEN

        

        vResult := pVal::NUMERIC;

    ELSE

        CASE

            WHEN pNlsParam = '' THEN

                vResult := NULL;

            WHEN pNlsParam IS NOT NULL THEN

                SELECT STRING_AGG(CASE WHEN nls ~* 'CALENDAR' THEN '' ELSE nls END, '')

                INTO vNlsParamCopy

                FROM REGEXP_SPLIT_TO_TABLE

                ( 

                    pNlsParam,

                    'NLS_',

                'i') nls;

                

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

                    RAISE USING MESSAGE := verrorMessages[4];

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

                        RAISE USING MESSAGE := verrorMessages[4];

                    END IF;

                    vGroupSeparator := SUBSTR(REGEXP_REPLACE(SUBSTRING(rec.m FROM '=\s*\S.{3}'), '=\s*', ''), 3, 1);

                    IF LENGTH(vGroupSeparator) = 0 THEN

                        RAISE USING MESSAGE := verrorMessages[4];

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

                        RAISE USING MESSAGE := verrorMessages[4];

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

                        RAISE USING MESSAGE := verrorMessages[4];

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

                            RAISE USING MESSAGE := verrorMessages[4];

                        END IF;

                        vIsoCurrency := SET_CONFIG('NLS.ISO_CURRENCY', vIsoCurrency, TRUE);

                        vCurrencySymbol := SET_CONFIG('NLS.CURRENCY', vCurrencySymbol, TRUE);

                        vDualCurrency := SET_CONFIG('NLS.DUAL_CURRENCY', vDualCurrency, TRUE);

                    EXCEPTION

                        WHEN NO_DATA_FOUND THEN

                            RAISE USING MESSAGE := verrorMessages[4];

                    END;

                END LOOP;

                

            ELSE

                NULL;       

        END CASE;

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

            

        

            vTextResult := CONCAT(vTextResult, vFmt);

            EXIT WHEN vtail IS NULL;

        END LOOP;

        /* Restrictions */

            --A comma element cannot begin a number format model

        IF SUBSTR(vTextResult, 1, 1) = ',' THEN

            RAISE USING MESSAGE := verrorMessages[6];

        END IF;

        -- A comma cannot appear to the right of a decimal

        -- character or period in a number format model

        CASE 

            WHEN vTextResult ~* '[\.D].*\,' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            --only one period in a number format model

            WHEN vTextResult ~ '\..*\.' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- only one decimal character in a number format model

            WHEN vTextResult ~* 'd.*d' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- group separator cannot appear to the right of a decimal 

            -- character or period in a number format model

            -- V also

            WHEN vTextResult ~* '[\.DV].*g' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- Start with g is not allowed

            WHEN vTextResult ~* '^G' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- It's not allowed to mix different type group and

            -- decimal model symbols

            WHEN vTextResult ~ '\.|\,' AND vTextResult ~* 'D|G' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- The MI format element can appear only in the last position 

            -- of a number format model

            WHEN vTextResult ~* 'MI.+' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            --The PR format element can appear only in the last position

            -- of a number format model

            WHEN vTextResult ~* 'PR.+' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- The S format element can appear only in the first 

            -- or last position of a number format model

            WHEN vTextResult ~* '[^S]+S[^S]+' OR vTextResult ~* 'S[^S]*S' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- You cannot precede this element with any other element

            WHEN vTextResult ~* '.+TM' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- You can follow this element only with one 9 or 

            -- one E (or e), but not with any combination of these

            WHEN vTextResult ~* 'TM.{2,}' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            WHEN vTextResult ~* 'TM[^9e]' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- You can precede this element only with 0 (which returns leading zeroes)

            -- or FM. Any other elements return an error

            WHEN vTextResult ~* '.*X.?'

                AND vTextResult !~* '^0+X{1,}$'

                AND vTextResult !~* '^FMX{1,}$'

                AND vTextResult !~* '^FM0{1,}X{1,}$'

                AND vTextResult !~* '^X{1,}$' THEN

                    RAISE USING MESSAGE := verrorMessages[6];

            -- only one $ allowed

            WHEN vTextResult ~ '\$.*\$' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- only one C allowed

            WHEN vTextResult ~* 'C.*C' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- only one L allowed

            WHEN vTextResult ~* 'L.*L' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- only one U allowed

            WHEN vTextResult ~* 'U.*U' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- C, L, $, U together is not allowed

            WHEN vTextResult ~* 'C.*[\$LU]' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            WHEN vTextResult ~* '[UL\$].*C' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- only one V allowed

            WHEN vTextResult ~* 'V.*V' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- V and period or decimal is not allowed

            WHEN vTextResult ~* 'V.*[\.D]' OR vTextResult ~* '[\.D].*V' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- If RN - no other models allowed

            WHEN vTextResult ~* '.+RN' OR vTextResult ~* 'RN.+' THEN

                RAISE USING MESSAGE := verrorMessages[6];

            -- Only EEEE is not allowed. No chars after EEEE. No comma before EEEE

            WHEN vTextResult ~* '^EEEE$' 

                OR vTextResult ~* 'EEEE[^S]+' 

                OR vTextResult ~* '\,.*EEEE'

                OR vTextResult ~* 'EEEE.{2,}' THEN

                    RAISE USING MESSAGE := verrorMessages[6];

            ELSE

                NULL;

        END CASE;

        

        -- converting

        IF vTextResult ~* 'U|C|L' THEN

            FOR rec IN

            (

                SELECT np.nls_iso_currency,

                    np.nls_currency,

                    np.nls_dual_currency

                FROM ow_base_ext.v$nls_parameters np

            )

            LOOP

                IF vTextResult ~* 'U' THEN

                    vVal := REGEXP_REPLACE(vVal, rec.nls_dual_currency, '$', 'i');

                    vTextResult := REGEXP_REPLACE(vTextResult, 'U', '$', 'i');

                END IF;

                IF vTextResult ~* 'C' THEN

                    vVal := REGEXP_REPLACE(vVal, rec.nls_iso_currency, '$' , 'i');

                    vTextResult := REGEXP_REPLACE(vTextResult, 'C', '$', 'i');

                END IF;

                IF vTextResult ~* 'L' THEN

                    vVal := REGEXP_REPLACE(vVal, rec.nls_currency, '$' , 'i');

                    vTextResult := REGEXP_REPLACE(vTextResult, 'L', '$', 'i');

                END IF;

            END LOOP;

        END IF;

        IF vTextResult ~* 'G|D' AND vDecimalSeparator IS NOT NULL AND vGroupSeparator IS NOT NULL THEN

            vVal := REGEXP_REPLACE(vVal, vDecimalSeparator, '.', 'i');

            vVal := REGEXP_REPLACE(vVal, vGroupSeparator, ',', 'ig');

            vTextResult := REGEXP_REPLACE(vTextResult, 'D', '.', 'i');

            vTextResult := REGEXP_REPLACE(vTextResult, 'G', ',', 'ig');

        END IF;

        

        CASE

            WHEN vTextResult ~* 'X' THEN

                EXECUTE 'SELECT x''' || vVal || '''::BIGINT::NUMERIC' INTO vResult;

            WHEN vTextResult ~* 'EEEE' THEN

                vResult := vVal::NUMERIC;

            ELSE

                vResult := TO_NUMBER(vVal, vTextResult);

        END CASE;

    END IF;

    RETURN ow_base_ext.number_limit_correct(vResult);

END;

$BODY$;

ALTER FUNCTION ow_base_ext.to_number_formatter(anyelement, character varying, character varying, character varying)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext.to_number_formatter(anyelement, character varying, character varying, character varying)
    IS 'Utility function making to_number results similar to expected on Oracle side';

