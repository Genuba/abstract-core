--
-- Name: ge_tciud fk_ge_tciud_ge_tdepto; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tciud
    ADD CONSTRAINT fk_ge_tciud_ge_tdepto FOREIGN KEY (ciud_depto) REFERENCES ow_base_us.ge_tdepto(depto_depto);