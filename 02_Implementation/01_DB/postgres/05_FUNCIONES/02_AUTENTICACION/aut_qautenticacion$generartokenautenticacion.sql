-- FUNCTION: ow_base_us."aut_qautenticacion$generartokenautenticacion"(text, text, ow_base_us.type_tt_ge_mnsje)

CREATE OR REPLACE FUNCTION ow_base_us."aut_qautenticacion$generartokenautenticacion"(
	p_prcs text,
	p_usuario text,
	OUT p_aut_ttoken ow_base_us.type_tt_au_token,
	OUT p_cod_rta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	INOUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

DECLARE

    c_consulta CURSOR FOR

    SELECT

        *

        FROM ow_base_us.aut_ttoken

        WHERE token_usuario = p_usuario AND token_estado = 'ACT';

    to_type_to_aut_ttoken ow_base_us.type_to_au_token;

    tt_type_tt_aut_ttoken ow_base_us.type_tt_au_token;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro;

    v_crta_gral OW_BASE_US.GE_TCRTA.crta_crta%TYPE := 'OK';

    v_cod_mensaje OW_BASE_US.GE_TCRTA.crta_crta%TYPE;

    v_token_validez DOUBLE PRECISION;

    v_token_afil CHARACTER VARYING(256);

    v_token_long DOUBLE PRECISION;

    v_token_alfa CHARACTER VARYING(10);

    v_cant_token_val DOUBLE PRECISION;

/* SE LIMPIAN LOS TOKENS ANTIGUOS */

BEGIN

    DELETE FROM ow_base_us.aut_ttoken

        WHERE token_usuario = p_usuario

    /*

    [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

    COMMIT

    */

    /* SE SELECCIONA EN VALOR DE LA DURACION EN MINUTOS */;

    SELECT

        COUNT(config_valor)

        INTO STRICT v_cant_token_val

        FROM ow_base_us.ge_tconfig

        WHERE config_config = 'Usuario.Token.duracion';

    IF (v_cant_token_val > 0) THEN

        SELECT

            ow_base_ext.to_number(config_valor)

            INTO STRICT v_token_validez

            FROM ow_base_us.ge_tconfig

            WHERE config_config = 'Usuario.Token.duracion';

    ELSE

        v_token_validez := 15;

    END IF

    /* SE SELECCIONA EL VALOR DE LA LONGITUD DEL TOKEN */;

    SELECT

        config_valor

        INTO STRICT v_token_long

        FROM ow_base_us.ge_tconfig

        WHERE config_config = 'Usuario.Token.longitud'

    /* SE SELECCIONA SI ES ALFANUMERICO (TRUE) O SOLO NUMERICO (FALSE) */;

    SELECT

        config_valor

        INTO STRICT v_token_alfa

        FROM ow_base_us.ge_tconfig

        WHERE config_config = 'Usuario.Token.alfanumerico'

    /* SE GENERA EL TOKEN */;

    SELECT

        ow_base_us.tokencod(v_token_long, v_token_alfa)

        INTO STRICT v_token_afil

    /* Se genera un nuevo token */;

    INSERT INTO ow_base_us.aut_ttoken (token_token, token_usuario, token_codigo, token_feccre, token_fecexp, token_estado)

    VALUES (nextval('ow_base_us.aut_stoken'), p_usuario, v_token_afil, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP + (v_token_validez / (24 * 60)::NUMERIC || ' days')::INTERVAL, 'ACT')

    /*

    [5350 - Severity CRITICAL - Unable automatically convert statements that explicitly apply or cancel a transaction. Revise your code to try move transaction control on side of application.]

    COMMIT

    */

    /* SE retorna el Token recien creado */;

    FOR i IN c_consulta LOOP

        to_type_to_aut_ttoken := ROW (i.token_token, i.token_usuario, i.token_codigo, i.token_feccre, i.token_fecexp, i.token_estado)::ow_base_us.type_to_au_token;

        tt_type_tt_aut_ttoken[COALESCE(array_length(tt_type_tt_aut_ttoken, 1), 0)] := to_type_to_aut_ttoken;

    END LOOP;

    p_aut_ttoken := tt_type_tt_aut_ttoken;

    p_cod_rta := v_crta_gral;

    to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rta, p_cod_rta)::ow_base_us.type_to_ge_erro;

    tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

    p_errores := tt_ge_erro;

    SELECT

        *

        FROM ow_base_us.api_ge_qutils$generartypemensajerpta('COD_EXITOSO'::TEXT, p_prcs, p_mensajes)

        INTO p_mensajes;

    EXCEPTION

        WHEN others THEN

            p_cod_rta := 'ERROR';

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, SQLSTATE, SQLERRM)::ow_base_us.type_to_ge_erro;

            tt_ge_erro := ARRAY[to_ge_erro]::ow_base_us.type_tt_ge_erro;

            p_errores := tt_ge_erro;

            v_cod_mensaje := 'ERR_WHEN_OTHERS';

            SELECT

                *

                FROM ow_base_us.api_ge_qutils$generartypemensajerpta(v_cod_mensaje, p_prcs, p_mensajes)

                INTO p_mensajes;

END;

$BODY$;

ALTER FUNCTION ow_base_us."aut_qautenticacion$generartokenautenticacion"(text, text, ow_base_us.type_tt_ge_mnsje)
    OWNER TO ow_base_us;
