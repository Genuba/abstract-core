-- INSERTING into ow_base_us.GE_TCONFIG
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('General.Rutas.Archivos','General','Ruta general de Archivos','2','D:\SGR_FILES');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('General.Rutas.Web.URLBASE','General','Nombre de url base','2','http://localhost:9090');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('General.Rutas.Web.Downloads','General','Carpeta Archivos Descargables Web','2','/downloads/');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.smtp.server','Mail','Sevidor SMTP','2','smtp.gmail.com');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.smtp.port','Mail','Puerto del Servidor SMTP','2','465');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.smtp.tls','Mail','Acepta TLS','2','true');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.username','Mail','Usuario para autenticar el correo','2','saul.quintero@ownk.co');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.password','Mail','Contrasena de autenticación del correo','2','PruebaOwnk--');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.from.address','Mail','Dirección de Correo que envía','2','saul.quintero@ownk.co');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.from.name','Mail','Nombre de la Dirección de Correo que envía','2','Su Garantía - Sistema de Solicitudes');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.smtp.ssl','Mail','Acepta SSL','2','true');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.template.folder','Mail','Carpeta de plantillas de Email','2','/webapps/OW_BASE-1.0.0/APP/general/email_templates/');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.template.usuario.token','Mail','Plantilla para envio de Tokens Afiliados','2','mail-token-usuario.html');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.template.usuario.registro','Mail','Plantilla para envio de registro Afiliados','2','mail-registro-usuario.html');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.template.usuario.password','Mail','Plantilla para envio de notificación de Cambio en Password','2','mail-cambio-password-usuario.html');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('Mail.template.usuario.recuperacion','Mail','Plantilla para elnace de recuperacion','2','mail-recuperacion-usuario.html');
Insert into ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) values ('General.Estado.Offline','General','esta offline','2','false');
INSERT INTO ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) VALUES ('Usuario.Token.longitud', 'Usuario', 'Longitud Token Inicio de Sesión Afiliado', '2', '6');
INSERT INTO ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) VALUES ('Usuario.Token.alfanumerico', 'Usuario', 'True: Alfanumerico False: Numerico', '2', 'false');
INSERT INTO ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) VALUES ('Usuario.Token.duracion', 'Usuario', 'Vigencia en Minutos', '2', '15');
INSERT INTO ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) VALUES ('Usuario.General.Avatar.ruta', 'Usuario', 'Ruta de las imagenes Avatar del Perfil', '2', 'profiles-photos/usuarios/');
INSERT INTO ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) VALUES ('Captcha.url', 'General', 'URL Servicio de Captcha', '2', 'https://www.google.com/recaptcha/api/siteverify');
INSERT INTO ow_base_us.GE_TCONFIG (CONFIG_CONFIG,CONFIG_CATEGORIA,CONFIG_DESCRI,CONFIG_TIPO_DATO,CONFIG_VALOR) VALUES ('Captcha.secret', 'General', 'Clave secreta de Captcha', '2', '6Ldk1EcUAAAAAEOO_PLgHMO4K2eA4fYOnRUbhL3I');

