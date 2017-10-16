## https://stackoverflow.com/questions/9853586/how-can-i-join-multiple-sql-tables-using-the-ids ##
observeEvent(input$sendCustomQuery, {
  statement <- input$sqlQuery
  if (nchar(statement) > 0) {
    output$queryResult <- DT::renderDataTable({
      x <- dbGetQuery(conn = con, statement = statement)
      DT::datatable(x, extensions = "Buttons",
                    rownames = FALSE,
                    options = list(scrolX = TRUE, 
                                   pageLength = 15, 
                                   dom = "Bfrtip",
                                   buttons = c("copy", "csv", "excel")))
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

observeEvent(input$sendQuickQuery, {
  species <- input$speciesQuery
  print(species)
  statement <- paste("SELECT * FROM Specimen WHERE Specimen.Species_id =", species, sep = " ")
  if (nchar(statement) > 0) {
    output$queryResult <- DT::renderDataTable({
      x <- dbGetQuery(conn = con, statement = statement)
      DT::datatable(x, extensions = "Buttons",
                    rownames = FALSE,
                    options = list(scrolX = TRUE, 
                                   pageLength = 15, 
                                   dom = "Bfrtip",
                                   buttons = c("copy", "csv", "excel")))
    })
  }
  
  if (nchar(statement) > 0) {
    output$displayQuery <- renderUI({
      # downloadButton(outputId = "downloadCSV", label = "Download data", icon = icon("download"))
      dataTableOutput("queryResult")
    })
  } else {
    output$displayQuery <- renderUI({
      h4("There is no query results to display")
    })
  }
})