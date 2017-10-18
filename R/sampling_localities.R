observe({
  outmap <- leafletProxy(mapId = "map") %>%
  addCircleMarkers(data = locality, group = "Localities") %>%
  addLayersControl(
    overlayGroups = "Localities",
    options = layersControlOptions(collapsed = FALSE)
  )
outmap
})
  