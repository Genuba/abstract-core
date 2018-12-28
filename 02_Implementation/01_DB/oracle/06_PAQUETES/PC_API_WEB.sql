prompt
prompt PACKAGE: PC_API_WEB
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.PC_API_WEB IS
    --
    -- ===========================================================
    -- PC_API_WEB
    -- -----------------------------------------------------------
    -- ReÃºne funciones y procedimientos relacionados con la 
    -- gestion de negocio 
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- VersiÃ³n        GAP               Solicitud        Fecha        RealizÃ³            DescripciÃ³n
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    
    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================


    -- ------------------------------------------------------------
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
    -- ***********************************************************
    -- Procedimientos funcionalidad usuarios
    -- ***********************************************************
        PROCEDURE loginUsuario
        (
            p_nombre_usuario               IN  US_TUSER.USER_ALAS%type,
            p_password_usuario             IN  US_TUSER.USER_PSWD%type,
            p_id_usuario                   OUT US_TUSER.USER_USER%type,
            p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                      OUT NE_TCRTA.CRTA_DESCRI%type
        );
        -- ------------------------------------------------------------
        PROCEDURE crearUsPeRo
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
            p_password_usuario          IN  US_TUSER.USER_PSWD%type,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
            p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
            p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
            p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
            p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
            p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
            p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%type
        );
        -- ------------------------------------------------------------

        PROCEDURE actualizarUsPe
        (
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
            p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%type,
            p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%type,
            p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%type,
            p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%type,
            p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%type,
            p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%type,
            p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%type,
            p_nombre_usuario_act        IN  US_TUSER.USER_ALAS%type,
            p_password_usuario_act      IN  US_TUSER.USER_PSWD%type,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%type
        );
        -- ------------------------------------------------------------   
        PROCEDURE asignarRolUsPe
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%type
        );

    -- ------------------------------------------------------------   
    -- ___________________________________________________________ 

    -- ***********************************************************
    -- Procedimientos funcionalidad modulo
    -- ***********************************************************
        PROCEDURE crearModulo
        (
            p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
            p_descripcion_modulo          IN  MO_TMODU.MODU_DESC%type,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        );
        -- ------------------------------------------------------------

        PROCEDURE actualizarModulo
        (
            p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
            p_nombre_modulo_act           IN  MO_TMODU.MODU_NAME%type,
            p_descripcion_modulo_act      IN  MO_TMODU.MODU_DESC%type,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        );
        -- ------------------------------------------------------------

        PROCEDURE crearRomo
        (
            p_nombre_roll                 IN  US_TROLL.ROLL_RLDN%type,
            p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        );
        -- ------------------------------------------------------------

        PROCEDURE modulosAccesoUsuario
        (
            p_nombre_usuario              IN  US_TUSER.USER_ALAS%type,
            p_tt_usmo                     OUT TT_USMO,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        );

    -- ------------------------------------------------------------   
    -- ___________________________________________________________ 
    
END PC_API_WEB;
/


prompt
prompt PACKAGE BODY:PC_API_WEB
prompt

CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.PC_API_WEB IS


    -- ***********************************************************
    -- Procedimientos funcionalidad usuarios
    -- ***********************************************************
    -- ===========================================================
        -- PROCEDURE crearUsPeRo
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE loginUsuario
        (
            p_nombre_usuario               IN  US_TUSER.USER_ALAS%type,
            p_password_usuario             IN  US_TUSER.USER_PSWD%type,
            p_id_usuario                   OUT US_TUSER.USER_USER%type,
            p_cod_rta                      OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                      OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_id_usuario                 US_TUSER.USER_USER%type;
          v_cod_rta_ruser              NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            US_QUSER.loginUsuario
            (
                p_nombre_usuario     ,
                p_password_usuario   ,
                v_id_usuario         ,
                v_cod_rta_ruser     
            );

            IF(v_cod_rta_ruser = 'OK') THEN
              v_cod_rta     := 'OK';
              p_id_usuario  :=  v_id_usuario;
              v_msj_rta     := 'Login de usuario exitoso';
            ELSE
                p_id_usuario  :=  NULL;
                v_cod_rta     := 'ERR_INSR_USER';
                v_msj_rta     := 'Usuario o password incorrectos';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_usuario  :=  NULL;
                p_cod_rta     := 'ERROR_NC';
                p_msj_rta     := 'Error Negocio No se registro el usuario';

        END loginUsuario;
        -- ===========================================================
        -- PROCEDURE crearUsPeRo
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE crearUsPeRo
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
            p_password_usuario          IN  US_TUSER.USER_PSWD%type,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
            p_nombres_persona           IN  US_TPSNA.PSNA_NOBE%type,
            p_apellido_persona          IN  US_TPSNA.PSNA_APDO%type,
            p_direccion_persona         IN  US_TPSNA.PSNA_DIRN%type,
            p_telefono_persona          IN  US_TPSNA.PSNA_TLFN%type,
            p_email_persona             IN  US_TPSNA.PSNA_EMAL%type,
            p_pais_persona              IN  US_TPSNA.PSNA_PAIS%type,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_cod_rta_ruser              NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            US_QFPUSR.crearUsPeRo
            (
                p_nombre_roll       ,
                p_nombre_usuario    ,
                p_password_usuario  ,
                p_documento_persona ,
                p_nombres_persona   ,
                p_apellido_persona  ,
                p_direccion_persona ,
                p_telefono_persona  ,
                p_email_persona     ,
                p_pais_persona      ,
                v_cod_rta_ruser     
            );

            IF(v_cod_rta_ruser = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'Se registro correctamente el usuario';
            ELSE
                v_cod_rta     := 'ERR_INSR_USER';
                v_msj_rta := 'No se registro el usuario';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio No se registro el usuario';

        END crearUsPeRo;

        -- ===========================================================
        -- PROCEDURE actualizarUsPe
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE actualizarUsPe
        (
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
            p_documento_persona_act     IN  US_TPSNA.PSNA_NRID%type,
            p_nombres_persona_act       IN  US_TPSNA.PSNA_NOBE%type,
            p_apellido_persona_act      IN  US_TPSNA.PSNA_APDO%type,
            p_direccion_persona_act     IN  US_TPSNA.PSNA_DIRN%type,
            p_telefono_persona_act      IN  US_TPSNA.PSNA_TLFN%type,
            p_email_persona_act         IN  US_TPSNA.PSNA_EMAL%type,
            p_pais_persona_act          IN  US_TPSNA.PSNA_PAIS%type,
            p_nombre_usuario_act        IN  US_TUSER.USER_ALAS%type,
            p_password_usuario_act      IN  US_TUSER.USER_PSWD%type,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_cod_rta_ruser              NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            US_QFPUSR.actualizarUsPe
            (
                p_nombre_usuario         ,
                p_documento_persona      ,
                p_documento_persona_act  ,
                p_nombres_persona_act    ,
                p_apellido_persona_act   ,
                p_direccion_persona_act  ,
                p_telefono_persona_act   ,
                p_email_persona_act      ,
                p_pais_persona_act       ,
                p_nombre_usuario_act     ,
                p_password_usuario_act   ,
                v_cod_rta_ruser                
            );

            IF(v_cod_rta_ruser = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta     := 'Se actualizando correctamente el usuario';
            ELSE
                v_cod_rta   := 'ERR_ACT_USER';
                v_msj_rta   := 'No se actualizando el usuario';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio No se actualizando el usuario';

        END actualizarUsPe;        


        -- ===========================================================
        -- PROCEDURE actualizarUsPe
        -- -----------------------------------------------------------
        -- permite creacion del usuario
        -- ===========================================================
        PROCEDURE asignarRolUsPe
        (
            p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
            p_nombre_usuario            IN  US_TUSER.USER_ALAS%type,
            p_documento_persona         IN  US_TPSNA.PSNA_NRID%type,
            p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                   OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_cod_rta_ruser              NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            US_QFPUSR.asignarRolUsPe
            (
                p_nombre_roll       ,
                p_nombre_usuario    ,
                p_documento_persona ,
                v_cod_rta_ruser           
            );

            IF(v_cod_rta_ruser = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'se puede asignar rol el correctamente del usuario';
            ELSE
                v_cod_rta     := 'ERR_ASIG_USEROL';
                v_msj_rta := 'No se puede asignar rol el usuario';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se actualizando el usuario';

        END asignarRolUsPe;        
    -- ___________________________________________________________  

    -- ***********************************************************
    -- Procedimientos funcionalidad de modulo
    -- ***********************************************************
        -- ===========================================================
        -- PROCEDURE crearModulo
        -- -----------------------------------------------------------
        -- permite creacion del modulo
        -- ===========================================================
        PROCEDURE crearModulo
        (
            p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
            p_descripcion_modulo          IN  MO_TMODU.MODU_DESC%type,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_cod_rta_modulo             NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                    NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                    NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            MO_QMODU.crearModulo
            (
                p_nombre_modulo      ,
                p_descripcion_modulo ,
                v_cod_rta_modulo
            );

            IF(v_cod_rta_modulo = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta := 'Creacion de modulo exitosa exitoso';
            ELSE
                v_cod_rta     := 'ERR_INSR_USER';
                v_msj_rta := 'El modulo ya existe';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se registro el modulo';

        END crearModulo;

        -- ===========================================================
        -- PROCEDURE actualizarModulo
        -- -----------------------------------------------------------
        -- Actualizacion del modulo
        -- ===========================================================
        PROCEDURE actualizarModulo
        (
            p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
            p_nombre_modulo_act           IN  MO_TMODU.MODU_NAME%type,
            p_descripcion_modulo_act      IN  MO_TMODU.MODU_DESC%type,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_cod_rta_modulo                NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                       NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                       NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            MO_QMODU.actualizarModulo
            (
                p_nombre_modulo               ,
                p_nombre_modulo_act           ,
                p_descripcion_modulo_act      ,
                v_cod_rta_modulo                     
            );

            IF(v_cod_rta_modulo = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta     := 'Actualizacion del modulo exitosa';
            ELSE
                v_cod_rta     := 'ERR_INSR_USER';
                v_msj_rta     := 'Modulo no encontrado';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio no se actualizo el modulo';

        END actualizarModulo;

        -- ===========================================================
        -- PROCEDURE crearRomo
        -- -----------------------------------------------------------
        -- Asignasion de rol de usuario a modulo del negocio
        -- ===========================================================
        PROCEDURE crearRomo
        (
            p_nombre_roll                 IN  US_TROLL.ROLL_RLDN%type,
            p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_cod_rta_modulo                NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                       NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                       NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            MO_QFROMO.crearRomo
            (
                p_nombre_roll         ,
                p_nombre_modulo       ,
                v_cod_rta_modulo                     
            );

            IF(v_cod_rta_modulo = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta     := 'Asignacion del modulo con rol exitosa';
            ELSE
                v_cod_rta     := 'ERR_INSR_USER';
                v_msj_rta     := 'Modulo o rol no encontrado';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio No se asigno el rol al modulo';

        END crearRomo;

        -- ===========================================================
        -- PROCEDURE modulosAccesoUsuario
        -- -----------------------------------------------------------
        -- Permite obtener los modulos de acceso que tiene permitido 
        -- ingresar el usuario
        -- ===========================================================
        PROCEDURE modulosAccesoUsuario
        (
            p_nombre_usuario              IN  US_TUSER.USER_ALAS%type,
            p_tt_usmo                     OUT TT_USMO,
            p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type,
            p_msj_rta                     OUT NE_TCRTA.CRTA_DESCRI%type
        )IS

          v_cod_rta_modulo                NE_TCRTA.CRTA_CRTA%type;
          v_cod_rta                       NE_TCRTA.CRTA_CRTA%type;
          v_msj_rta                       NE_TCRTA.CRTA_DESCRI%type;
        BEGIN  

            MO_QFROMO.modulosAccesoUsuario
            (
                p_nombre_usuario      ,
                p_tt_usmo             ,
                v_cod_rta_modulo                     
            );

            IF(v_cod_rta_modulo = 'OK') THEN
              v_cod_rta     := 'OK';
              v_msj_rta     := 'Busqueda exitosa';
            ELSE
                v_cod_rta     := 'ERR_INSR_USER';
                v_msj_rta     := 'No se encontraron modulos asignados a este rol de usuario';
            END IF;
            p_cod_rta  := v_cod_rta;
            p_msj_rta  := v_msj_rta;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';
                p_msj_rta  := 'Error Negocio No encontro el resultado';

        END modulosAccesoUsuario;
    -- ___________________________________________________________  

        
END PC_API_WEB;
/