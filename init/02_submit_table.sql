CREATE TABLE submit (
    submit_type_id   INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    submit_type_name VARCHAR(255) NOT NULL
);

INSERT INTO submit (submit_type_name)
VALUES
        ('correct'),
        ('partial_correct'),
        ('incorrect');