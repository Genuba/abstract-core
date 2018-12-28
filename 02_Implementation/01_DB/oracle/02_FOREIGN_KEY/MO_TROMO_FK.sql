REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************


/* Create Foreign Key Constraints */

ALTER TABLE  "FS_AUWEB_US"."MO_TROMO" 
 ADD CONSTRAINT "FK_MO_TROMO_MO_TMODU"
	FOREIGN KEY ("ROMO_MODU") REFERENCES  "FS_AUWEB_US"."MO_TMODU" ("MODU_MODU")
;

ALTER TABLE  "FS_AUWEB_US"."MO_TROMO" 
 ADD CONSTRAINT "FK_MO_TROMO_US_TROLL"
	FOREIGN KEY ("ROMO_ROLL") REFERENCES  "FS_AUWEB_US"."US_TROLL" ("ROLL_ROLL")
;
    
    