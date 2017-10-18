observeEvent(input$submitInput , {
  print(input$species)
  specimen <- data.frame(Species_id = input$species,
                         Sex_id = input$sex,
                         Stage_id = input$stage,
                         Locality_id = input$locality,
                         Survey_id = input$survey,
                         Collection_id = input$collection,
                         Morpho_id = input$morpho,
                         Molecular_id = input$molecular,
                         User_id = input$user,
                         Entry_Stamp = format(Sys.time(), "%Y%m%d_%H%M"))
  print(specimen)
  dbWriteTable(conn = con,
               name = "Specimen",
               value = specimen,
               append = TRUE)
})