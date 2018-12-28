--
-- Name: aut_trsin fk_aut_trsin_aut_trol; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_trsin
    ADD CONSTRAINT fk_aut_trsin_aut_trol FOREIGN KEY (rsin_rol) REFERENCES ow_base_us.aut_trol(rol_rol);

--
-- Name: aut_trsin fk_aut_trsin_aut_tservc; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_trsin
    ADD CONSTRAINT fk_aut_trsin_aut_tservc FOREIGN KEY (rsin_servicio) REFERENCES ow_base_us.aut_tservc(servicio_servicio);
