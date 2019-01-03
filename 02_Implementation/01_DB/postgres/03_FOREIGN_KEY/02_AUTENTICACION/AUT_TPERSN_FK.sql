--
-- Name: aut_tpersn fk_aut_tpersn_ge_tciud; Type: FK CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.aut_tpersn
    ADD CONSTRAINT fk_aut_tpersn_ge_tciud FOREIGN KEY (persn_ciud) REFERENCES ada_db_us.ge_tciud(ciud_ciud);