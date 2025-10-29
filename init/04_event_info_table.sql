CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE INDEX ON session (user_id);

CREATE TABLE event_info (
    time            TIMESTAMPTZ NOT NULL,
    session_id      INTEGER NOT NULL,
    event_id        INTEGER NOT NULL,
    event_type      INTEGER NOT NULL,
    event_entity_id INTEGER,
    event_value     VARCHAR(512),
    
    FOREIGN KEY (session_id) REFERENCES session (session_id),
    FOREIGN KEY (event_id) REFERENCES event (event_id),
    FOREIGN KEY (event_type) REFERENCES submit (submit_type_id)
);

SELECT create_hypertable('main', 'time');

CREATE INDEX ON main (time DESC, session_id);

CREATE INDEX ON main (event_id, time DESC);

SELECT add_retention_policy('main', INTERVAL '2 year');

ALTER TABLE main SET (timescaledb.compress = true);