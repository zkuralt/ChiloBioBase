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
              uiOutput("displayQuery"))),
    
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