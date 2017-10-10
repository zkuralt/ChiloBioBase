output$leaflet <- renderLeaflet({
  leaflet() %>% 
    addProviderTiles(providers$Stamen.Terrain,
                     options = providerTileOptions(noWrap = TRUE, detectRetina = TRUE, reuseTiles = TRUE)) %>%
    addScaleBar(position = "bottomleft", scaleBarOptions(metric = TRUE, imperial = FALSE)) %>% 
    setView(lng = 14.815333, lat = 46.119944, zoom = 8)
})

### TO-DO: Enable filtering by Species

filteredData <- reactive({
  locality[locality$Altitude >= input$filterAltitude[1] & locality$Altitude <= input$filterAltitude[2],]
})

observe({
  leafletProxy("leaflet", data = filteredData()) %>%
    clearMarkerClusters() %>% 
    addCircleMarkers(color = "black", 
                     weight = 1, 
                     radius = 5, 
                     fill = TRUE, 
                     fillColor = "black", 
                     fillOpacity = 0.4, 
                     clusterOptions = markerClusterOptions(showCoverageOnHover = TRUE, 
                                                           zoomToBoundsOnClick = TRUE),
                     popup = filteredData()$Locality_Name)
})