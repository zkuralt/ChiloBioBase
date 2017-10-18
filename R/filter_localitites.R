filteredData <- reactive({
  locality[locality$Altitude >= input$filterAltitude[1] & locality$Altitude <= input$filterAltitude[2],]
})

observe({
  x <- filteredData()
  leafletProxy("map", data = x) %>%
    clearMarkerClusters() %>% 
    addCircleMarkers(group = "Localities",
                     color = "black", 
                     weight = 0.5, 
                     radius = 8, 
                     fill = TRUE, 
                     fillColor = "black", 
                     fillOpacity = 0.7, 
                     popup = x$Locality_Name,
                     clusterOptions = markerClusterOptions(showCoverageOnHover = TRUE, 
                                                           zoomToBoundsOnClick = TRUE))
})