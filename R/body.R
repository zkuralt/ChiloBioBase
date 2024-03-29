body <- dashboardBody(
  useShinyjs(),
  tags$style(type = "text/css", "#map {height: 100% !important;}"),
  tabItems(
    tabItem(tabName = "about",
            h2("This is a MariaDB relational database of Chilopoda collected in Slovenia"),
            br(),
            p("Some text"),
            br(),
            h3("Database summary"),
            br(),
            uiOutput("stats")
            
    ),
    
    tabItem(tabName = "explore",
            div(class="outer",
                tags$head(
                  # Include custom CSS
                  includeCSS("./css/styles.css")
                ),
                leafletOutput("map"),
                absolutePanel(id = "controls", 
                              class = "panel panel-default", 
                              fixed = TRUE,
                              draggable = TRUE, 
                              top = 60, 
                              left = "auto", 
                              right = 20, 
                              bottom = "auto",
                              width = 330, 
                              height = "auto",
                              sliderInput("filterAltitude", "Altitude range:", 
                                          min = 0, 
                                          max = 2864, 
                                          value = c(100,1700), 
                                          step = 100,
                                          sep = "", 
                                          post = " m")
                )
            )
    ),
    
    tabItem(tabName = "input",
            h2("Forms for new data input"),
            fluidRow(
              box(title = newSpecimen, solidHeader = TRUE,
                  div(
                    id = "inputForm",
                    selectInput(inputId = "species", label = "Select species:", choices = speciesList),
                    selectInput(inputId = "locality", label = "Select locality:", choices = localityList),
                    dateInput(inputId = "date", label = "Date of survey:", weekstart = 1, format = "dd. mm. yyyy"),
                    selectInput(inputId = "survey", label = "Survey", choices = surveyList),
                    selectInput(inputId = "collection", label = "Collection", choices = collectionList),
                    selectInput(inputId = "sex", label = "Sex", choices = sexList),
                    selectInput(inputId = "user", label = "Added by:", choices = userList)
                  ),
                  fluidRow(
                    column(width = 3, offset = 2,
                    actionButton(inputId = "submitInput", label = "Submit", icon = icon("bug"))
                    ),
                    column(width = 3, offset = 2,
                           tags$head(
                             tags$style(HTML('#resetForm{background-color:orange}'))
                           ),
                    actionButton(inputId = "resetForm", label = "Reset form")
                    )
                  )
              ),
              uiOutput("ordoOut"),
              box(title = "Molecular data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE),
              box(title = "Photo data input", solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE,
                  fileInput(inputId = "picture", multiple = TRUE, buttonLabel = "Submit pictures", 
                            accept=c('image/jpeg', 'image/png', 'image/bmp'), label = "Add pictures",
                            placeholder = "No file selected")
              )
            )
    ),
    
    tabItem(tabName = "browser",
            fluidRow(
              h4("Current record: 4"),
              actionButton(inputId = "previous", label = "Previous record", icon = icon("arrow-circle-o-left")),
              actionButton(inputId = "next", label = "Next record", icon = icon("arrow-circle-o-right"))
            ),
            br(),
            fluidRow(
              tabBox(width = 6,
                     tabPanel(title = "Record summary",
                              h5("Species"),
                              h5("Sex"),
                              h5("Stage")
                     ),
                     tabPanel(title = "Locality info",
                              h5("Locality name"),
                              h5("Altitude"),
                              h5("Ecosystem"),
                              h5("Habitat")
                     )
              ),
              tabBox(width = 6,
                     tabPanel(title = "Morphology",
                              p("leg count"),
                              p("head width")
                     ),
                     tabPanel(title = "Molecular data",
                              p("CO1"),
                              p("Sequencing type")
                     )
              )
            ),
            fluidRow(
              box(title = "Photos", solidHeader = TRUE,
                  imageOutput("image", width = "250px", height = "250px"))
            )
    ),
    
    tabItem(tabName = "query",
            h2("Create query and download data"),
            fluidRow(
              box(title = "Quick query", solidHeader = TRUE, width = 4, collapsible = TRUE, collapsed = TRUE,
                  selectInput(inputId = "speciesQuery", label = "Query by specimen species", choices = speciesList ),
                  # selectInput(inputId = "localityQuery", label = "Query by specimen locality", choices = localityList),
                  actionButton(inputId = "sendQuickQuery", label = "Send query")),
              box(title = "Custom SQL query", solidHeader = TRUE, width = 8, collapsible = TRUE, collapsed = TRUE,
                  textInput(inputId = "sqlQuery", label = "", placeholder = "here goes your query"),
                  actionButton(inputId = "sendCustomQuery", label = "Send query")
              )
            ),
            fluidRow(
              uiOutput("displayQuery")
            )
    ),
    
    tabItem(tabName = "settings",
            h2("Here come settings")
    ),
    
    tabItem(tabName = "howto",
            fluidPage(
            uiOutput("howto")
            )
    ),
    
    tabItem(tabName = "tables",
            h2("Edit relational tables"),
            box(title = "Localities", solidHeader = TRUE, collapsible = TRUE, width = 12,
                actionButton(inputId = "add_locality", label = "Add locality"),
                br(),
                br(),
                rHandsontableOutput("localities")
            ),
            box(title = "Species", solidHeader = TRUE, collapsible = TRUE, width = 12,
                rHandsontableOutput("species")
            ),
            box(title = "Surveys", solidHeader = TRUE, collapsible = TRUE, width = 12,
                rHandsontableOutput("surveys")
            )
    )
  )
)