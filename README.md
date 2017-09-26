# ChiloBioBase 2.0

In order for this app to work you need a creds.R file with structure displayed below.

### creds.R ###

con <- dbConnect(RMariaDB::MariaDB(), 
                 username = "user",
                 dbname = "database", 
                 password = "password",
                 host = "00.000.000.00")

