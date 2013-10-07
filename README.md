IS607 HW6 - Loading Data Into Postgres
==================

Homework 6 for CUNY's IS607 Class: Loading Data into Postgres

Schema
------

The schema I chose for this is something I am working on as a side project: user notifications. The three tables are:

* auth_user - Stores each user record. The schema is self-explanatory
  * time_stamp - Time stamp of user creation
  * first_name
  * last_name
  * email
  * password - OK, don't do this in the real world!
  * zipcode 
* notification_types - The different kind of notification users can get
  * title - Short description of the notification type
  * message - Parameterized message for these kind of notifications
* notification_history - Listing of all notification that have been made
  * time_stamp - Time when notification was created
  * to_user - The user ID of the user being notified
  * from_user - The user ID of the user who is doing the notifying
  * notification_types_id - ID of the notification type
  * unread - Boolean, True if notification is unread by the user

Each table as an auto-incremented primary key called 'id'.

Steps for HW6
-------------

1. Install PostGres
  * Install: `sudo apt-get install postres pgadmin3`
  * Set password on admin accoubt: `sudo -u postgres psql postgres`
  * Create james user:  `sudo -u postgres createuser --superuser james`
2. Create Database
  * Create default db for new user: `sudo -u postgres createdb james`
  * Create hw6 database: `sudo -u postgres createdb hw6`
3. Create three tables
  * Check SCHEMA.sql
4. Populate the three tables with at least 5 rows in each table
  * Check DATA.Sql
5. Write a SQL Select statement that joins information from the tables. 
6. And pull the information from the three tables into an R dataframe.
  * date datatype - notification timestamp
  * two columns with numeric data types - zipcode from user
  * two columns with categorical data types - unread status and notification type
  * Check hw6_james_quacinella.R
7. GitHub repo is at https://github.com/jquacinella/IS607_HW6_Postgres

References 
-----------

1. https://help.ubuntu.com/community/PostgreSQL
2. http://stackoverflow.com/questions/15137550/reference-to-a-sequence-column-postgresql
3. http://stackoverflow.com/questions/3961825/foreign-keys-in-postgresql
4. https://code.google.com/p/rpostgresql/
