# Load needed packages
library(DBI)
library(DT)
library(rhandsontable)
library(shiny)
library(shinydashboard)
library(leaflet)
library(htmltools)
library(jpeg)

source("./creds.R", local = TRUE)
source("./about.R", local = TRUE)
source("./global.R", local = TRUE)

#### Header ####
source("header.R", local = TRUE)

#### Sidebar ####
source("sidebar.R", local = TRUE)

#### Body ####
source("body.R", local = TRUE)

ui <- dashboardPage(header, sidebar, body, skin = "black")

server <- function(input, output) {
  
  #### About ####  
  #### Data explorer ####
  source("explore_map.R", local = TRUE)
  
  #### Data input ####
  # Input form
  source("input_form.R", local = TRUE)
  
  # Dynamic display of morphology input fields 
  source("input_form_morphology.R", local = TRUE)
  
  #### Records browser ####
  source("browser.R", local = TRUE)
  #### Querying database ####  TO-DO: Limit query expressions ####
  source("build_query.R", local = TRUE)
  
  #### Prepare tables for tables tab ####
  source("manage_tables.R", local = TRUE)
  
  #### End session ####
  onSessionEnded(function() {
    dbDisconnect(con)
  })
}

shinyApp(ui, server)
