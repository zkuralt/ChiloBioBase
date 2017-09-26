dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Roles(
            Role_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Role VARCHAR(20),
            Privileges VARCHAR(30)
            )")

dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Users(
            User_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Role_id INT,
            Name VARCHAR(40),
            Surname VARCHAR(40),
            Email VARCHAR(50),
            FOREIGN KEY (Role_id) REFERENCES Roles(Role_id)
            )")

dbSendQuery(conn = con, statement =  
              "CREATE TABLE IF NOT EXISTS Species(
            Species_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
            Locality_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
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
            Survey_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Date DATE,
            Sampling_unit VARCHAR(20),
            Collected_by VARCHAR(20)
            )")

dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Collection(
            Collection_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Collection VARCHAR(20),
            Inventary_Number VARCHAR(20),
            Specimen_Type VARCHAR(10),
            Determined_by VARCHAR(10)
            )")

dbSendQuery(conn = con, statement =
              "CREATE TABLE IF NOT EXISTS Morphological_data(
            Morpho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Geophilomorpha_leg_count TINYINT,
            Lithobiomorpha_leg_count TINYINT,
            Scolopendromorpha_leg_count TINYINT,
            Scutigeromorpha_leg_count TINYINT
            )")

dbSendQuery(conn = con, statement =
              "CREATE TABLE IF NOT EXISTS Molecular_data(
            Molecular_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Marker_Type VARCHAR(20),
            Sample_Type VARCHAR(20),
            Sequencing_Type VARCHAR(20),
            Sequence_Length VARCHAR(5),
            Sequence TEXT
            )")

dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Specimen(
            Specimen_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Species_id INT,
            FOREIGN KEY(Species_id) REFERENCES Species(Species_id),
            Sex VARCHAR(10),
            Stage VARCHAR(10),
            Locality_id INT,
            FOREIGN KEY(Locality_id) REFERENCES Locality(Locality_id),
            Survey_id INT,
            FOREIGN KEY(Survey_id) REFERENCES Survey(Survey_id),
            Collection_id INT,
            FOREIGN KEY(Collection_id) REFERENCES Collection(Collection_id),
            Morpho_id INT,
            FOREIGN KEY(Morpho_id) REFERENCES Morphological_data(Morpho_id),
            Molecular_id INT,
            FOREIGN KEY(Molecular_id) REFERENCES Molecular_data(Molecular_id),
            User_id INT,
            FOREIGN KEY(User_id) REFERENCES Users(User_id)
            )")
