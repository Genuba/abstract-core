--
-- Name: ge_tdepto fk_ge_tdepto_ge_tpais; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tdepto
    ADD CONSTRAINT fk_ge_tdepto_ge_tpais FOREIGN KEY (depto_pais) REFERENCES ow_base_us.ge_tpais(pais_pais);