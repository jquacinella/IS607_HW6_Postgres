-- List of example users
INSERT INTO auth_user (first_name, last_name, email, password, zipcode) VALUES ('James','Q','nobody@email.com', '1234', 55555);
INSERT INTO auth_user (first_name, last_name, email, password, zipcode) VALUES ('L','User','lameo@email.com', '1234', 55554);
INSERT INTO auth_user (first_name, last_name, email, password, zipcode) VALUES ('James','Scott','james.scott@email.com', '1234', 55553);
INSERT INTO auth_user (first_name, last_name, email, password, zipcode) VALUES ('Peter','Griffin','pgriffin@email.com', '1234', 55552);
INSERT INTO auth_user (first_name, last_name, email, password, zipcode) VALUES ('The','Batman','nananananana@email.com', '1234', 55551);

-- The type of notifications users can get
INSERT INTO notification_types (title, message) VALUES ('message notification', '%(name)s sent you a message');
INSERT INTO notification_types (title, message) VALUES ('friend request', '%(name)s wants to be your friend');
INSERT INTO notification_types (title, message) VALUES ('like', '%(name)s liked your post');
INSERT INTO notification_types (title, message) VALUES ('wall posting', '%(name)s posted on your wall');
INSERT INTO notification_types (title, message) VALUES ('picture posting', '%(name)s posted a photo of you');

-- User 1 is notified about user 2's message, and is currently unread
INSERT INTO notification_history (to_user, from_user, notification_types_id, unread) VALUES (1, 2, 1, TRUE);
-- User 2 is notified about user 3's message, and is currently unread
INSERT INTO notification_history (to_user, from_user, notification_types_id, unread) VALUES (2, 3, 1, TRUE);
-- User 4 is notified about user 5's friend request, and is currently read
INSERT INTO notification_history (to_user, from_user, notification_types_id, unread) VALUES (4, 5, 2, FALSE);
-- User 1 is notified about user 4's friend request, and is currently read
INSERT INTO notification_history (to_user, from_user, notification_types_id, unread) VALUES (1, 4, 2, FALSE);
-- User 2 is notified about user 1's picture being posted, and is currently unread
INSERT INTO notification_history (to_user, from_user, notification_types_id, unread) VALUES (2, 1, 5, TRUE);