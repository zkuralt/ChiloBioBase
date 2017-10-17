sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("About database", tabName = "about", icon = icon("database")),
    menuItem("Explore data", tabName = "explore", icon = icon("eye")),
    menuItem("Data input", tabName = "input", icon = icon("plus-circle")),
    menuItem("Records browser", tabName = "browser", icon = icon("search")),
    menuItem("Build query", tabName = "query", icon = icon("filter")),
    menuItem("Tables", tabName = "tables", icon = icon("sitemap"))
  )
)