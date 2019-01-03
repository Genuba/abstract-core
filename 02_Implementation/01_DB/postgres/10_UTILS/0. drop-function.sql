-- ------------ Write DROP-FUNCTION-stage scripts -----------

DROP FUNCTION IF EXISTS ada_db_us.add_days(IN TIMESTAMP WITHOUT TIME ZONE, IN DOUBLE PRECISION);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$actualizarusuario(IN ada_db_us.type_tt_ge_lgtr, IN ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$cambiarestadousuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$cambiarpassword(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$establecerpassword(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$generartokenautenticacion(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_au_token, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, INOUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$generartokenrecuperacion(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$getusuariotokenrecuperacion(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$obtenerrolesporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_au_rol, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$obtenerusuariosimple(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qautenticacion$obtenerusuariotoken(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$actualizarpersona(IN ada_db_us.type_tt_ge_lgtr, IN ada_db_us.type_tt_au_tpersn, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$asignarroles(IN ada_db_us.type_tt_ge_lgtr, IN ada_db_us.type_tt_au_usuario, IN ada_db_us.type_tt_au_rol, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$asignarrolporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$asignarserviciorol(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$crearrol(IN ada_db_us.type_tt_ge_lgtr, IN ada_db_us.type_tt_au_rol, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, INOUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$crearusuario(IN ada_db_us.type_tt_ge_lgtr, IN ada_db_us.type_tt_au_tpersn, IN ada_db_us.type_tt_au_rol, IN ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$eliminarrol(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$eliminarrolesporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$eliminarserviciorol(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$getallusuarios(IN ada_db_us.type_tt_ge_lgtr, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$getrol(IN ada_db_us.type_tt_ge_lgtr, OUT ada_db_us.type_tt_au_rol, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, INOUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$getserviciosporrol(IN ada_db_us.type_tt_ge_lgtr, OUT ada_db_us.type_tt_ge_srvcio, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$obtenerpersonaasociadausuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_au_tpersn, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$obtenerpersonapordocumento(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_tpersn, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_aut_qusuarios$obtenerusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qmenu$modulosporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_ge_modulo, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qmenu$obtenermenuporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_ge_srvcio, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qmenu$paginainicioporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qmenu$serviciostplistadoporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_ge_srvcio, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qmenu$serviciosusuarioporurl(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_ge_srvcio, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qmenu$titulosmenuporusuario(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT ada_db_us.type_tt_ge_menu, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qparametros$obtenerciuddeppais(IN DOUBLE PRECISION, OUT ada_db_us.type_tt_ge_ciud, OUT ada_db_us.type_tt_ge_depto, OUT ada_db_us.type_tt_ge_pais, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, INOUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qparametros$obtenerlistaciudades(OUT ada_db_us.type_tt_ge_ciud, IN DOUBLE PRECISION, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qparametros$obtenerlistadeptos(OUT ada_db_us.type_tt_ge_depto, IN DOUBLE PRECISION, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qparametros$obtenerlistapaises(OUT ada_db_us.type_tt_ge_pais, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qparametros$obtenerlistatipodocumentos(OUT ada_db_us.type_tt_ge_tpdoc, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$crearlogtransaccion(IN TEXT, IN TEXT);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$generartypeerrorrpta(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_ge_erro);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$generartypemensajerpta(IN TEXT, IN TEXT, INOUT ada_db_us.type_tt_ge_mnsje, IN TEXT);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$getmensajeporcodigo(IN TEXT, IN TEXT);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$getnextvalue(IN TEXT, OUT DOUBLE PRECISION);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$obtener_errores_log(IN DOUBLE PRECISION, OUT ada_db_us.type_tt_ge_erro);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$obtenerdescripcionproceso(IN TEXT);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$obtenerfechaconformato(IN TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ada_db_us.api_ge_qutils$registrar_error(INOUT ada_db_us.type_tt_ge_erro, IN TEXT, IN TEXT, IN TEXT);



DROP FUNCTION IF EXISTS ada_db_us.aut_qautenticacion$actualizarclaveusuario(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qautenticacion$cambiarpassword(IN TEXT, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qautenticacion$generartokenautenticacion(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_token, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, INOUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qautenticacion$generartokenrecuperacion(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qautenticacion$getusuariotokenrecuperacion(IN TEXT, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qautenticacion$obtenerusuariotoken(IN TEXT, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$actualizarpersona(IN TEXT, IN ada_db_us.type_tt_au_tpersn, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$actualizarusuario(IN TEXT, IN ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$asignarroles(IN TEXT, IN ada_db_us.type_tt_au_usuario, IN ada_db_us.type_tt_au_rol, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$asignarrolporusuario(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$asignarserviciorol(IN TEXT, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$cambiarestadousuario(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$crearpersona(IN TEXT, IN ada_db_us.type_tt_au_tpersn, OUT TEXT, OUT DOUBLE PRECISION, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$crearrol(IN TEXT, IN ada_db_us.type_tt_au_rol, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, INOUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$crearusuario(IN TEXT, IN ada_db_us.type_tt_au_usuario, IN DOUBLE PRECISION, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$eliminarrol(IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$eliminarrolesporusuario(IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$eliminarserviciorol(IN TEXT, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$getallusuarios(IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$getpersonapordocumento(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_au_tpersn, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$getpersonaporusuario(IN TEXT, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_au_tpersn, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$getrol(IN TEXT, OUT ada_db_us.type_tt_au_rol, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, INOUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$getserviciosporrol(IN TEXT, OUT ada_db_us.type_tt_ge_srvcio, IN TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$obtenerrolesporusuario(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_rol, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$obtenerusuario(IN TEXT, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.aut_qusuarios$obtenerusuariosimple(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_au_usuario, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.dias(IN TIMESTAMP WITHOUT TIME ZONE, IN TIMESTAMP WITHOUT TIME ZONE);



DROP FUNCTION IF EXISTS ada_db_us.ge_qcrta$consultar_crta(IN TEXT, IN TEXT, OUT DOUBLE PRECISION, OUT TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ada_db_us.ge_qlgtr$finalizar_log(IN TEXT, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ada_db_us.ge_qlgtr$iniciar_log(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ada_db_us.ge_qlgtr$registrar_detalle_log(IN TEXT, IN TEXT, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ada_db_us.ge_qlgtr$validar_ctrl_operacion(IN ada_db_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro);



DROP FUNCTION IF EXISTS ada_db_us.ge_qmenu$modulosporusuario(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_ge_modulo, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.ge_qmenu$obtenermenuporusuario(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_ge_srvcio, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.ge_qmenu$paginainicioporusuario(IN TEXT, IN TEXT, OUT TEXT, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.ge_qmenu$serviciostplistadoporusuario(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_ge_srvcio, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.ge_qmenu$serviciosusuarioporurl(IN TEXT, IN TEXT, IN TEXT, OUT ada_db_us.type_tt_ge_srvcio, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.ge_qmenu$titulosmenuporusuario(IN TEXT, IN TEXT, OUT ada_db_us.type_tt_ge_menu, OUT TEXT, OUT ada_db_us.type_tt_ge_erro, OUT ada_db_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ada_db_us.nextvalue(IN TEXT);



DROP FUNCTION IF EXISTS ada_db_us.nada();



DROP FUNCTION IF EXISTS ada_db_us.tokencod(IN DOUBLE PRECISION, IN TEXT);



