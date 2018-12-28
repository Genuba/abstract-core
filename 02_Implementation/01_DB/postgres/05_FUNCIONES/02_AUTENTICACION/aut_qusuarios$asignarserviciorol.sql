-- FUNCTION: ow_base_us."aut_qusuarios$asignarserviciorol"(text, text, double precision)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$asignarserviciorol"(
	p_prcs text,
	p_rol_rol text,
	p_servicio double precision,
	OUT p_cod_rta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	OUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_crta_http_gral CHARACTER VARYING(3) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje

    /* */;

    c_existe_serv_pag_ppal CURSOR FOR

    SELECT

        'S'

        FROM ow_base_us.aut_tsrol

        WHERE srol_rol = p_rol_rol AND srol_servicio = 1;

    v_existe CHARACTER VARYING(1)

    /* */;

    c_existe_serv_pag_bvenida CURSOR FOR

    SELECT

        'S'

        FROM ow_base_us.aut_tsrol

        WHERE srol_rol = p_rol_rol AND srol_servicio = 50

    /* */;

    c_existe_servicios_rest CURSOR FOR

    SELECT

        'S'

        FROM ow_base_us.aut_tsrol

        WHERE srol_rol = p_rol_rol AND srol_servicio = 99;

/* */

/* */

BEGIN

    INSERT INTO ow_base_us.aut_tsrol (srol_servicio, srol_rol, srol_visible)

    VALUES (p_servicio, p_rol_rol, 'S')

    /* */;

    OPEN c_existe_serv_pag_ppal;

    FETCH c_existe_serv_pag_ppal INTO v_existe;

    CLOSE c_existe_serv_pag_ppal

    /* */;

    IF (v_existe IS NULL) THEN

        INSERT INTO ow_base_us.aut_tsrol (srol_servicio, srol_rol, srol_visible)

        VALUES (1, p_rol_rol, 'S');

    END IF

    /* */;

    OPEN c_existe_serv_pag_bvenida;

    FETCH c_existe_serv_pag_bvenida INTO v_existe;

    CLOSE c_existe_serv_pag_bvenida

    /* */;

    IF (v_existe IS NULL) THEN

        INSERT INTO ow_base_us.aut_tsrol (srol_servicio, srol_rol, srol_visible)

        VALUES (50, p_rol_rol, 'S');

    END IF

    /* */;

    OPEN c_existe_servicios_rest;

    FETCH c_existe_servicios_rest INTO v_existe;

    CLOSE c_existe_servicios_rest

    /* */;

    IF (v_existe IS NULL)

    /* */

    THEN

        INSERT INTO ow_base_us.aut_tsrol (srol_servicio, srol_rol, srol_visible)

        VALUES (99, p_rol_rol, 'S');

    /* */

    END IF

    /* */;

    p_cod_rta := COALESCE(v_crta_http_gral, 'OK');

    to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

    tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

    p_errores := tt_ge_erro;

    SELECT

        *

        FROM ow_base_us.api_ge_qutils$generartypemensajerpta('COD_EXITOSO'::TEXT, p_prcs, v_mensaje)

        INTO v_mensaje;

    p_mensajes := v_mensaje

    /* */;

    EXCEPTION

        WHEN others THEN

            p_cod_rta := 'ERROR';

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

            tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

            p_errores := tt_ge_erro;

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta('ERR_WHEN_OTHERS'::TEXT, p_prcs, v_mensaje)

                INTO v_mensaje;

            p_mensajes := v_mensaje;

    /* */

END;

$BODY$;

ALTER FUNCTION ow_base_us."aut_qusuarios$asignarserviciorol"(text, text, double precision)
    OWNER TO ow_base_us;
