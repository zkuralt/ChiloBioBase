## https://stackoverflow.com/questions/9853586/how-can-i-join-multiple-sql-tables-using-the-ids ##
# Custom query
observeEvent(input$sendCustomQuery, {
  statement <- input$sqlQuery
  if (nchar(statement) > 0) {
    output$queryResult <- DT::renderDataTable({
      x <- dbGetQuery(conn = con, statement = statement)
      DT::datatable(x, extensions = "Buttons",
                    rownames = FALSE,
                    options = list(scrolX = TRUE, 
                                   pageLength = 15, 
                                   dom = 'Bfrtip', 
                                   buttons = I('colvis')))
    })
  }
  
  if (nchar(statement) > 0) {
    output$displayQuery <- renderUI({
      dataTableOutput("queryResult")
    })
  } else {
    output$displayQuery <- renderUI({
      h4("There is no query results to display")
    })
  }
})

# Quick query
observeEvent(input$sendQuickQuery, {
  species <- input$speciesQuery
  statement <- paste("SELECT Species.Genus, Species.Species, Locality.Locality_name, Sex.Sex,
                         Stage.Stage, Survey.Date, Collection.Collection, Users.Name
                         FROM Specimen 
                         JOIN Species
                         ON Specimen.Species_id = Species.Species_id
                         JOIN Sex
                         ON Specimen.Sex_id = Sex.Sex_id
                         JOIN Stage
                         ON Specimen.Stage_id = Stage.Stage_id
                         JOIN Locality
                         ON Specimen.Locality_id = Locality.Locality_id
                         JOIN Survey
                         ON Specimen.Survey_id = Survey.Survey_id
                         JOIN Collection
                         ON Specimen.Collection_id = Collection.Collection_id
                         JOIN Users
                         ON Specimen.User_id = Users.User_id
                         WHERE Species.Species_id =", species, sep = " ")
  
  if (nchar(statement) > 0) {
    output$queryResult <- DT::renderDataTable({
      x <- dbGetQuery(conn = con, statement = statement)
      DT::datatable(x, extensions = "Buttons",
                    rownames = FALSE,
                    options = list(scrolX = TRUE, 
                                   pageLength = 15, 
                                   dom = 'Bfrtip', 
                                   buttons = I('colvis')))
    })
  }
  
  if (nchar(statement) > 0) {
    output$displayQuery <- renderUI({
      downloadButton(outputId = "downloadCSV", label = "Download data", icon = icon("download"))
      dataTableOutput("queryResult")
    })
  } else {
    output$displayQuery <- renderUI({
      h4("There is no query results to display")
    })
  }
})