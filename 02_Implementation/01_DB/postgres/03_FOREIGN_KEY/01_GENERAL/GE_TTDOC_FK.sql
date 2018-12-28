--
-- Name: ge_ttdoc fk_ge_ttdoc_ge_ttper; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.ge_ttdoc
    ADD CONSTRAINT fk_ge_ttdoc_ge_ttper FOREIGN KEY (tdoc_tper) REFERENCES ow_base_us.ge_ttper(tper_tper);
    
    
