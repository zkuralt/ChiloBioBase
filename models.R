dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Users(
            user_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Name VARCHAR(40),
            Surname VARCHAR(40),
            Email VARCHAR(50),
            Role VARCHAR(20)
            )")

dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Roles(
            role_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Role VARCHAR(20),
            Privileges VARCHAR(50)
            )")

dbSendQuery(conn = con, statement =  
              "CREATE TABLE IF NOT EXISTS Species(
            spec_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Genus VARCHAR(20),
            Subgenus VARCHAR(20),
            Species VARCHAR(20),
            Subspecies VARCHAR(20),
            Author_name VARCHAR(20),
            Author_brackets VARCHAR(10),
            Author_year YEAR(4),
            Familia VARCHAR(20),
            Ordo VARCHAR(20),
            Synonyms VARCHAR(100),
            Habitat VARCHAR(50),
            Remarks VARCHAR(100)
            )")

dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Locality(
            loc_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Locality_Name VARCHAR(30),
            Locality_PlaceNear VARCHAR(30),
            Locality_OtherNames VARCHAR(30),
            Country VARCHAR(20),
            Original_X DECIMAL(8,2),
            Original_Y DECIMAL(8,2),
            Original_Projection VARCHAR(30),
            Latitude DECIMAL(8,6),
            Longitude DECIMAL(8,6),
            Accuracy TINYINT,
            UTM_grid VARCHAR(10),
            Altitude SMALLINT,
            Ecosystem VARCHAR(30),
            Habitat_type VARCHAR(30),
            Bedrock VARCHAR(30)
            )")

dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Survey(
            survey_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Date DATE,
            Sampling_unit VARCHAR(20),
            Collector VARCHAR(20)
            )")


















