header <- dashboardHeader(title = "ChiloBioBase 2.0",
                          dropdownMenu(type = "notifications", notificationItem(text = "4 records added today", icon("exclamation-triangle"))),
                          dropdownMenu(type = "tasks",
                                       taskItem(value = 0, color = "red", "Importing existing flatfile database"),
                                       taskItem(value = 4, color = "blue", "Setting up the database"),
                                       taskItem(value = 100, color = "green", "Records waiting for confirmation")))