#### Fill the infoTabs ####
uniqSpecies <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Genus, Species) FROM Species;")
uniqUsers <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Name, Surname) FROM Users;")
uniqLocalities <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Locality_ID) FROM Locality;")
uniqRecords <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Specimen_ID) FROM Specimen;")
