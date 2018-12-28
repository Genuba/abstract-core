REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

/* Create Tables */

CREATE TABLE  "FS_AUWEB_US"."MO_TMODU"
(
	"MODU_MODU" NUMBER(22) NOT NULL,    -- Identificador  unico del modulo
	"MODU_NAME" VARCHAR2(50) NULL,
	"MODU_DESC" VARCHAR2(50) NULL
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

COMMENT ON TABLE  "FS_AUWEB_US"."MO_TMODU" IS 'Tabla que contendra los modulos del sistema'
;

COMMENT ON COLUMN  "MO_TMODU"."MODU_MODU" IS 'Identificador  unico del modulo'
;

COMMENT ON COLUMN  "MO_TMODU"."MODU_NAME" IS 'Nombre del modulo'
;

COMMENT ON COLUMN  "MO_TMODU"."MODU_DESC" IS 'Descripción del modulo'
;


/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_AUWEB_US"."MO_TMODU" 
 ADD CONSTRAINT "PK_MODU"
	PRIMARY KEY ("MODU_MODU") 
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