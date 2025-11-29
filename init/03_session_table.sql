CREATE TABLE session (
    id UUID NOT NULL PRIMARY KEY,
    user_id UUID NOT NULL,
    task_id UUID NOT NULL,
    created_at timestamp default current_timestamp
);