REM ******************************************************************
REM Fecha         : 08/05/2018
REM Realizado por : Master Zen
REM Base de Datos : FS_AUWEB_US
REM ******************************************************************

REM TABLESPACE TEMPORAL

Create Temporary tablespace TS_TAUWEB TEMPFILE
'C:\oraclexe\app\oracle\oradata\XE\TAUWEB.dbf' size 300m REUSE
         Extent management local uniform size 2m
;

REM TABLESPACE DE DATOS
CREATE TABLESPACE TS_AUWEB DATAFILE 
  'C:\oraclexe\app\oracle\oradata\XE\DAUWEB.DBF' SIZE 300M REUSE AUTOEXTEND ON NEXT 1024M MAXSIZE UNLIMITED
LOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;


REM TABLESPACE DE INDICES 
                                                            
CREATE TABLESPACE TS_IAUWEB DATAFILE 
  'C:\oraclexe\app\oracle\oradata\XE\IAUWEB.DBF' SIZE 300M REUSE AUTOEXTEND ON NEXT 1024M MAXSIZE UNLIMITED
LOGGING
ONLINE
PERMANENT
EXTENT MANAGEMENT LOCAL AUTOALLOCATE
BLOCKSIZE 8K
SEGMENT SPACE MANAGEMENT AUTO
FLASHBACK ON;   

