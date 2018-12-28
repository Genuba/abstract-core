--
-- Name: aut_ttoken fk_aut_ttoken_aut_tusuario; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_ttoken
    ADD CONSTRAINT fk_aut_ttoken_aut_tusuario FOREIGN KEY (token_usuario) REFERENCES ow_base_us.aut_tusuario(usuario_usuario);