observeEvent(input$submitInput , {
  specimen <- data.frame(Species_id = input$species,
                         Sex_id = input$sex,
                         Stage_id = input$stage,
                         Locality_id = input$locality,
                         Survey_id = input$survey,
                         Collection_id = input$collection,
                         Morpho_id = "",
                         Molecular_id = "",
                         User_id = input$user,
                         Entry_Stamp = format(Sys.time(), "%Y%m%d_%H%M"))
  
  dbWriteTable(conn = con,
               name = "Specimen",
               value = specimen,
               append = TRUE)
})