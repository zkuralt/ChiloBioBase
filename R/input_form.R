observe({
  disable(id = "submitInput")
  toggleState(id = "submitInput", condition = (nchar(input$user) > 0))
})  

observeEvent(input$submitInput , {
  specimen <- data.frame(Species_id = input$species,
                         Locality_id = input$locality,
                         Survey_id = input$survey,
                         Collection_id = input$collection,
                         Sex_id = input$sex,
                         Stage_id = 2,
                         Morpho_id = 1,
                         Molecular_id = 1,
                         User_id = 2,
                         Entry_Stamp = Sys.time())
  
  dbWriteTable(conn = con,
               name = "Specimen",
               value = specimen,
               append = TRUE)
  shinyjs::alert("Input recorded!")
})

observeEvent(input$resetForm, {
  reset("inputForm")
})