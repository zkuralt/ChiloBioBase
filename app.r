# Load needed packages
library(DBI)
library(DT)
library(rhandsontable)
library(shiny)
library(shinydashboard)
library(leaflet)
library(htmltools)
source("./creds.R")
source("./about.R")
source("./global.R")


#### Formatting header. Need to look into the dropdown menus. ####
header <- dashboardHeader(title = "ChiloBioBase 2.0",
                          dropdownMenu(type = "notifications", notificationItem(text = "4 records added today", icon("exclamation-triangle"))),
                          dropdownMenu(type = "tasks",
                                       taskItem(value = 0, color = "red", "Importing existing flatfile database"),
                                       taskItem(value = 4, color = "blue", "Setting up the database"),
                                       taskItem(value = 100, color = "green", "Records waiting for confirmation")))

#### Formatting sidebar. What would be the most practical structure of it? ####
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("About database", tabName = "about", icon = icon("database")),
    menuItem("Data input", tabName = "input", icon = icon("plus-circle")),
    menuItem("View data", tabName = "view", icon = icon("eye")),
    menuItem("Taxon browser", tabName = "browser", icon = icon("search")),
    menuItem("Build query", tabName = "query", icon = icon("filter")),
    menuItem("Tables", tabName = "tables", icon = icon("sitemap"), badgeLabel = "Admin only", badgeColor = "blue")
  )
)

#### Formatting page body. Not quite there yet. ####
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "about",
            h2("This is a MariaDB relational database of Chilopoda"),
            h3("Quick overview of the database"),
            br(),
            fluidRow(
              infoBox(title = "Species", value = uniqSpecies, icon = icon("bug"), color = "olive", width = 3),
              infoBox(title = "Localities", value = uniqLocalities, icon = icon("map-marker"), color = "yellow", width = 3),
              infoBox(title = "Users", value = uniqUsers, icon = icon("group"), color = "light-blue", width = 3),
              infoBox(title = "Records", value = uniqRecords, icon = icon("list"), color = "purple", width = 3)
            ),
            br(),
            fluidRow(
              box(title = "Quick filter", solidHeader = TRUE, height = 500, width = 4,
                  h5("Filter records displayed in map"),
                  selectInput(inputId = "filterSpecies", label = "Select species:", choices = speciesList),
                  sliderInput("filterAltitude", "Altitude range:", min = 0, max = 2864, value = c(0,2864), step = 100,
                              sep = "", post = " m"),
                  actionButton(inputId = "filterData", label = "Filter data")
                  # selectInput(inputId = "filterHabitat", label = "Habitat type", choices = habitatTypes, )
              ),
              box(solidHeader = TRUE, height = 500, width = 8,
                  leafletOutput("leaflet", height = 480))
            )
    ),
    tabItem(tabName = "input",
            h2("Forms for new data input"),
            fluidRow(
              box(title = newSpecimen, solidHeader = TRUE,
                  selectInput(inputId = "ordo", label = "Select ordo:", choices = ordoList),
                  selectInput(inputId = "species", label = "Select species:", choices = speciesList),
                  selectInput(inputId = "locality", label = "Select locality:", choices = localityList),
                  dateInput(inputId = "date", label = "Date of survey:", weekstart = 1, format = "dd. mm. yyyy"), ## naredi reaktivno, da izberejo popis na ta datum
                  selectInput(inputId = "sex", label = "Sex", choices = sexList),
                  selectInput(inputId = "stage", label = "Stage", choices = stageList),
                  selectInput(inputId = "user", label = "Added by:", choices = userList),
                  actionButton(inputId = "submitInput", label = "Submit", icon = icon("bug"), width = '100%')),
              box(title = "Morphological data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                  uiOutput("ordoOut")),
              box(title = "Molecular data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE),
              box(title = "Photo data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                  fileInput(inputId = "picture", multiple = TRUE, buttonLabel = "Submit pictures", 
                            accept=c('image/jpeg', 'image/png', 'image/bmp'), label = "Add pictures",
                            placeholder = "No file selected"))
            )
    ),
    tabItem(tabName = "view",
            h2("View data")),
    tabItem(tabName = "browser",
            h2("Taxon browser"),
            fluidRow(
              box(title = "Record summary", solidHeader = TRUE,
                  h5("Specimen_ID"))
            )),
    tabItem(tabName = "query",
            h2("Create query and download data"),
            fluidRow(
              box(title = "Quick query", solidHeader = TRUE, width = 4, collapsible = TRUE, collapsed = TRUE,
                  selectInput(inputId = "speciesQuery", label = "Query by specimen species", choices = speciesList ),
                  selectInput(inputId = "localityQuery", label = "Query by specimen locality", choices = localityList),
                  actionButton(inputId = "sendQuickQuery", label = "Send query")),
              box(title = "Custom SQL query", solidHeader = TRUE, width = 8, collapsible = TRUE, collapsed = TRUE,
                  textInput(inputId = "sqlQuery", label = "", placeholder = "here goes your query"),
                  actionButton(inputId = "sendCustomQuery", label = "Send query"))),
            fluidRow(
              uiOutput("queryBox"))),
    tabItem(tabName = "tables",
            h2("Edit relational tables"),
            box(title = "Localities", solidHeader = TRUE, collapsible = TRUE, width = 12,
                actionButton(inputId = "add_locality", label = "Add locality"),
                br(),
                br(),
                rHandsontableOutput("localities")),
            box(title = "Species", solidHeader = TRUE, collapsible = TRUE, width = 12,
                rHandsontableOutput("species")),
            box(title = "Surveys", solidHeader = TRUE, collapsible = TRUE, width = 12,
                rHandsontableOutput("surveys")))
  )
)

ui <- dashboardPage(header, sidebar, body, skin = "black")

#### Server side ####
server <- function(input, output) {
  
  #### DATA INPUT FORM ####
  
  observeEvent(input$submitInput , {
    specimen <- data.frame(Species_id = input$species,
                           Sex_id = input$sex,
                           Stage_id = input$stage,
                           Locality_id = input$locality,
                           Survey_id = input$survey,
                           Collection_id = input$collection,
                           Morpho_id = "",
                           Molecular_id = "",
                           User_id = input$user,
                           Entry_Stamp = format(Sys.time(), "%Y%m%d_%H%M"))
    
    dbWriteTable(conn = con,
                 name = "Specimen",
                 value = specimen,
                 append = TRUE)
  })
  
  #### Prepare tables for tables tab ####
  output$localities <- renderRHandsontable({
    x <- dbGetQuery(conn = con, statement = "SELECT * FROM Locality;")
    rhandsontable(x)
  })
  
  output$species <- renderRHandsontable({
    x <- dbGetQuery(conn = con, statement = "SELECT * FROM Species;")
    rhandsontable(x)
  })
  
  output$surveys <- renderRHandsontable({
    x <- dbGetQuery(conn = con, statement = "SELECT * FROM Survey;")
    rhandsontable(x)
  })
  
  #### Dynamic display of morphology input fields ####
  output$ordoOut <- renderUI({
    ordo <- input$ordo
    if (ordo %in% "") {
      out <- h5("Select ordo")
    }
    
    if (ordo %in% "Lithobiomorpha") {
      out  <- h5("Lithobiomorpha")
    }
    
    if (ordo %in% "Geophilomorpha") {
      out  <- h5("Geophilomorpha")
    }
    
    if (ordo %in% "Scolopendromorpha") {
      out  <- h5("Scolopendromorpha")
    }
    
    if (ordo %in% "Scutigeromorpha") {
      out  <- h5("Scutigeromorpha")
    }
    out
  })
  
  #### Querying database ####  TO-DO: Limit query expressions ####
  ## https://stackoverflow.com/questions/9853586/how-can-i-join-multiple-sql-tables-using-the-ids ##
  observeEvent(c(input$sendCustomQuery, input$sendQuickQuery), {
    output$queryResult <- DT::renderDataTable({
      if (!is.null(input$sqlQuery)) {
      statement <- input$sqlQuery
      } else {
        if (!is.null(input$speciesQuery)) {
        statement <- paste("   
                        SELECT * 
                        FROM Specimen 
                        JOIN Species
                        ON Specimen.Species_id = Species.Species_id
                        JOIN Sex
                        ON Specimen.Sex_id = Sex.Sex_id
                        JOIN Stage
                        ON Specimen.Stage_id = Sex.Sex_id
                        JOIN Locality
                        ON Specimen.Locality_id = Locality.Locality_id
                        JOIN Survey
                        ON Specimen.Survey_id = Survey.Survey_id
                        JOIN Collection
                        ON Specimen.Collection_id = Collection.Collection_id
                        JOIN Morphological_data
                        ON Specimen.Morpho_id = Morphological_data.Morpho_id
                        JOIN Molecular_data
                        ON Specimen.Molecular_id = Molecular_data(Molecular_id)
                        JOIN Users
                        ON Specimen.User_id = Users.User_id
                        WHERE Species.Species_id =", input$speciesQuery, sep = " ")
        } else {
          if (!is.null(input$localityQuery)) {
            statement <- paste("
                        SELECT * 
                        FROM Specimen 
                        JOIN Species
                        ON Specimen.Species_id = Species.Species_id
                        JOIN Sex
                        ON Specimen.Sex_id = Sex.Sex_id
                        JOIN Stage
                        ON Specimen.Stage_id = Sex.Sex_id
                        JOIN Locality
                        ON Specimen.Locality_id = Locality.Locality_id
                        JOIN Survey
                        ON Specimen.Survey_id = Survey.Survey_id
                        JOIN Collection
                        ON Specimen.Collection_id = Collection.Collection_id
                        JOIN Morphological_data
                        ON Specimen.Morpho_id = Morphological_data.Morpho_id
                        JOIN Molecular_data
                        ON Specimen.Molecular_id = Molecular_data(Molecular_id)
                        JOIN Users
                        ON Specimen.User_id = Users.User_id
                        WHERE Species.Species_id =", input$localityQuery, sep = " ")
          }
        }
      }
      x <- dbGetQuery(conn = con, statement = statement)
      DT::datatable(x, options = list(scrolX = TRUE), fillContainer = TRUE)
    })
    
    output$queryBox <- renderUI({
      x1 <- input$sqlQuery
      x2 <- input$speciesQuery
      x3 <- input$localityQuery
      if (!is.null(x1) | !is.null(x2) | !is.null(x3)) {
        box(solidHeader = TRUE, title = "Query result", width = 12,
            downloadButton(outputId = "downloadCSV", label = "Download data", icon = icon("download")),
            br(),
            br(),
            dataTableOutput("queryResult"))
      }
    })
  })
  
  output$downloadCSV <- downloadHandler(
    filename = function() { paste("chilo_query-", format(Sys.time(), "%Y%m%d_%H%M"), ".csv", sep = "") },
    content = function(file){
      statement <- input$sqlQuery
      x <- dbGetQuery(conn = con, statement = statement)
      print(x)
      write.table(x, file, row.names = FALSE, sep = ",", fileEncoding = "UTF-8")
    })
  
  #### LEAFLET IN THE ABOUT TAB ####  
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
      addMarkers(clusterOptions = markerClusterOptions(showCoverageOnHover = TRUE, 
                                                       zoomToBoundsOnClick = TRUE), ### TO-DO: Change marker icon
                 layerId = "1",
                 popup = filteredData()$Locality_Name)
  })
  #####  
  
  onSessionEnded(function() {
    dbDisconnect(con)
  })
}

shinyApp(ui, server)
