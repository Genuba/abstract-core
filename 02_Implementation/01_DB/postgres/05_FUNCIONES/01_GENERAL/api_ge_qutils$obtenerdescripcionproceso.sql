-- FUNCTION: ow_base_us."api_ge_qutils$obtenerdescripcionproceso"(text)

CREATE OR REPLACE FUNCTION ow_base_us."api_ge_qutils$obtenerdescripcionproceso"(
	p_proceso text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    c_descripcion CURSOR FOR

    SELECT

        prcs_descri

        FROM ow_base_us.ge_tprcs

        WHERE prcs_prcs = p_proceso

    /* */;

    v_descripcion OW_BASE_US.GE_TPRCS.PRCS_DESCRI%TYPE;

/* */

/* */

BEGIN

    OPEN c_descripcion;

    FETCH c_descripcion INTO v_descripcion;

    CLOSE c_descripcion;

    RETURN COALESCE(v_descripcion, ' ');

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."api_ge_qutils$obtenerdescripcionproceso"(text)
    OWNER TO ow_base_us;
