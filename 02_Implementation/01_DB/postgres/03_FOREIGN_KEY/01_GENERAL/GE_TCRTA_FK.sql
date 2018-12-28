--
-- Name: ge_tcrta fk_ge_tcrta_ge_tprcs; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_tcrta
    ADD CONSTRAINT fk_ge_tcrta_ge_tprcs FOREIGN KEY (crta_prcs) REFERENCES ow_base_us.ge_tprcs(prcs_prcs);