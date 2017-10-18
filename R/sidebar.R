sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("About database", tabName = "about", icon = icon("database")),
    menuItem("Explore data", tabName = "explore", icon = icon("eye")),
    menuItem("Data input", tabName = "input", icon = icon("plus-circle")),
    menuItem("Records browser", tabName = "browser", icon = icon("search")),
    menuItem("Build query", tabName = "query", icon = icon("filter")),
    menuItem("Settings", tabName = "settings", icon = icon("cogs")),
    menuItem("How-to", tabName = "howto", icon = icon("question-circle-o")),
    menuItem("Tables", tabName = "tables", icon = icon("sitemap"), badgeColor = "blue", badgeLabel = "Admin only")
    
  )
)