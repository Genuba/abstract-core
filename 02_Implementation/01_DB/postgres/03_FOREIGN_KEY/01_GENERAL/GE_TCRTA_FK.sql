--
-- Name: ge_tcrta fk_ge_tcrta_ge_tprcs; Type: FK CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.ge_tcrta
    ADD CONSTRAINT fk_ge_tcrta_ge_tprcs FOREIGN KEY (crta_prcs) REFERENCES ada_db_us.ge_tprcs(prcs_prcs);