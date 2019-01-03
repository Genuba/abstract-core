--
-- Name: ge_tciud fk_ge_tciud_ge_tdepto; Type: FK CONSTRAINT; Schema: ada_db_us; Owner: ada_db_us
--

ALTER TABLE ONLY ada_db_us.ge_tciud
    ADD CONSTRAINT fk_ge_tciud_ge_tdepto FOREIGN KEY (ciud_depto) REFERENCES ada_db_us.ge_tdepto(depto_depto);