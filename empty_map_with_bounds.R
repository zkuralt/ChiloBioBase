# Create empty map with bounds
output$map <- renderLeaflet({
  leaflet(options = leafletOptions(zoomControl = FALSE)) %>% 
    addProviderTiles(provider = providers$Stamen.Terrain,
                     options = providerTileOptions(noWrap = TRUE,
                                                   detectRetina = TRUE,
                                                   reuseTiles = TRUE)) %>% 
    setView(lng = 14.815333, lat = 46.119944, zoom = 8) %>% 
    addLayersControl(
      overlayGroups = "Localities", 
      position = "bottomright",
      options = layersControlOptions(collapsed = FALSE))
})