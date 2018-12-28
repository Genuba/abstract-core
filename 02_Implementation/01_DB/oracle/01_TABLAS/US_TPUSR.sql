REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************


/* Create Tables */

CREATE TABLE  "FS_AUWEB_US"."US_TPUSR"
(
	"PUSR_PUSR" NUMBER(22) NOT NULL,    -- Identificador  unico del usuario rol persona
	"PUSR_USER" NUMBER(22) NULL,
	"PUSR_ROLL" NUMBER(22) NULL,
	"PUSR_PSNA" NUMBER(22) NULL
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

COMMENT ON TABLE  "FS_AUWEB_US"."US_TPUSR" IS 'Tabla que contendra la persona el usuario y su rol'
;

COMMENT ON COLUMN  "US_TPUSR"."PUSR_PUSR" IS 'Identificador unico del usuario rol persona'
;

COMMENT ON COLUMN  "US_TPUSR"."PUSR_USER" IS 'Identificador unico del usuario'
;

COMMENT ON COLUMN  "US_TPUSR"."PUSR_ROLL" IS 'Identificador unico del roll'
;

COMMENT ON COLUMN  "US_TPUSR"."PUSR_PSNA" IS 'Identificador unico de la persona'
;

/* Create Primary Keys, Indexes, Uniques, Checks, Triggers */

ALTER TABLE  "FS_AUWEB_US"."US_TPUSR" 
 ADD CONSTRAINT "PK_PUSR"
	PRIMARY KEY ("PUSR_PUSR") 
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