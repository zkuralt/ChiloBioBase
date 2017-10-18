#### Prepare data for selectInput ####
nSpecimens <- as.integer(dbGetQuery(conn = con, statement = "SELECT COUNT(*) FROM Specimen;")[1, 1])
newSpecimen <- paste("Specimen id:", (nSpecimens + 1), sep = " ")
Species <- dbReadTable(conn = con, name = "Species")
Species$newname <- paste(Species$Genus, 
                         Species$Species, 
                         ifelse (Species$Subspecies == "", 
                                 Species$Subspecies, 
                                 paste(Species$Subspecies)))
speciesList <- Species$Species_id
names(speciesList) <- Species$newname
speciesList <- c(" " = "", speciesList)

ordoList <- unique(Species$Ordo)
ordoList <- c(" " = "", ordoList)

users <- dbReadTable(conn = con, name = "Users")
users$newname <- paste(users$Name, users$Surname)
userList <- users$User_id
names(userList) <- users$newname
userList <- c(" " = "", userList)

locality <- dbReadTable(conn = con, name = "Locality")
localityList <- locality$Locality_id
names(localityList) <- locality$Locality_Name
localityList <- c(" " = "", localityList)

collection <- dbReadTable(conn = con, name = "Collection")
collectionList <- collection$Collection_id
names(collectionList) <- collection$Collection
collectionList <- c(" " = "", collectionList)

survey <- dbReadTable(conn = con, name = "Survey")
surveyList <- survey$Survey_id
names(surveyList) <- survey$Sampling_unit
surveyList <- c(" " = "", surveyList)

habitat <- dbReadTable(conn = con, name = "Habitat")
habitatList <- habitat$Habitat_id
names(habitatList) <- habitat$Habitat_type
habitatList <- c(" " = "", habitatList)

stage <- dbReadTable(conn = con, name = "Stage")
stageList <- stage$Stage_id
names(stageList) <- stage$Stage
stageList <- c(" " = "", stageList)

sex <- dbReadTable(conn = con, name = "Sex")
sexList <- sex$Sex_id
names(sexList) <- sex$Sex
sexList <- c(" " = "", sexList)



