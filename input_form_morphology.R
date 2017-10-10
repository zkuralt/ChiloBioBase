output$ordoOut <- renderUI({
  ordo <- input$ordo
  if (ordo %in% "") {
    out <- h5("Select ordo")
  }
  
  if (ordo %in% "Lithobiomorpha") {
    out  <- h5("Lithobiomorpha")
  }
  
  if (ordo %in% "Geophilomorpha") {
    out  <- h5("Geophilomorpha")
  }
  
  if (ordo %in% "Scolopendromorpha") {
    out  <- h5("Scolopendromorpha")
  }
  
  if (ordo %in% "Scutigeromorpha") {
    out  <- h5("Scutigeromorpha")
  }
  out
})