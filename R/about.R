#### Fill the infoTabs ####
uniqSpecies <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Full_name) FROM Species;")
uniqUsers <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Name, Surname) FROM Users;")
uniqLocalities <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Locality_id) FROM Locality;")
uniqRecords <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Specimen_id) FROM Specimen;")
