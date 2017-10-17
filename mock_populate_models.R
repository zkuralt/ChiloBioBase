roles <- data.frame(Role = c("Admin", "User", "Guest"),
                    Privileges = c("all", "add", "read-only"))
dbWriteTable(conn = con, 
             name = "Roles",
             value = roles,
             append = TRUE)



users <- data.frame(Name = c("Želodko", "Cofko", "Zobna", "Snežko"),
                    Surname = c("Superca", "Cof", "Miška", "Snežak"),
                    Email = c("zelodko.superca@gmail.com", "cofko.cof@gmail.com", "zobna.miska@gmail.com", "snezko.snezak@gmail.com"),
                    Role_id = c("1", "2", "2", "3"))
dbWriteTable(conn = con, 
             name = "Users",
             value = users,
             append = TRUE)

sex <- data.frame(Sex = c("Male", "Female", "Unknown"))
dbWriteTable(conn = con, name = "Sex", value = sex, append = TRUE)

species <- rbind(data.frame(Genus = "Lithobius",
                           Subgenus = "",
                           Species = "erythrocephalus",
                           Subspecies = "",
                           Full_name = "Lithobius erythrocephalus",
                           Author_name = "C. L. Koch",
                           Author_brackets = "no",
                           Author_year = 1847,
                           Familia = "Lithobiidae",
                           Ordo = "Lithobiomorpha",
                           Synonyms = "Lithobius aleator Verhoeff, 1925;
                                       Lithobius anacaprensis Verhoeff, 1943;
                                       Lithobius armatus Sseliwanoff, 1880;
                                       Lithobius cortinensis Verhoeff, 1937",
                           Habitat = "Psychrophile",
                           Remarks = "Similar to Lithobius stygius and Lithobius agilis"),
                data.frame(Genus = "Lithobius",
                           Subgenus = "",
                           Species = "stygius",
                           Subspecies = "",
                           Full_name = "Lithobius stygius",
                           Author_name = "Latzel",
                           Author_brackets = "no",
                           Author_year = 1880,
                           Familia = "Lithobiidae",
                           Ordo = "Lithobiomorpha",
                           Synonyms = "Lithobius corneliae Stoev, 1997;
                                       Oligobothrus luciani Folkmanová,1935;
                                       Lithobius temnensis Verhoeff, 1943;
                                       Lithobius erythrocephalus cerberi Verhoeff, 1943;
                                       Lithobius stygius infernus Loksa, 1943;
                                       Lithobius stygius intermedius Folkmanová, 1946;
                                       Lithobius stygius mazerollensis Verhoeff, 1937",
                           Habitat = "Troglobiont",
                           Remarks = "Similar to Lithobius erythrocephalus"),
                data.frame(Genus = "Lithobius",
                           Subgenus = "Lithobius",
                           Species = "forficatus",
                           Subspecies = "sketii",
                           Full_name = "Lithobius forficatus sketii",
                           Author_name = "Linnaeus",
                           Author_brackets = "yes",
                           Author_year = 1758,
                           Familia = "Lithobiidae",
                           Ordo = "Lithobiomorpha",
                           Synonyms = "",
                           Habitat = "",
                           Remarks = ""),
                data.frame(Genus = "Schendyla",
                           Subgenus = "",
                           Species = "carniolensis",
                           Subspecies = "",
                           Full_name = "Schendyla carniolensis",
                           Author_name = "Verhoef",
                           Author_brackets = "no",
                           Author_year = 1902,
                           Familia = "Schendylidae",
                           Ordo = "Geophilomorpha",
                           Synonyms = "Poabius bistriatus C.L. Koch,1847;
                                       Schendyla tesselata Verhoeff, 1943;
                                       Schendyla zonalis Brölemann & Ribaut, 1911;
                                       Schendyla carniolensis clausensis Verhoeff, 1938;
                                       Schendyla carniolensis nivalis Verhoeff, 1938;
                                       Schendyla carniolensis ormeana Verhoeff, 1938;
                                       Schendyla nemorensis quarnerana Verhoeff, 1937",
                           Habitat = "",
                           Remarks = ""),
                data.frame(Genus = "Schendyla",
                           Subgenus = "",
                           Species = "armata",
                           Subspecies = "",
                           Full_name = "Schendyla armata",
                           Author_name = "Brölemann",
                           Author_brackets = "no",
                           Author_year = 1902,
                           Familia = "Schendylidae",
                           Ordo = "Geophilomorpha",
                           Synonyms = "Brachyschendyla armata broelemanni (Verhoeff,1934)",
                           Habitat = "",
                           Remarks = ""))
dbWriteTable(conn = con, 
             name = "Species",
             value = species,
             append = TRUE)

survey <- data.frame(Date = Sys.Date(),
                     Sampling_unit = "6",
                     Collected_by = "Franko Frkić")
dbWriteTable(conn = con,
             name = "Survey",
             value = survey,
             append = TRUE)

collection <- data.frame(Collection = "Oddelek za biologijo",
                         Inventary_Number = "12345",
                         Specimen_Type = "AP",
                         Determined_by = "Ivan Kos")
dbWriteTable(conn = con,
             name = "Collection",
             value = collection,
             append = TRUE)

morpho <- data.frame(Geophilomorpha_leg_count = 165,
                     Lithobiomorpha_leg_count = 15,
                     Scolopendromorpha_leg_count = 21,
                     Scutigeromorpha_leg_count = 15)
dbWriteTable(conn = con,
             name = "Morphological_data",
             value = morpho,
             append = TRUE)

molecular <- data.frame(Marker_Type = "CO1",
                        Sample_Type = "leg tissue",
                        Sequencing_Type = "Sanger",
                        Sequence_Length = 635,
                        Sequence = "agtctcgtaaaaactgct")
dbWriteTable(conn = con,
             name = "Molecular_data",
             value = molecular,
             append = TRUE)

habitat <- data.frame(Habitat_type = c("Deciduous forest", "Wetland", "Meadow", "Karstic meadow", "Mixed forest"))
dbWriteTable(conn = con, name = "Habitat", value = habitat, append = TRUE)

stage <- data.frame(Stage = c("Instar 1", "Instar 2", "Instar 3", "Instar 4", "Adult"))
dbWriteTable(conn = con, name = "Stage", value = stage, append = TRUE)

utm <- data.frame(UTM_grid = c("VL10", "VL11", "VL12", "VL01"))
dbWriteTable(conn = con, name = "UTM", value = utm, append = TRUE)

origproj <- data.frame(Original_Projection = c("EPSG:3912", "EPSG:5001", "EPSG:3567"))
dbWriteTable(conn = con, name = "Original_Projection", value = origproj, append = TRUE)

country <- data.frame(Country = c("Slovenia", "Croatia", "Austria", "Italy"))
dbWriteTable(conn = con, name = "Country", value = country, append = TRUE)

ecosystem <- data.frame(Ecosystem = c("Forest", "Wetland", "Karst", "Hochkarst"))
dbWriteTable(conn = con, name = "Ecosystem", value = ecosystem, append = TRUE)

bedrock <- data.frame(Bedrock = c("Limestone", "Dolomite", "Vulcanic"))
dbWriteTable(conn = con, name = "Bedrock", value = bedrock, append = TRUE)

localities <- rbind(data.frame(Locality_Name = "Oddelek za biologijo",
                               Locality_PlaceNear = "Ljubljana",
                               Locality_OtherNames = "Faks",
                               Country_id = 1,
                               Original_X = 100921.93,
                               Original_Y = 459385.72,
                               Original_Projection_id = 1,
                               Latitude = 46.05120,
                               Longitude = 14.47035,
                               Accuracy = "1",
                               UTM_id = 1,
                               Altitude = 296,
                               Ecosystem_id = 2,
                               Habitat_id = 5,
                               Bedrock_id = 3),
                    data.frame(Locality_Name = "Glažuta",
                               Locality_PlaceNear = "Grčarice",
                               Locality_OtherNames = "",
                               Country_id = 1,
                               Original_X = 58605.64 ,
                               Original_Y = 475930.25,
                               Original_Projection_id = 2,
                               Latitude = 45.671244,
                               Longitude = 14.686290,
                               Accuracy = "1",
                               UTM_id = 3,
                               Altitude = 761,
                               Ecosystem_id = 4,
                               Habitat_id = 2,
                               Bedrock_id = 1),
                    data.frame(Locality_Name = "Mala lazna",
                               Locality_PlaceNear = "Trnovski gozd",
                               Locality_OtherNames = "",
                               Country_id = 1,
                               Original_X = 93582.17,
                               Original_Y = 409345.69,
                               Original_Projection_id = 1,
                               Latitude = 45.980349,
                               Longitude = 13.825210,
                               Accuracy = "1",
                               UTM_id = 2,
                               Altitude = 1094,
                               Ecosystem_id = 1,
                               Habitat_id = 1,
                               Bedrock_id = 1))

dbWriteTable(conn = con, 
             name = "Locality",
             value = localities,
             append = TRUE)


specimen <- rbind(data.frame(Species_id = 1,
                       Sex_id = 1,
                       Stage_id = 2,
                       Locality_id = 2,
                       Survey_id = 1,
                       Collection_id = 1,
                       Morpho_id = 1,
                       Molecular_id = 1,
                       User_id = 2,
                       Entry_Stamp = format(Sys.time(), "%Y%m%d_%H%M")),
                  data.frame(Species_id = 2,
                             Sex_id = 3,
                             Stage_id = 1,
                             Locality_id = 3,
                             Survey_id = 1,
                             Collection_id = 1,
                             Morpho_id = 1,
                             Molecular_id = 1,
                             User_id = 4,
                             Entry_Stamp = format(Sys.time(), "%Y%m%d_%H%M")),
                  data.frame(Species_id = 4,
                             Sex_id = 2,
                             Stage_id = 4,
                             Locality_id = 1,
                             Survey_id = 1,
                             Collection_id = 1,
                             Morpho_id = 1,
                             Molecular_id = 1,
                             User_id = 4,
                             Entry_Stamp = format(Sys.time(), "%Y%m%d_%H%M"))
)
dbWriteTable(conn = con,
             name = "Specimen",
             value = specimen,
             append = TRUE)

