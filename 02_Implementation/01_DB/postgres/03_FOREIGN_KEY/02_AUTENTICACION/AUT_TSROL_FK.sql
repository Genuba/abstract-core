--
-- Name: aut_tsrol fk_aut_tsrol_aut_trol; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tsrol
    ADD CONSTRAINT fk_aut_tsrol_aut_trol FOREIGN KEY (srol_rol) REFERENCES ow_base_us.aut_trol(rol_rol);

--
-- Name: aut_tsrol fk_aut_tsrol_aut_tservc; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tsrol
    ADD CONSTRAINT fk_aut_tsrol_aut_tservc FOREIGN KEY (srol_servicio) REFERENCES ow_base_us.aut_tservc(servicio_servicio);