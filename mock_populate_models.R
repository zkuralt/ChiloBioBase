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

species<- rbind(data.frame(Genus = "Lithobius",
                           Subgenus = "",
                           Species = "erythrocephalus",
                           Subspecies = "",
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
