--
-- Name: aut_tusuario fk_aut_tusuario_aut_tpersn; Type: FK CONSTRAINT; Schema: ow_base_us; Owner: ow_base_us
--

ALTER TABLE ONLY ow_base_us.aut_tusuario
    ADD CONSTRAINT fk_aut_tusuario_aut_tpersn FOREIGN KEY (usuario_persn) REFERENCES ow_base_us.aut_tpersn(persn_persn);

