--
-- Name: aut_tpersn fk_aut_tpersn_ge_tciud; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tpersn
    ADD CONSTRAINT fk_aut_tpersn_ge_tciud FOREIGN KEY (persn_ciud) REFERENCES ow_base_us.ge_tciud(ciud_ciud);