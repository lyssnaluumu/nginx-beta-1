-- Active: 1710538810533@@127.0.0.1@5432@test@public

-- Create the table
CREATE TABLE notificationPreferences (
    id INT,
    type VARCHAR(255),
    enabled BOOLEAN,
    time TIME,
    interval INT,
    repetitions INT
);

-- Insert randomly generated data
INSERT INTO notificationPreferences (id, type, enabled, time, interval, repetitions)
VALUES
    (1, 'Reminder', TRUE, '08:00:00', 15, 3),
    (2, 'Alert', FALSE, '12:30:00', 30, 5),
    (3, 'Notification', TRUE, '09:45:00', 10, 2),
    (4, 'Update', FALSE, '17:15:00', 60, 1),
    (5, 'Message', TRUE, '20:00:00', 45, 4),
    (6, 'Warning', FALSE, '22:30:00', 20, 3),
    (7, 'Announcement', TRUE, '07:00:00', 30, 2),
    (8, 'Event', FALSE, '18:45:00', 50, 5),
    (9, 'Alarm', TRUE, '06:30:00', 25, 1),
    (10, 'Reminder', FALSE, '14:15:00', 35, 4);


CREATE TABLE users (
    id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255)
);

INSERT INTO users (id, username, email)
VALUES
    (1, 'user1', 'user1@example.com'),
    (2, 'user2', 'user2@example.com'),
    (3, 'user3', 'user3@example.com'),
    (4, 'user4', 'user4@example.com'),
    (5, 'user5', 'user5@example.com'),
    (6, 'user6', 'user6@example.com'),
    (7, 'user7', 'user7@example.com'),
    (8, 'user8', 'user8@example.com'),
    (9, 'user9', 'user9@example.com'),
    (10, 'user10', 'user10@example.com');

ALTER TABLE notificationPreferences
ADD COLUMN user_id INT,
ADD FOREIGN KEY (user_id) REFERENCES users(id);

UPDATE notificationPreferences
SET user_id = id;  -- This assigns each preference to the user with the same id

DROP TABLE IF EXISTS notificationPreferences;
DROP TABLE IF EXISTS users;

-- Create the users table with unique id_token for each user
CREATE TABLE users (
    id_token CHAR(36) PRIMARY KEY
);

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Insert 10 users with randomly generated id_tokens
INSERT INTO users (id_token)
VALUES
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4()),
    (uuid_generate_v4());

-- Create the notificationPreferences table with user_id as the first column
CREATE TABLE notificationPreferences (
    user_id CHAR(36),
    type VARCHAR(255),
    enabled BOOLEAN,
    time TIME,
    interval INT,
    repetitions INT,
    FOREIGN KEY (user_id) REFERENCES users(id_token)
);

-- Insert randomly generated data into notificationPreferences
-- Insert randomly generated data into notificationPreferences
INSERT INTO notificationPreferences (user_id, type, enabled, time, interval, repetitions)
SELECT id_token, type, enabled, time::time, interval, repetitions
FROM (
    SELECT
        (SELECT id_token FROM users ORDER BY random() LIMIT 1) AS id_token,
        'Reminder' AS type,
        TRUE AS enabled,
        '08:00:00' AS time,
        15 AS interval,
        3 AS repetitions
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Alert', FALSE, '12:30:00', 30, 5
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Notification', TRUE, '09:45:00', 10, 2
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Update', FALSE, '17:15:00', 60, 1
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Message', TRUE, '20:00:00', 45, 4
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Warning', FALSE, '22:30:00', 20, 3
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Announcement', TRUE, '07:00:00', 30, 2
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Event', FALSE, '18:45:00', 50, 5
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Alarm', TRUE, '06:30:00', 25, 1
    UNION ALL
    SELECT (SELECT id_token FROM users ORDER BY random() LIMIT 1), 'Reminder', FALSE, '14:15:00', 35, 4
) AS temp;

COMMENT ON TABLE table_name IS '';
COMMENT ON COLUMN table_name.name IS '';