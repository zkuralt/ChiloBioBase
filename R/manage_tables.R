output$localities <- renderRHandsontable({
  x <- dbGetQuery(conn = con, statement = "SELECT * FROM Locality;")
  rhandsontable(x)
})

output$species <- renderRHandsontable({
  x <- dbGetQuery(conn = con, statement = "SELECT * FROM Species;")
  rhandsontable(x)
})

output$surveys <- renderRHandsontable({
  x <- dbGetQuery(conn = con, statement = "SELECT * FROM Survey;")
  rhandsontable(x)
})