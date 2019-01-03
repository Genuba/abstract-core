-- ------------ Write DROP-FOREIGN-KEY-CONSTRAINT-stage scripts -----------

ALTER TABLE ada_db_us.aut_tmnsrv DROP CONSTRAINT fk_aut_tmser_aut_tmenu;



ALTER TABLE ada_db_us.aut_tmnsrv DROP CONSTRAINT fk_aut_tmser_aut_tservc;



ALTER TABLE ada_db_us.aut_tpersn DROP CONSTRAINT fk_aut_tpersn_ge_tciud;



ALTER TABLE ada_db_us.aut_trsin DROP CONSTRAINT fk_aut_trsin_aut_trol;



ALTER TABLE ada_db_us.aut_trsin DROP CONSTRAINT fk_aut_trsin_aut_tservc;



ALTER TABLE ada_db_us.aut_tservc DROP CONSTRAINT fk_aut_tservc_aut_tmodul;



ALTER TABLE ada_db_us.aut_tsrol DROP CONSTRAINT fk_aut_tsrol_aut_trol;



ALTER TABLE ada_db_us.aut_tsrol DROP CONSTRAINT fk_aut_tsrol_aut_tservc;



ALTER TABLE ada_db_us.aut_tsurl DROP CONSTRAINT fk_aut_tsurl_aut_tservc;



ALTER TABLE ada_db_us.aut_ttoken DROP CONSTRAINT fk_aut_ttoken_aut_tusuario;



ALTER TABLE ada_db_us.aut_turol DROP CONSTRAINT fk_aut_turol_aut_trol;



ALTER TABLE ada_db_us.aut_turol DROP CONSTRAINT fk_aut_turol_aut_tusuario;



ALTER TABLE ada_db_us.aut_tusuario DROP CONSTRAINT fk_aut_tusuario_aut_tpersn;



ALTER TABLE ada_db_us.ge_tciud DROP CONSTRAINT fk_ge_tciud_ge_tdepto;



ALTER TABLE ada_db_us.ge_tcrta DROP CONSTRAINT fk_ge_tcrta_ge_tprcs;



ALTER TABLE ada_db_us.ge_tdepto DROP CONSTRAINT fk_ge_tdepto_ge_tpais;



ALTER TABLE ada_db_us.ge_ttdoc DROP CONSTRAINT fk_ge_ttdoc_ge_ttper;



