-- ------------ Write DROP-FUNCTION-stage scripts -----------

DROP FUNCTION IF EXISTS ow_base_us.add_days(IN TIMESTAMP WITHOUT TIME ZONE, IN DOUBLE PRECISION);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$actualizarusuario(IN ow_base_us.type_tt_ge_lgtr, IN ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$cambiarestadousuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$cambiarpassword(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$establecerpassword(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$generartokenautenticacion(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_au_token, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, INOUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$generartokenrecuperacion(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$getusuariotokenrecuperacion(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$obtenerrolesporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_au_rol, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$obtenerusuariosimple(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qautenticacion$obtenerusuariotoken(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$actualizarpersona(IN ow_base_us.type_tt_ge_lgtr, IN ow_base_us.type_tt_au_tpersn, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$asignarroles(IN ow_base_us.type_tt_ge_lgtr, IN ow_base_us.type_tt_au_usuario, IN ow_base_us.type_tt_au_rol, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$asignarrolporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$asignarserviciorol(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$crearrol(IN ow_base_us.type_tt_ge_lgtr, IN ow_base_us.type_tt_au_rol, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, INOUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$crearusuario(IN ow_base_us.type_tt_ge_lgtr, IN ow_base_us.type_tt_au_tpersn, IN ow_base_us.type_tt_au_rol, IN ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$eliminarrol(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$eliminarrolesporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$eliminarserviciorol(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$getallusuarios(IN ow_base_us.type_tt_ge_lgtr, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$getrol(IN ow_base_us.type_tt_ge_lgtr, OUT ow_base_us.type_tt_au_rol, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, INOUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$getserviciosporrol(IN ow_base_us.type_tt_ge_lgtr, OUT ow_base_us.type_tt_ge_srvcio, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$obtenerpersonaasociadausuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_au_tpersn, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$obtenerpersonapordocumento(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_tpersn, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_aut_qusuarios$obtenerusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qmenu$modulosporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_ge_modulo, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qmenu$obtenermenuporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_ge_srvcio, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qmenu$paginainicioporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qmenu$serviciostplistadoporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_ge_srvcio, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qmenu$serviciosusuarioporurl(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_ge_srvcio, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qmenu$titulosmenuporusuario(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT ow_base_us.type_tt_ge_menu, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qparametros$obtenerciuddeppais(IN DOUBLE PRECISION, OUT ow_base_us.type_tt_ge_ciud, OUT ow_base_us.type_tt_ge_depto, OUT ow_base_us.type_tt_ge_pais, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, INOUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qparametros$obtenerlistaciudades(OUT ow_base_us.type_tt_ge_ciud, IN DOUBLE PRECISION, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qparametros$obtenerlistadeptos(OUT ow_base_us.type_tt_ge_depto, IN DOUBLE PRECISION, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qparametros$obtenerlistapaises(OUT ow_base_us.type_tt_ge_pais, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qparametros$obtenerlistatipodocumentos(OUT ow_base_us.type_tt_ge_tpdoc, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$crearlogtransaccion(IN TEXT, IN TEXT);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$generartypeerrorrpta(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_ge_erro);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$generartypemensajerpta(IN TEXT, IN TEXT, INOUT ow_base_us.type_tt_ge_mnsje, IN TEXT);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$getmensajeporcodigo(IN TEXT, IN TEXT);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$getnextvalue(IN TEXT, OUT DOUBLE PRECISION);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$obtener_errores_log(IN DOUBLE PRECISION, OUT ow_base_us.type_tt_ge_erro);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$obtenerdescripcionproceso(IN TEXT);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$obtenerfechaconformato(IN TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ow_base_us.api_ge_qutils$registrar_error(INOUT ow_base_us.type_tt_ge_erro, IN TEXT, IN TEXT, IN TEXT);



DROP FUNCTION IF EXISTS ow_base_us.aut_qautenticacion$actualizarclaveusuario(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qautenticacion$cambiarpassword(IN TEXT, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qautenticacion$generartokenautenticacion(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_token, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, INOUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qautenticacion$generartokenrecuperacion(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qautenticacion$getusuariotokenrecuperacion(IN TEXT, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qautenticacion$obtenerusuariotoken(IN TEXT, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$actualizarpersona(IN TEXT, IN ow_base_us.type_tt_au_tpersn, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$actualizarusuario(IN TEXT, IN ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$asignarroles(IN TEXT, IN ow_base_us.type_tt_au_usuario, IN ow_base_us.type_tt_au_rol, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$asignarrolporusuario(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$asignarserviciorol(IN TEXT, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$cambiarestadousuario(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$crearpersona(IN TEXT, IN ow_base_us.type_tt_au_tpersn, OUT TEXT, OUT DOUBLE PRECISION, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$crearrol(IN TEXT, IN ow_base_us.type_tt_au_rol, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, INOUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$crearusuario(IN TEXT, IN ow_base_us.type_tt_au_usuario, IN DOUBLE PRECISION, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$eliminarrol(IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$eliminarrolesporusuario(IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$eliminarserviciorol(IN TEXT, IN TEXT, IN DOUBLE PRECISION, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$getallusuarios(IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$getpersonapordocumento(IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_au_tpersn, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$getpersonaporusuario(IN TEXT, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_au_tpersn, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$getrol(IN TEXT, OUT ow_base_us.type_tt_au_rol, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, INOUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$getserviciosporrol(IN TEXT, OUT ow_base_us.type_tt_ge_srvcio, IN TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$obtenerrolesporusuario(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_rol, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$obtenerusuario(IN TEXT, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.aut_qusuarios$obtenerusuariosimple(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_au_usuario, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.dias(IN TIMESTAMP WITHOUT TIME ZONE, IN TIMESTAMP WITHOUT TIME ZONE);



DROP FUNCTION IF EXISTS ow_base_us.ge_qcrta$consultar_crta(IN TEXT, IN TEXT, OUT DOUBLE PRECISION, OUT TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ow_base_us.ge_qlgtr$finalizar_log(IN TEXT, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ow_base_us.ge_qlgtr$iniciar_log(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ow_base_us.ge_qlgtr$registrar_detalle_log(IN TEXT, IN TEXT, IN TEXT, IN TEXT, IN TEXT, OUT TEXT, OUT TEXT);



DROP FUNCTION IF EXISTS ow_base_us.ge_qlgtr$validar_ctrl_operacion(IN ow_base_us.type_tt_ge_lgtr, IN TEXT, OUT TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro);



DROP FUNCTION IF EXISTS ow_base_us.ge_qmenu$modulosporusuario(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_ge_modulo, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.ge_qmenu$obtenermenuporusuario(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_ge_srvcio, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.ge_qmenu$paginainicioporusuario(IN TEXT, IN TEXT, OUT TEXT, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.ge_qmenu$serviciostplistadoporusuario(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_ge_srvcio, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.ge_qmenu$serviciosusuarioporurl(IN TEXT, IN TEXT, IN TEXT, OUT ow_base_us.type_tt_ge_srvcio, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.ge_qmenu$titulosmenuporusuario(IN TEXT, IN TEXT, OUT ow_base_us.type_tt_ge_menu, OUT TEXT, OUT ow_base_us.type_tt_ge_erro, OUT ow_base_us.type_tt_ge_mnsje);



DROP FUNCTION IF EXISTS ow_base_us.nextvalue(IN TEXT);



DROP FUNCTION IF EXISTS ow_base_us.now();



DROP FUNCTION IF EXISTS ow_base_us.tokencod(IN DOUBLE PRECISION, IN TEXT);



