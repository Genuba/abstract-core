-- FUNCTION: ow_base_us."api_ge_qutils$obtener_errores_log"(double precision)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$obtener_errores_log"(
	p_lgtr double precision,
	OUT p_errores ow_base_us.type_tt_ge_erro)
    RETURNS ow_base_us.type_tt_ge_erro
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    errores_object ow_base_us.type_to_ge_erro;

/*

open p_errores for

select   crta_crta, crta_http_code, substr(crta_descri || ' ' || dlgtr_observ, 1, 4000)

    from GE_TDLGTR, ge_tcrta

    where dlgtr_lgtr = p_lgtr

    and dlgtr_prcs = crta_prcs

    and dlgtr_crta = crta_crta;

*/

BEGIN

    NULL;

    EXCEPTION

        WHEN others THEN

            NULL;

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$obtener_errores_log"(double precision)
    OWNER TO ow_base_us;
