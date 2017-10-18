output$image <- renderImage({
    # Generate the jpeg
  jpeg("image.jpg")
  dev.off()
  
  # Return a list containing the filename
  list(src = "image.jpg",
       contentType = 'image/jpeg',
       width = 400,
       height = 400,
       alt = "This is alternate text")
}, deleteFile = TRUE)
