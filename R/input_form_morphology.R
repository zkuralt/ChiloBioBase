output$ordoOut <- renderUI({
  species <- input$species
  
  if (nchar(species) == 0 ) { 
    out <- box(title = "Morphological data input", solidHeader = TRUE, collapsible = TRUE, collapsed = FALSE,
               h5("Select species first")
    )
    
  } else {
    
    statement <- paste("SELECT Species.Ordo FROM Species WHERE Species_id = ", species, ";", sep = "")
    ordo <- dbGetQuery(conn = con, statement = statement)
    
    if (ordo %in% "Lithobiomorpha") {
      source("./R/lithobio_morpho.R", local = TRUE)
    }
    
    if (ordo %in% "Geophilomorpha") {
      source("./R/geophilo_morpho.R", local = TRUE)
    }
    
    if (ordo %in% "Scolopendromorpha") {
      source("./R/scolopendro_morpho.R", local = TRUE)
    }
    
    if (ordo %in% "Scutigeromorpha") {
      source("./R/scutigero_morpho.R", local = TRUE)
      
    }
    out
  }
})