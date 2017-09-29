speciesList <- dbReadTable(conn = con, name = "Species")
speciesList$newname <- paste(speciesList$Genus, 
                                          speciesList$Species, 
                                          ifelse (speciesList$Subspecies == "", 
                                                  speciesList$Subspecies, 
                                                  paste(speciesList$Subspecies)))
specList <- speciesList$Species_id
names(specList) <- speciesList$newname
specList <- c(" " = "", specList)
ordoList <- unique(speciesList$Ordo)

users <- dbReadTable(conn = con, name = "Users")
users$newname <- paste(users$Name, users$Surname)
userList <- users$User_id
names(userList) <- users$newname
userList <- c(" " = "", userList)

localityList <- dbReadTable(conn = con, name = "Locality")
locList <- localityList$

habitatTypes <- data.frame("Habitat type" = c("cave", "thermophilic", "psychrophilic"))

sexList <- data.frame(Sex = c("", "Male", "Female", "Indistinguishable"))

