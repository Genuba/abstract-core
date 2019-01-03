--
-- Name: ge_tdepto fk_ge_tdepto_ge_tpais; Type: FK CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.ge_tdepto
    ADD CONSTRAINT fk_ge_tdepto_ge_tpais FOREIGN KEY (depto_pais) REFERENCES ada_db_us.ge_tpais(pais_pais);