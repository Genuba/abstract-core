-- FUNCTION: ow_base_us."api_ge_qutils$crearlogtransaccion"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$crearlogtransaccion"(
	p_proceso text,
	p_valor text)
    RETURNS void
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    /*

    [5571 - Severity CRITICAL - Unable to convert %s pragma. Check converted code for perfomance issues and rewrite it manually, if necessary.]

    PRAGMA AUTONOMOUS_TRANSACTION

    */

    error_transaction$returned_sqlstate TEXT;

    error_transaction$message_text TEXT;

      error_transaction$pg_exception_context TEXT;

/* */

BEGIN

    INSERT INTO ow_base_us.ge_tlogt (logt_logt, logt_proceso, logt_valor, logt_fecha)

    VALUES (nextval('ow_base_us.ge_slogt'), p_proceso, p_valor, CURRENT_TIMESTAMP);

    EXCEPTION

        WHEN OTHERS THEN

            GET STACKED DIAGNOSTICS error_transaction$returned_sqlstate = RETURNED_SQLSTATE,

                error_transaction$message_text = MESSAGE_TEXT,

                  error_transaction$pg_exception_context = PG_EXCEPTION_CONTEXT;

            RAISE NOTICE '% % %', error_transaction$returned_sqlstate, error_transaction$message_text || chr(10),   error_transaction$pg_exception_context;

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$crearlogtransaccion"(text, text)
    OWNER TO ow_base_us;
