--
-- Name: aut_tsurl fk_aut_tsurl_aut_tservc; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tsurl
    ADD CONSTRAINT fk_aut_tsurl_aut_tservc FOREIGN KEY (surl_servicio) REFERENCES ow_base_us.aut_tservc(servicio_servicio);