-- FUNCTION: ow_base_us."ge_qcrta$consultar_crta"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qcrta$consultar_crta"(
	p_prcs text,
	p_crta text,
	OUT p_crta_http_code double precision,
	OUT p_crta_descri text,
	OUT p_cod_rpta text,
	OUT p_cod_rpta_descri text)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    c_crta CURSOR FOR

    SELECT

        crta_prcs, crta_crta, crta_http_code, crta_descri

        FROM ow_base_us.ge_tcrta

        WHERE crta_crta = p_crta AND crta_prcs = p_prcs;

    r_crta record;

/* ---------------------------------------------- */

/* Validacion de campos de entrada */

/* ---------------------------------------------- */

BEGIN

    IF (p_prcs IS NULL) THEN

        p_cod_rpta := 'ER_PRCS_NU';

        p_cod_rpta_descri := 'Proceso de integracion no puede ser nulo';

        RETURN;

    END IF;

    IF (p_crta IS NULL) THEN

        p_cod_rpta := 'ER_CRTA_NU';

        p_cod_rpta_descri := 'Codifo de respuesta no puede ser nulo';

        RETURN;

    END IF

    /* ---------------------------------------------- */

    /* Consulta de codigo de respuesta */

    /* ---------------------------------------------- */;

    r_crta.crta_crta := NULL;

    OPEN c_crta;

    FETCH c_crta INTO r_crta;

    CLOSE c_crta;

    IF (r_crta.crta_crta IS NOT NULL) THEN

        p_cod_rpta := 'OK';

        p_cod_rpta_descri := 'Consulta exitosa';

        p_crta_http_code := r_crta.crta_http_code;

        p_crta_descri := r_crta.crta_descri;

    ELSE

        p_cod_rpta := 'ER_CRTA_NE';

        p_cod_rpta_descri := 'Codigo de repuesta no existe para el proceso especificado';

        p_crta_http_code := NULL;

        p_crta_descri := NULL;

    END IF;

    EXCEPTION

        WHEN others THEN

            p_crta_http_code := NULL;

            p_crta_descri := NULL;

            p_cod_rpta := 'ER_CRTA_NC';

            p_cod_rpta_descri := CONCAT_WS('', 'Error no controlado consultando codigo crta. ', SQLERRM);

END;

$BODY$;

ALTER FUNCTION ow_base_us."ge_qcrta$consultar_crta"(text, text)
    OWNER TO ow_base_us;
