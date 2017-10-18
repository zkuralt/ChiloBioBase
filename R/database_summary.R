observe({
  uniqSpecies <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Full_name) FROM Species;")
  uniqUsers <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Name, Surname) FROM Users;")
  uniqLocalities <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Locality_id) FROM Locality;")
  uniqRecords <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Specimen_id) FROM Specimen;")
  
  observeEvent(input$submitInput, {
    uniqSpecies <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Full_name) FROM Species;")
    uniqUsers <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Name, Surname) FROM Users;")
    uniqLocalities <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Locality_id) FROM Locality;")
    uniqRecords <- dbGetQuery(conn = con, statement = "SELECT COUNT(DISTINCT Specimen_id) FROM Specimen;")
  })
  
  output$stats <- renderUI({
    fluidRow(
      infoBox(title = "Species", value = uniqSpecies, icon = icon("bug"), color = "olive", width = 3),
      infoBox(title = "Localities", value = uniqLocalities, icon = icon("map-marker"), color = "yellow", width = 3),
      infoBox(title = "Users", value = uniqUsers, icon = icon("group"), color = "light-blue", width = 3),
      infoBox(title = "Records", value = uniqRecords, icon = icon("list"), color = "purple", width = 3),
      infoBox(title = "Most common species", value = "Lithobius stygius", icon = icon("paw"), color = "red", width = 3),
      infoBox(title = "Date range", value = "1. 1. 1900 - 31. 12. 2017", icon = icon("calendar"), color = "maroon", width = 3),
      infoBox(title = "Some statistic", value = "42", icon = icon("university"), color = "green", width = 3),
      infoBox(title = "Some statistic", value = "26", icon = icon("tree"), color = "navy", width = 3)
      
    )
  })
})