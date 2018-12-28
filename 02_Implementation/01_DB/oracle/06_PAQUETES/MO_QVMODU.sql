prompt
prompt PACKAGE: MO_QVMODU
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.MO_QVMODU IS
    --
    -- ===========================================================
    -- MO_QVMODU
    -- -----------------------------------------------------------
    -- validador de existencia de modulo por Nombre
    -- ===========================================================
    --
    -- #VERSION:0000001000
    --
    -- HISTORIAL DE CAMBIOS
    --
    -- Versión        GAP                Solicitud        Fecha        Realizó            Descripción
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------
    -- 
    -- -----------    -------------    -------------    ----------    -------------    ------------------------------------------------------------------------------------------------------------------------------------------

    -- ============================================================
    -- Constantes generales a nivel de PAQUETE
    -- ============================================================
  
    
    -- ============================================================
    -- Declaracion de PROCEDIMIENTOS y FUNCIONES
    -- ============================================================
    
  PROCEDURE validarModuloPorNombre
    (
        p_nombre_modulo                  IN  MO_TMODU.MODU_NAME%type,
        p_cod_rta                        OUT NE_TCRTA.CRTA_CRTA%type
    ); 

----------------------------------------------------------
    
END MO_QVMODU;
/


prompt
prompt PACKAGE BODY:MO_QVMODU
prompt

CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.MO_QVMODU IS

    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE validarmoduloPorNombre
    -- -----------------------------------------------------------
    -- validar existencia de modulo por Nombre
    -- ===========================================================
    PROCEDURE validarModuloPorNombre
    (
        p_nombre_modulo                  IN  MO_TMODU.MODU_NAME%type,
        p_cod_rta                        OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        
        CURSOR c_modulo IS
            SELECT
                MODU_NAME
            FROM
                FS_AUWEB_US.MO_TMODU
            WHERE
                MODU_NAME = p_nombre_modulo;

            r_modulo c_modulo%rowtype;

    BEGIN

        OPEN  c_modulo;
        FETCH c_modulo INTO r_modulo;
        CLOSE c_modulo;

        IF(r_modulo.MODU_NAME IS NOT NULL) then
            p_cod_rta           := 'OK';

        ELSE
            p_cod_rta           := 'ER_EMP_NUL';
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            p_cod_rta           := 'ERROR_NC';

    END validarmoduloPorNombre;
    
END MO_QVMODU;
/