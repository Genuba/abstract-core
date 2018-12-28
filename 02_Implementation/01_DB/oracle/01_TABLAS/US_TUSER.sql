REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************


/* Create Tables */

CREATE TABLE  "FS_AUWEB_US"."US_TUSER"
(
	"USER_USER" NUMBER(22) NOT NULL,    -- Identificador  unico del usuario en el negocio
	"USER_ALAS" VARCHAR2(40) NOT NULL,    -- Nombres del usuario en el negocio
	"USER_PSWD" VARCHAR2(40) NOT NULL    -- password del usuario en el negocio
)
TABLESPACE	TS_AUWEB
PCTFREE	10 
INITRANS	2 
MAXTRANS	255 
STORAGE ( 
	INITIAL	65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
	)
;
/* Create Comments, Sequences and Triggers for Autonumber Columns */

COMMENT ON TABLE  "FS_AUWEB_US"."US_TUSER" IS 'Tabla que contendra los usuarios del negocio respectivo de empresa '
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TUSER"."USER_USER" IS 'Identificador  unico del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TUSER"."USER_ALAS" IS 'Nombres del usuario en el negocio'
;

COMMENT ON COLUMN  "FS_AUWEB_US"."US_TUSER"."USER_PSWD" IS 'password del usuario en el negocio'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_AUWEB_US"."US_TUSER" 
 ADD CONSTRAINT "PK_USER"
	PRIMARY KEY ("USER_USER") 
USING INDEX 
LOGGING 
TABLESPACE	TS_IAUWEB 
PCTFREE	10 
INITRANS	2 
MAXTRANS	255 
STORAGE ( 
	INITIAL	65536
	MINEXTENTS 1
	MAXEXTENTS 2147483645
	BUFFER_POOL DEFAULT 
	)
;