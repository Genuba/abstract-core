-- Table: ada_db_ext.nls_parameters

CREATE TABLE ada_db_ext.nls_parameters
(
    nls_territory character varying(128) COLLATE pg_catalog."default" NOT NULL,
    pg_territory_ux character varying(16) COLLATE pg_catalog."default",
    pg_territory_win character varying(128) COLLATE pg_catalog."default",
    params_dictionary jsonb,
    CONSTRAINT aoe_nls_parameters_pk PRIMARY KEY (nls_territory)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE ada_db_ext.nls_parameters
    OWNER to ada_db_us;
COMMENT ON TABLE ada_db_ext.nls_parameters
    IS 'Dictionary to store NLS related params transfered from Oracle';

COMMENT ON COLUMN ada_db_ext.nls_parameters.nls_territory
    IS 'NLS_TERRITORY from Oracle';

COMMENT ON COLUMN ada_db_ext.nls_parameters.pg_territory_ux
    IS 'NLS_TERRITORY stored as part of Unix Locale';

COMMENT ON COLUMN ada_db_ext.nls_parameters.pg_territory_win
    IS 'NLS_TERRITORY stored as part of Windada Locale';

COMMENT ON COLUMN ada_db_ext.nls_parameters.params_dictionary
    IS 'Nested JSON table to store actual parameters values';

-- Index: aoe_nls_territory_ux_idx

-- DROP INDEX ada_db_ext.aoe_nls_territory_ux_idx;

CREATE INDEX aoe_nls_territory_ux_idx
    ON ada_db_ext.nls_parameters USING btree
    (pg_territory_ux COLLATE pg_catalog."default")
    TABLESPACE pg_default;

-- Index: aoe_nls_territory_win_idx

-- DROP INDEX ada_db_ext.aoe_nls_territory_win_idx;

CREATE INDEX aoe_nls_territory_win_idx
    ON ada_db_ext.nls_parameters USING btree
    (pg_territory_win COLLATE pg_catalog."default")
    TABLESPACE pg_default;