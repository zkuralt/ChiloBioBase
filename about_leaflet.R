output$leaflet <- renderLeaflet({
  leaflet() %>% 
    addProviderTiles(providers$Stamen.Terrain,
                     options = providerTileOptions(noWrap = TRUE, detectRetina = TRUE, reuseTiles = TRUE)) %>%
    addScaleBar(position = "bottomleft", scaleBarOptions(metric = TRUE, imperial = FALSE)) %>% 
    setView(lng = 14.815333, lat = 46.119944, zoom = 8)
})

### TO-DO: Enable filtering by Species

