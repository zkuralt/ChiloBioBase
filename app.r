# Load needed packages
library(shinydashboard)
library(shiny)
library(shinyjs)
library(leaflet)
library(DBI)
library(DT)
library(rhandsontable)
library(htmltools)
library(jpeg)

source("./R/creds.R", local = TRUE)
source("./R/global.R", local = TRUE)
source("./R/about.R", local = TRUE)

#### Header ####
source("./R/header.R", local = TRUE)

#### Sidebar ####
source("./R/sidebar.R", local = TRUE)

#### Body ####
source("./R/body.R", local = TRUE)

ui <- dashboardPage(header, sidebar, body, skin = "black")

#### Server side ####
server <- function(input, output) {
  #### About ####  
  source("./R/about.R", local = TRUE)
  
  #### Data explorer ####
  source("./R/explore_map.R", local = TRUE)
  
  #### Data input ####
  # Input form
  source("./R/input_form.R", local = TRUE)
  # Dynamic display of morphology input fields 
  source("./R/input_form_morphology.R", local = TRUE)
  
  #### Records browser ####
  source("./R/browser.R", local = TRUE)
  
  #### Querying database ####  TO-DO: Limit query expressions ####
  source("./R/build_query.R", local = TRUE)
  
  #### Settings ####
  
  #### How-to ####
  source("./R/howto.R", local = TRUE)
  
  #### Tables ####
  source("./R/manage_tables.R", local = TRUE)
  
  #### End session ####
  onSessionEnded(function() {
    dbDisconnect(con)
  })
}

shinyApp(ui, server)
