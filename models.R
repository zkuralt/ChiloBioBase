dbSendQuery(conn = con, statement = 
              "CREATE TABLE IF NOT EXISTS Users(
            id INT NOT NULL AUTO_INCREMENT,
            Name VARCHAR(40),
            Surname VARCHAR(40),
            Email VARCHAR(50),
            Role VARCHAR(20),
            PRIMARY KEY(id)
)")

