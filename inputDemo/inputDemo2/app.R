#shinyintro::app("input_demo")

# libraries ----
suppressPackageStartupMessages({
  library(shiny)
  library(shinydashboard)
})

# user interface ----


favourite_animals <- list(
  "Dogs" = "d",
  "Cats" = "c",
  "Birds" = "b",
  "Fish" = "f",
  "Mice" = "m",
  "Hedgehogs" = "h",
  "Snakes" = "s"
  )

demo_cbgi <-
  checkboxGroupInput("demo_cbgi",
                     label = "Select your favourite animals (select all that apply)",
                     choices = favourite_animals)
                     
slider <- sliderInput("slider",
                           label = "Rating",
                           min = 1,
                           max = 9,
                           value = 1,
                           step = 1,
                           width = "100%")

radio_animals <- radioButtons("demo_radio",
                           label = "Choose one",
                           choices = c("Dogs", "Cats", "Birds", "Fish", "Mice", "Hedghogs", "Snakes"),
                           selected = character(0),
                           inline = TRUE)


demo_file <- fileInput("demo_file",
                       label = "Upload a data table",
                       multiple = FALSE,
                       accept = c(".csv", ".tsv"),
                       buttonLabel = "Upload")

main_tab <- tabItem(
  tabName = "main_tab",
  p("Exercise with pets."),
  fluidRow(
    column(width = 6,
           radio_animals, slider),
    column(width = 6,
           demo_cbgi,
           demo_file)
  ),
  actionButton("reset", "Reset")
)

## UI ----
ui <- dashboardPage(
  skin = "red",
  dashboardHeader(title = "Input Demo"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ), 
    main_tab
  )
)


# server ----
server <- function(input, output, session) {
  # reset values
  observeEvent(input$reset, {
    updateCheckboxGroupInput(session, "demo_cbgi", selected = character(0))
    updateCheckboxInput(session, "demo_cb", value = TRUE)
    updateRadioButtons(session, "demo_radio", selected = character(0))
    updateSliderInput(session, "slider", value = 0)
  })
} 
demo_cbgi
shinyApp(ui, server)
