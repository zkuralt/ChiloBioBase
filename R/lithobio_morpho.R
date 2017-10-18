out  <- box(title = "Morphological data input", solidHeader = TRUE, collapsible = TRUE, collapsed = FALSE,
            p("Lithobiomorpha"),
            numericInput(inputId = "leg_count", label = "Leg count", value = 15, min = 10, max = 20, step = 1),
            textInput(inputId = "hwd", label = "head width")
)