observeEvent(input$submitInput , {
  specimen <- data.frame(Species_id = input$species,
                         Sex_id = input$sex,
                         Stage_id = input$stage,
                         Locality_id = input$locality,
                         Survey_id = input$survey,
                         Collection_id = input$collection,
                         Morpho_id = NULL,
                         Molecular_id = NULL,
                         User_id = input$user,
                         Entry_Stamp = "now")
  print(specimen)
  dbWriteTable(conn = con,
               name = "Specimen",
               value = specimen,
               append = TRUE)
})