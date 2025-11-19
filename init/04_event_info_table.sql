CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE INDEX ON session (user_id);

CREATE TABLE event_info (
    time            TIMESTAMPTZ NOT NULL,
    session_id      INTEGER NOT NULL,
    event_id        INTEGER NOT NULL,
    event_type      INTEGER NOT NULL,
    event_entity_id INTEGER,
    event_value     VARCHAR(1024),
    
    FOREIGN KEY (session_id) REFERENCES session (session_id),
    FOREIGN KEY (event_id) REFERENCES event (event_id),
    FOREIGN KEY (event_type) REFERENCES submit (submit_type_id)
);

SELECT create_hypertable('event_info', 'time');

CREATE INDEX ON event_info (time DESC, session_id);

CREATE INDEX ON event_info (event_id, time DESC);

SELECT add_retention_policy('event_info', INTERVAL '2 year');

ALTER TABLE event_info SET (timescaledb.compress = true);