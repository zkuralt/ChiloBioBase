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

#### Prepare data for Quick query ####
    # statement = paste(" SELECT * 
    #                     FROM Specimen 
    #                     JOIN Species
    #                     ON Specimen.Species_id = Species.Species_id
    #                     JOIN Sex
    #                     ON Specimen.Sex_id = Sex.Sex_id
    #                     JOIN Stage
    #                     ON Specimen.Stage_id = Sex.Sex_id
    #                     JOIN Locality
    #                     ON Specimen.Locality_id = Locality.Locality_id
    #                     JOIN Survey
    #                     ON Specimen.Survey_id = Survey.Survey_id
    #                     JOIN Collection
    #                     ON Specimen.Collection_id = Collection.Collection_id
    #                     JOIN Morphological_data
    #                     ON Specimen.Morpho_id = Morphological_data.Morpho_id
    #                     JOIN Molecular_data
    #                     ON Specimen.Molecular_id = Molecular_data(Molecular_id)
    #                     JOIN Users
    #                     ON Specimen.User_id = Users.User_id
    #                     WHERE Species.Species_id =", input$speciesQuery, sep = "")



