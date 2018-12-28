prompt
prompt PACKAGE: MO_QFROMO
prompt
CREATE OR REPLACE PACKAGE FS_AUWEB_US.MO_QFROMO IS
 --
    -- ===========================================================
    -- MO_QFROMO
    -- -----------------------------------------------------------
    -- Todas las funciones del modulo y rol
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

  PROCEDURE obtenerRomoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo           IN  MO_TMODU.MODU_NAME%type,
        p_id_romo                 OUT MO_TROMO.ROMO_ROMO%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );
  PROCEDURE crearRomo
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo             IN  MO_TMODU.MODU_NAME%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    );
  PROCEDURE modulosAccesoUsuario
    (
        p_nombre_usuario          IN  US_TUSER.USER_ALAS%type,  
        p_tt_usmo                 OUT TT_USMO,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    );

END MO_QFROMO;
/


prompt
prompt PACKAGE BODY:MO_QFROMO
prompt


CREATE OR REPLACE PACKAGE BODY FS_AUWEB_US.MO_QFROMO IS
  
  
    --
    -- #VERSION:0000001000
    --
    
    -- ===========================================================
    -- PROCEDURE modulosAccesoUsuario
    -- -----------------------------------------------------------
    -- obtiene el los modulos alos cuales el usuario puede acceder 
    -- ===========================================================
   PROCEDURE modulosAccesoUsuario
    (
        p_nombre_usuario          IN  US_TUSER.USER_ALAS%type,
        p_tt_usmo                 OUT TT_USMO,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS
       
        cursor c_usmo 
        (
            pc_USER_USER          US_TUSER.USER_USER%type
        )IS
            SELECT
                MODU_MODU,
                MODU_NAME
            FROM
                MO_TMODU mo,
                MO_TROMO rm,
                US_TROLL ro,
                US_TPUSR pur
            WHERE
                pur.PUSR_ROLL = ro.ROLL_ROLL AND
                ro.ROLL_ROLL  = rm.ROMO_ROLL AND
                mo.MODU_MODU  = rm.ROMO_MODU AND
                pur.PUSR_USER = pc_USER_USER;


        v_to_usmo                TO_USMO; 
        v_tt_usmo                TT_USMO := TT_USMO();
        v_id_usuario             US_TUSER.USER_USER%type;
        v_cod_rta_usuario        NE_TCRTA.CRTA_CRTA%type;

    BEGIN 

        US_QUSER.buscarUsuarioPorNombre
        (
            p_nombre_usuario,
            v_id_usuario,
            v_cod_rta_usuario
        );

        IF  v_cod_rta_usuario='OK' THEN

            FOR i IN c_usmo(v_id_usuario) LOOP

                v_to_usmo:=TO_USMO(i.MODU_MODU,i.MODU_NAME);
                v_tt_usmo.extend;
                v_tt_usmo(v_tt_usmo.count):=v_to_usmo;

             END LOOP;

             IF (v_tt_usmo.COUNT > 0) THEN 
                p_tt_usmo   := v_tt_usmo;
                p_cod_rta   := 'OK';
            ELSE 
                p_cod_rta   := 'ER_NULL_USM';
            END IF;
        ELSE
            p_tt_usmo := NULL;
            p_cod_rta   := 'ER_NULL_USER';
        END if;
        EXCEPTION
            WHEN OTHERS THEN
                p_tt_usmo:= NULL;
                p_cod_rta  := 'ERROR_NC';

    END modulosAccesoUsuario;

    --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE obtenerRomoId
    -- -----------------------------------------------------------
    -- obtiene el id de modulo rol 
    -- ===========================================================
    PROCEDURE obtenerRomoId
    (
        p_nombre_roll             IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo           IN  MO_TMODU.MODU_NAME%type,
        p_id_romo                 OUT MO_TROMO.ROMO_ROMO%type,
        p_cod_rta                 OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        cursor c_romo 
        (
            pc_ROLL_ROLL US_TROLL.ROLL_ROLL%type,
            pc_MODU_MODU MO_TMODU.MODU_MODU%type
        )is
            SELECT
                ROMO_ROMO
            FROM
                US_TROLL ro,
                MO_TMODU mo, 
                MO_TROMO rm
            WHERE
                rm.ROMO_ROLL = ro.ROLL_ROLL AND
                rm.ROMO_MODU = mo.MODU_MODU AND
                rm.ROMO_ROLL = pc_ROLL_ROLL AND
                rm.ROMO_MODU = pc_MODU_MODU;

        r_romo                  c_romo%rowtype;
        v_id_roll               US_TROLL.ROLL_ROLL%type;
        v_id_modulo             MO_TMODU.MODU_MODU%type;
        v_cod_rta_roll          NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_modulo        NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );
        MO_QMODU.buscarModuloPorNombre
        (
            p_nombre_modulo,
            v_id_modulo,
            v_cod_rta_modulo
        );

        OPEN c_romo(v_id_roll,v_id_modulo);
        FETCH c_romo INTO r_romo;
        CLOSE c_romo;

        IF  v_cod_rta_roll='OK' AND v_cod_rta_modulo='OK' AND r_romo.ROMO_ROMO IS NOT NULL THEN

            p_id_romo := r_romo.ROMO_ROMO;
            p_cod_rta   := 'OK';
        ELSE
            p_id_romo := NULL;
            p_cod_rta   := 'ER_NULL';
        END if;
        EXCEPTION
            WHEN OTHERS THEN
                p_id_romo:= NULL;
                p_cod_rta  := 'ERROR_NC';

    END obtenerRomoId;

     --
    -- #VERSION:0000001000
    --

    -- ===========================================================
    -- PROCEDURE crearRomo
    -- -----------------------------------------------------------
    -- creacion de modulo y rol dado atributos
    -- ===========================================================
    PROCEDURE crearRomo
    (
        p_nombre_roll               IN  US_TROLL.ROLL_RLDN%type,
        p_nombre_modulo             IN  MO_TMODU.MODU_NAME%type,
        p_cod_rta                   OUT NE_TCRTA.CRTA_CRTA%type
    )IS
        v_secuencia                 NUMBER;
        v_id_roll                   US_TROLL.ROLL_ROLL%type;
        v_id_modulo                 MO_TMODU.MODU_MODU%type;
        v_cod_rta_roll              NE_TCRTA.CRTA_CRTA%type;
        v_cod_rta_modulo            NE_TCRTA.CRTA_CRTA%type;

    BEGIN  
        v_secuencia := MO_SETROMO.NextVal;

        US_QROLL.buscarRollPorNombre
        (
            p_nombre_roll,
            v_id_roll,
            v_cod_rta_roll
        );

        MO_QMODU.buscarModuloPorNombre
        (
            p_nombre_modulo  ,
            v_id_modulo,
            v_cod_rta_modulo
        );

        IF  v_cod_rta_roll='OK' AND v_cod_rta_modulo='OK' THEN
           INSERT INTO MO_TROMO(
            ROMO_ROMO,
            ROMO_MODU,
            ROMO_ROLL
          )
          VALUES(
            v_secuencia,
            v_id_modulo,
            v_id_roll
          );
           p_cod_rta     := 'OK';
        ELSE
           p_cod_rta     := 'ER_NULL';
        END IF;
        EXCEPTION
            WHEN OTHERS THEN
                p_cod_rta  := 'ERROR_NC';

    END crearRomo;
END MO_QFROMO;
/