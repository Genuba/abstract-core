-- FUNCTION: ow_base_ext."dbms_random$string"(text, double precision)

CREATE OR REPLACE FUNCTION ow_base_ext."dbms_random$string"(
	p_opt text,
	p_len double precision)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE STRICT 
AS $BODY$

DECLARE

    v_srcdata VARCHAR;

BEGIN

    v_srcdata := 

        CASE upper(p_opt)

           WHEN 'L' THEN 'abcdefghijklmnopqrstuvwxyz'

           WHEN 'A' THEN 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

           WHEN 'X' THEN '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'

           WHEN 'P' THEN '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ:;,{}()[].*/\|?!@$&#-=_+<>"''`#%^~ '

           ELSE 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'

        END;

    RETURN array_to_string(

        ARRAY(SELECT substring(v_srcdata from (ceil(random() * length(v_srcdata)))::INTEGER for 1)

                FROM generate_series(1, p_len::INTEGER)),

        '');

END;

$BODY$;

ALTER FUNCTION ow_base_ext."dbms_random$string"(text, double precision)
    OWNER TO ow_base_us;

COMMENT ON FUNCTION ow_base_ext."dbms_random$string"(text, double precision)
    IS 'This function generates and returns a random string.';
