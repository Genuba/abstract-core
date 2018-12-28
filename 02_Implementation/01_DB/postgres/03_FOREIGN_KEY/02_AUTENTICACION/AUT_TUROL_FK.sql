--
-- Name: aut_turol fk_aut_turol_aut_trol; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_turol
    ADD CONSTRAINT fk_aut_turol_aut_trol FOREIGN KEY (urol_rol) REFERENCES ow_base_us.aut_trol(rol_rol);

--
-- Name: aut_turol fk_aut_turol_aut_tusuario; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_turol
    ADD CONSTRAINT fk_aut_turol_aut_tusuario FOREIGN KEY (urol_usuario) REFERENCES ow_base_us.aut_tusuario(usuario_usuario);