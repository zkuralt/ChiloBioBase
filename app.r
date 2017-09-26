# Load needed packages
library(shiny)
library(shinydashboard)

# Formatting header. Need to look into the dropdown menus.
header <- dashboardHeader(title = "ChiloBioBase 2.0",
                          dropdownMenu(type = "notifications",
                                       notificationItem(
                                         text = "4 records added today",
                                         icon("exclamation-triangle"))),
                          dropdownMenu(type = "tasks",
                                       taskItem(value = 0, color = "red", "Importing existing flatfile database"),
                                       taskItem(value = 4, color = "blue", "Setting up the database"),
                                       taskItem(value = 100, color = "green", "Records waiting for confirmation")))

# Formatting sidebar. What would be the most practical structure of it?
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("About database", tabName = "about", icon = icon("database")),
    menuItem("Data input", tabName = "input", icon = icon("plus-circle")),
    menuItem("View data", tabName = "view", icon = icon("eye")),
    menuItem("Build query", tabName = "query", icon = icon("filter")),
    menuItem("Tables", tabName = "tables", icon = icon("sitemap"))
  )
)

# Formatting page body. Not quite there yet ...
body <- dashboardBody()

ui <- dashboardPage(header, sidebar, body, skin = "black")


server <- function(input, output) {
# Huh, server needs some work too :) 
}

  shinyApp(ui, server)
  