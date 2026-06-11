-- iag-infrastructure-management initial schema (skeleton).
--
-- Domain tables (facilities, utilities, capex projects, maintenance) are added
-- as the infrastructure-management domain is implemented. This migration only
-- establishes a marker so the migration runner and schema are exercised from
-- first boot.
CREATE TABLE IF NOT EXISTS infrastructure_service_meta (
    key        TEXT PRIMARY KEY,
    value      TEXT NOT NULL DEFAULT '',
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO infrastructure_service_meta (key, value)
VALUES ('schema_initialized', NOW()::text)
ON CONFLICT (key) DO NOTHING;
