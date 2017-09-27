# Load needed packages
library(shiny)
library(shinydashboard)
library(leaflet)
source("./global.R")

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
    menuItem("Tables", tabName = "tables", icon = icon("sitemap"), badgeLabel = "Admin only", badgeColor = "blue")
  )
)

# Formatting page body. Not quite there yet ...
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "about",
            h2("This is a MariaDB relational database of Chilopoda"),
            h3("Quick overview of the database"),
            br(),
            fluidRow(
              infoBox(title = "Species", value = 76, icon = icon("bug"), color = "olive", width = 3),
              infoBox(title = "Localities", value = 59, icon = icon("map-marker"), color = "yellow", width = 3),
              infoBox(title = "Users", value = 6, icon = icon("group"), color = "light-blue", width = 3),
              infoBox(title = "Records", value = 19358, icon = icon("list"), color = "purple", width = 3)
              ),
            fluidRow(
              box(title = "Quick filter", solidHeader = TRUE, height = 500, width = 4,
                  h5("Filter records displayed in map"),
                  selectInput(inputId = "filterSpecies", label = "Select species:", choices = specList),
                  sliderInput("filterAltitude", "Altitude range:", min = 0, max = 2864, value = c(400,800), step = 100,
                              sep = "", post = " m")
                  # selectInput(inputId = "filterHabitat", label = "Habitat type", choices = habitatTypes, )
                  ),
              box(solidHeader = TRUE, height = 500, width = 8,
                  leafletOutput("leaflet", height = 480))
            )
            ),
    tabItem(tabName = "input",
            h2("Forms for new data input"),
            fluidRow(
              box(title = "Input form", solidHeader = TRUE,
                  selectInput(inputId = "species", label = "Select species:", choices = specList),
                  selectInput(inputId = "locality", label = "Select locality:", choices = localityList),
                  dateInput(inputId = "date", label = "Date of survey:", weekstart = 1), ## naredi reaktivno, da izberejo popis na ta datum
                  textInput(inputId = "sex", label = "Sex"),
                  textInput(inputId = "stage", label = "Stage"),
                  selectInput(inputId = "user", label = "Added by:", choices = userList),
                  submitButton(text = " Submit record", icon = icon("bug"))
                  ),
              box(title = "Morphological data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                  uiOutput()),
              box(title = "Molecular data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE),
              box(title = "Photo data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                  fileInput(inputId = "picture", multiple = TRUE, buttonLabel = "Submit pictures", 
                            accept=c('image/jpeg', 'image/png', 'image/bmp'), label = "Add pictures",
                            placeholder = "No file selected"))
            )),
    tabItem(tabName = "view",
            h2("View data")),
    tabItem(tabName = "query",
            h2("Create query and download data")),
    tabItem(tabName = "tables",
            h2("Edit relational tables"))
  )
)

ui <- dashboardPage(header, sidebar, body, skin = "black")


server <- function(input, output) {
# Huh, server needs some work too :)
  
  
  
  
  output$leaflet <- renderLeaflet({ # reloads map
    leaflet() %>% 
      addProviderTiles(providers$Stamen.Terrain,
                       options = providerTileOptions(noWrap = TRUE)) %>%
      addScaleBar(position = "bottomleft", scaleBarOptions(metric = TRUE, imperial = FALSE)) %>% 
      setView(lng = 14.815333, lat = 46.119944, zoom = 8)
  })
    
    onSessionEnded(function() {
      dbDisconnect(con)
    })
}

  shinyApp(ui, server)
  