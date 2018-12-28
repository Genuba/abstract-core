--
-- Name: aut_tservc fk_aut_tservc_aut_tmodul; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tservc
    ADD CONSTRAINT fk_aut_tservc_aut_tmodul FOREIGN KEY (servicio_modulo) REFERENCES ow_base_us.aut_tmodul(modulo_modulo);