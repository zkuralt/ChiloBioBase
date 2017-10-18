dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Roles(
            Role_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Role VARCHAR(20),
            Privileges VARCHAR(30)
            )"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Habitat(
            Habitat_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Habitat_type VARCHAR(20)
)"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Sex(
            Sex_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Sex VARCHAR(10)
              )"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Stage(
      Stage_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      Stage VARCHAR(10)
                        )"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS UTM(
                          UTM_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          UTM_grid VARCHAR(10)
)"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Original_Projection(
                          Original_Projection_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          Original_Projection VARCHAR(10)
)"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Country(
                          Country_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          Country VARCHAR(40)
)"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Ecosystem(
                          Ecosystem_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          Ecosystem VARCHAR(40)
)"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Bedrock(
                          Bedrock_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          Bedrock VARCHAR(40)
)"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Users(
            User_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Role_id INT,
            Name VARCHAR(40),
            Surname VARCHAR(40),
            Email VARCHAR(50),
            Last_Seen DATETIME, 
            FOREIGN KEY (Role_id) REFERENCES Roles(Role_id)
            )"))

dbClearResult(dbSendQuery(conn = con, statement =  
                            "CREATE TABLE IF NOT EXISTS Species(
            Species_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Genus VARCHAR(20),
            Subgenus VARCHAR(20),
            Species VARCHAR(20),
            Subspecies VARCHAR(20),
            Full_name VARCHAR(100),
            Author_name VARCHAR(20),
            Author_brackets VARCHAR(10),
            Author_year SMALLINT,
            Familia VARCHAR(20),
            Ordo VARCHAR(20),
            Synonyms TEXT,
            Habitat VARCHAR(50),
            Remarks VARCHAR(100)
            )"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Locality(
            Locality_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Locality_Name VARCHAR(30),
            Locality_PlaceNear VARCHAR(30),
            Locality_OtherNames VARCHAR(30),
            Country_id INT,
            FOREIGN KEY (Country_id) REFERENCES Country(Country_id),
            Original_X DECIMAL(8,2),
            Original_Y DECIMAL(8,2),
            Original_Projection_id INT,
            FOREIGN KEY (Original_Projection_id) REFERENCES Original_Projection(Original_Projection_id),
            Latitude DECIMAL(8,6),
            Longitude DECIMAL(8,6),
            Accuracy TINYINT,
            UTM_id INT,
            FOREIGN KEY(UTM_id) REFERENCES UTM(UTM_id),
            Altitude SMALLINT,
            Ecosystem_id INT,
            FOREIGN KEY (Ecosystem_id) REFERENCES Ecosystem(Ecosystem_id),
            Habitat_id INT,
            FOREIGN KEY (Habitat_id) REFERENCES Habitat(Habitat_id),
            Bedrock_id INT,
            FOREIGN KEY (Bedrock_id) REFERENCES Bedrock(Bedrock_id)
            )"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Survey(
            Survey_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Date DATE,
            Sampling_unit VARCHAR(20),
            Collected_by VARCHAR(20)
            )"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Collection(
            Collection_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Collection VARCHAR(20),
            Inventary_Number VARCHAR(20),
            Specimen_Type VARCHAR(10),
            Determined_by VARCHAR(10)
            )"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Morphological_data(
                          Morpho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                          Geophilo_id INT,
                          Lithobio_id INT,
                          Scolopendro_id INT,
                          Scutigero_id INT
                      
)"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Geophilo_morpho(
            Morpho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Leg_count TINYINT
            )"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Lithobio_morpho(
            Morpho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Leg_count TINYINT
            )"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Scutigero_morpho(
            Morpho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Leg_count TINYINT
            )"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Scolopendro_morpho(
            Morpho_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Leg_count TINYINT
            )"))

dbClearResult(dbSendQuery(conn = con, statement =
                            "CREATE TABLE IF NOT EXISTS Molecular_data(
            Molecular_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Marker_Type VARCHAR(20),
            Sample_Type VARCHAR(20),
            Sequencing_Type VARCHAR(20),
            Sequence_Length VARCHAR(5),
            Sequence TEXT
            )"))

dbClearResult(dbSendQuery(conn = con, statement = 
                            "CREATE TABLE IF NOT EXISTS Specimen(
            Specimen_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
            Species_id INT,
            FOREIGN KEY(Species_id) REFERENCES Species(Species_id),
            Sex_id INT,
            FOREIGN KEY(Sex_id) REFERENCES Sex(Sex_id),
            Stage_id INT,
            FOREIGN KEY (Stage_id) REFERENCES Stage(Stage_id),
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
            FOREIGN KEY(User_id) REFERENCES Users(User_id),
            Entry_Stamp DATETIME
            )"))
