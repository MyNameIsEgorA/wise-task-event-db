CREATE TABLE event_type (
    id    INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    event_name  VARCHAR(255) NOT NULL
);

INSERT INTO event_type (event_name)
VALUES
       ('submit'),
       ('node_add'),
       ('node_remove'),
       ('node_color'),
       ('node_value'),
       ('edge_add'),
       ('edge_remove'),
       ('edge_color'),
       ('edge_value');