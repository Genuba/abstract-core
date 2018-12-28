prompt
prompt PACKAGE: MO_QMODU
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.MO_QMODU IS
     --
    -- ===========================================================
    -- MO_QMODU
    -- -----------------------------------------------------------
    -- Todas las funciones del MODU
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Version        GAP                Solicitud        Fecha        Realiza            Descripcion
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
  
  PROCEDURE crearModulo
    (
        p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_descripcion_modulo          IN  MO_TMODU.MODU_DESC%type,
        p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type
    );

  PROCEDURE buscarModuloPorNombre
    (
        p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_id_modulo                   OUT MO_TMODU.MODU_MODU%type,
        p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type
    ); 

  PROCEDURE actualizarModulo
    (
        p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_nombre_modulo_act           IN  MO_TMODU.MODU_NAME%type,
        p_descripcion_modulo_act      IN  MO_TMODU.MODU_DESC%type,
        p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type
    ); 
    -- ------------------------------------------------------------
    
END MO_QMODU;
/


prompt
prompt PACKAGE BODY:MO_QMODU
prompt


CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.MO_QMODU IS
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE crearModulo
    -- -----------------------------------------------------------
    -- creacion de modulo dado atributos
    -- ===========================================================
    PROCEDURE crearModulo
    (
        p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_descripcion_modulo          IN  MO_TMODU.MODU_DESC%type,
        p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia             NUMBER;
        v_cod_rta_modulo          NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := MO_SETMODU.NextVal;

        MO_QVMODU.validarModuloPorNombre
        (
            p_nombre_modulo,
            v_cod_rta_modulo
        );

        IF(v_cod_rta_modulo <> 'OK') THEN
          INSERT INTO MO_TMODU(
            MODU_MODU,
            MODU_NAME,
            MODU_DESC
          )
          VALUES(
            v_secuencia,
            p_nombre_modulo,
            p_descripcion_modulo
          );
           p_cod_rta     := 'OK';
        ELSE
           p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END crearModulo;

    --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE homologarCoreWebModulo
    -- -----------------------------------------------------------
    -- insersion type table core en type table web de roles y 
    -- modulos
    -- ===========================================================
    PROCEDURE buscarModuloPorNombre
    (
        p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_id_modulo                   OUT MO_TMODU.MODU_MODU%type,
        p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type
    )IS

    CURSOR c_MODU IS
        SELECT 
            MODU_MODU
        FROM
            FS_AUWEB_US.MO_TMODU
        WHERE
            MODU_NAME = p_nombre_modulo;

        r_MODU c_MODU%rowtype;

    BEGIN  

        OPEN  c_MODU;
        FETCH c_MODU INTO r_MODU;
        CLOSE c_MODU;

        IF(r_MODU.MODU_MODU IS NOT NULL) THEN
          p_id_modulo  :=  r_MODU.MODU_MODU;
          p_cod_rta     := 'OK';
        ELSE
          p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END buscarModuloPorNombre;
    --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE homologarWebCoreModulo
    -- -----------------------------------------------------------
    -- insersion type table web en type table core de roles y
    -- modulos
    -- ===========================================================
    PROCEDURE actualizarModulo
    (
        p_nombre_modulo               IN  MO_TMODU.MODU_NAME%type,
        p_nombre_modulo_act           IN  MO_TMODU.MODU_NAME%type,
        p_descripcion_modulo_act      IN  MO_TMODU.MODU_DESC%type,
        p_cod_rta                     OUT NE_TCRTA.CRTA_CRTA%type
    )IS

        v_id_modulo            MO_TMODU.MODU_MODU%type;
        v_cod_rta_tipo         NE_TCRTA.CRTA_CRTA%type;

    BEGIN  

        MO_QMODU.buscarModuloPorNombre
        (
            p_nombre_modulo,             
            v_id_modulo,
            v_cod_rta_tipo                      
        );

        IF(v_id_modulo IS NOT NULL) THEN

            UPDATE 
                MO_TMODU
            SET 
                MODU_NAME = p_nombre_modulo_act,
                MODU_DESC = p_descripcion_modulo_act
            WHERE 
                MODU_MODU = v_id_modulo;

              p_cod_rta     := 'OK';
        ELSE
              p_cod_rta     := v_cod_rta_tipo;
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END actualizarModulo;
END MO_QMODU;
/