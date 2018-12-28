-- FUNCTION: ow_base_us."ge_qmenu$titulosmenuporusuario"(text, text)

CREATE OR REPLACE FUNCTION ow_base_us."ge_qmenu$titulosmenuporusuario"(
	p_prcs text,
	p_usuario text,
	OUT p_tmenu ow_base_us.type_tt_ge_menu,
	OUT p_cod_rpta text,
	OUT p_errores ow_base_us.type_tt_ge_erro,
	OUT p_mensajes ow_base_us.type_tt_ge_mnsje)
    RETURNS record
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$

/* */

DECLARE

    c_titulosmenuporusuario CURSOR FOR

    SELECT DISTINCT

        ow_base_ext.to_char(m.menu_menu) AS menu_menu, ow_base_ext.to_char(m.menu_orden) AS menu_orden, m.menu_nombre, m.menu_descri, m.menu_icon

        FROM ow_base_us.aut_turol, ow_base_us.aut_tsrol, ow_base_us.aut_tmnsrv, ow_base_us.aut_tmenu AS m

        WHERE urol_usuario = p_usuario AND urol_rol = srol_rol AND mser_servicio = srol_servicio AND menu_menu = mser_menu

        ORDER BY menu_orden ASC

    /* */;

    to_ge_erro ow_base_us.type_to_ge_erro;

    tt_ge_erro ow_base_us.type_tt_ge_erro

    /* */;

    to_ge_menu ow_base_us.type_to_ge_menu;

    tt_ge_menu ow_base_us.type_tt_ge_menu

    /* */;

    v_crta_http_gral CHARACTER VARYING(5) := 'OK';

    v_mensaje ow_base_us.type_tt_ge_mnsje;

/* */

/* */

BEGIN

    FOR i IN c_titulosmenuporusuario

    /* */

    LOOP

        to_ge_menu := ROW (i.menu_menu, i.menu_orden, i.menu_nombre, i.menu_descri, i.menu_icon)::ow_base_us.type_to_ge_menu

        /* */;

        tt_ge_menu[COALESCE(array_length(tt_ge_menu, 1), 0)] := to_ge_menu;

        /* */

    END LOOP

    /* */;

    p_tmenu := tt_ge_menu;

    p_cod_rpta := COALESCE(v_crta_http_gral, 'OK');

    to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, p_cod_rpta, p_cod_rpta)::ow_base_us.type_to_ge_erro;

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

            p_cod_rpta := 'ERROR'

            /* */;

            to_ge_erro := ROW (CURRENT_TIMESTAMP, p_prcs, SQLSTATE, SQLERRM)::ow_base_us.type_to_ge_erro;

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

ALTER FUNCTION ow_base_us."ge_qmenu$titulosmenuporusuario"(text, text)
    OWNER TO ow_base_us;
