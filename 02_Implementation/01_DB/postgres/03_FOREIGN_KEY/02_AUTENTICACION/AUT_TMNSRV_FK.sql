--
-- Name: aut_tmnsrv fk_aut_tmser_aut_tmenu; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tmnsrv
    ADD CONSTRAINT fk_aut_tmser_aut_tmenu FOREIGN KEY (mser_menu) REFERENCES ow_base_us.aut_tmenu(menu_menu);

--
-- Name: aut_tmnsrv fk_aut_tmser_aut_tservc; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tmnsrv
    ADD CONSTRAINT fk_aut_tmser_aut_tservc FOREIGN KEY (mser_servicio) REFERENCES ow_base_us.aut_tservc(servicio_servicio);
