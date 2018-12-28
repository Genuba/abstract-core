-- FUNCTION: ow_base_us."aut_qusuarios$asignarrolporusuario"(text, text, text)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qusuarios$asignarrolporusuario"(
	p_prcs text,
	p_usuario text,
	p_rol text,
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

    c_existerolporusuario CURSOR FOR

    SELECT

        'S'

        FROM ow_base_us.aut_turol

        WHERE urol_usuario = p_usuario AND urol_rol = p_rol

    /* */;

    v_existeRolPorusuario CHARACTER VARYING(2);

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_crta_http_gral CHARACTER VARYING(3) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    OPEN c_existerolporusuario;

    FETCH c_existerolporusuario INTO v_existeRolPorusuario;

    CLOSE c_existerolporusuario;

    IF (COALESCE(v_existeRolPorusuario, 'X') = 'X')

    /* */

    THEN

        INSERT INTO ow_base_us.aut_turol (urol_usuario, urol_rol)

        VALUES (p_usuario, p_rol);

    /* */

    /* */

    ELSE

        p_cod_rta := 'ERROR';

        to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

        tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

        SELECT

            *

            FROM ow_base_us.api_ge_qutils$generartypemensajerpta('ERR_ROL_USUA_DUPL'::TEXT, p_prcs, v_mensaje)

            INTO v_mensaje;

        p_mensajes := v_mensaje;

        RETURN;

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

ALTER FUNCTION ow_base_us."aut_qusuarios$asignarrolporusuario"(text, text, text)
    OWNER TO ow_base_us;
