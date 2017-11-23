output$image <- renderImage({
  list(
    src = "pictures/sample.jpg",
    contentType = "image/jpg",
    alt = "Sample")
}, deleteFile = FALSE, )
