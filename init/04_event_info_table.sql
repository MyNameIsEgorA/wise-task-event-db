CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE INDEX ON session (user_id);

CREATE TABLE event (
    id              UUID NOT NULL,
    created_at      TIMESTAMPTZ NOT NULL default current_timestamp,
    session_id      UUID NOT NULL,
    event_type_id   INTEGER NOT NULL,
    event_entity_id INTEGER,
    event_value     VARCHAR(1024),
    
    FOREIGN KEY (session_id) REFERENCES session (id),
    FOREIGN KEY (event_type_id) REFERENCES event_type (id)
);

SELECT create_hypertable('event', 'created_at');

CREATE INDEX ON event (created_at DESC, session_id);

CREATE INDEX ON event (event_type_id, created_at DESC);

SELECT add_retention_policy('event', INTERVAL '2 year');

ALTER TABLE event SET (timescaledb.compress = true);