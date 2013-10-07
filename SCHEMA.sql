-- Sequence for the auth_user table primary key
DROP SEQUENCE IF EXISTS auth_user_seq CASCADE;
CREATE SEQUENCE auth_user_seq;

-- User table: each row represents a user in the system
-- NOTE: you should never store a plain-text password, this is just an example!!
DROP TABLE IF EXISTS auth_user CASCADE;
CREATE TABLE IF NOT EXISTS auth_user (
  id INTEGER PRIMARY KEY default nextval('auth_user_seq'),
  time_stamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  first_name TEXT NOT NULL ,
  last_name TEXT NOT NULL ,
  email TEXT NOT NULL,
  password TEXT NOT NULL,
  zipcode INTEGER  NOT NULL );
ALTER SEQUENCE auth_user_seq OWNED BY auth_user.id;


-- Sequence for the notification_types table primary key
DROP SEQUENCE IF EXISTS notification_types_seq CASCADE; 
CREATE SEQUENCE notification_types_seq;

-- Notification types: each row represents a 'kind' of notification
DROP TABLE IF EXISTS notification_types CASCADE;
CREATE TABLE IF NOT EXISTS notification_types (
  id INTEGER PRIMARY KEY default nextval('notification_types_seq'),
  title TEXT NOT NULL ,
  message TEXT NOT NULL );
ALTER SEQUENCE notification_types_seq OWNED BY notification_types.id;


-- Sequence for the notification_history table primary key
DROP SEQUENCE IF EXISTS notification_history_seq CASCADE; 
CREATE SEQUENCE notification_history_seq;

-- User Notification table: each row represents a notification from one user to another user in the system
DROP TABLE IF EXISTS notification_history CASCADE;
CREATE TABLE IF NOT EXISTS notification_history (
  id INTEGER PRIMARY KEY default nextval('notification_history_seq'),
  time_stamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  to_user INTEGER NOT NULL REFERENCES auth_user(id) ,
  from_user INTEGER NOT NULL REFERENCES auth_user(id) ,
  notification_types_id INTEGER NOT NULL REFERENCES notification_types(id) ,
  unread BOOLEAN NOT NULL DEFAULT TRUE);
ALTER SEQUENCE notification_history_seq OWNED BY notification_history.id;