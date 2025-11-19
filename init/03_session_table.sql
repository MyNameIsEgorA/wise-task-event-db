CREATE TABLE session (
    session_id INTEGER NOT NULL PRIMARY KEY,
    user_id UUID NOT NULL,
    task_id UUID NOT NULL
);