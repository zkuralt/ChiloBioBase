library(shiny)
library(shinydashboard)

header <- dashboardHeader(title = "ChiloBioBase 2.0",
                          dropdownMenu(type = "notifications",
                                       notificationItem(
                                         text = "4 records added today",
                                         icon("exclamation-triangle")
                                       )
                          ),
                          dropdownMenu(type = "tasks",
                                       taskItem(value = 0, color = "red", "Importing existing flatfile database"),
                                       taskItem(value = 4, color = "blue", "Setting up the database"),
                                       taskItem(value = 100, color = "green", "Records waiting for confirmation")))

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("About database", tabName = "about", icon = icon("database")),
    menuItem("Data input", tabName = "input", icon = icon("plus-circle")),
    menuItem("View data", tabName = "view", icon = icon("eye")),
    menuItem("Build query", tabName = "query", icon = icon("filter")),
    menuItem("Tables", tabName = "tables", icon = icon("sitemap"))
  )
)

body <- dashboardBody()

ui <- dashboardPage(header, sidebar, body, skin = "black")


server <- function(input, output) {
  
}

  shinyApp(ui, server)
  