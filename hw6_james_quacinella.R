# Install and load RPostgreSQL module
install.packages("DBI")
install.packages("RPostgreSQL")
library("DBI")
library("RPostgreSQL")

# Initialize a PostGres connection
drv <- dbDriver("PostgreSQL")
con <- dbConnect(drv, dbname="hw6")

# List available tables
dbListTables(con)

# Fetch all the rows from auth_user
rs <- dbSendQuery(con, "select * from auth_user")
fetch(rs, n=-1)

# Fetch all the rows from notification_types (and show no exceptions)
dbGetQuery(con, "select * from notification_types")
dbGetException(con)

# Show that there are no pending result sets
dbListResults(con)

# Fetch all the rows from notification_history
rs <- dbSendQuery(con,"select * from notification_history")
dbColumnInfo(rs)
dbListResults(con)
fetch(dbListResults(con)[[1]])

# Join SQL statement tp flatten out the notification history table
query <- "SELECT notification_history.time_stamp as ts, 
                from_user.email as from_email, from_user.zipcode as from_zipcode, 
                to_user.email as to_email, to_user.zipcode as to_zipcode, 
                notification_types.title as notification_type,
                notification_history.unread as unread
        FROM notification_history
        JOIN auth_user to_user
            ON to_user.id=notification_history.to_user
        JOIN auth_user from_user
            ON from_user.id=notification_history.from_user
        JOIN notification_types 
            ON notification_history.notification_types_id=notification_types.id"
notifications <- dbGetQuery(con, query)
class(notifications)

# Closes the connection
dbDisconnect(con)

# Frees all the resources on the driver
dbUnloadDriver(drv)