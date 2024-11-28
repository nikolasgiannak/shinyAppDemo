

# shinyintro::clone("reactive_demo", "myapp")

# libraries ----
suppressPackageStartupMessages({
  library(shiny)
  library(shinyjs)
  library(shinydashboard)
  library(ggplot2)
  library(dplyr)
})

# setup ----


# functions ----
# source("scripts/func.R") # helper functions

debug_msg <- function(...) {
  is_local <- Sys.getenv('SHINY_PORT') == ""
  in_shiny <- !is.null(shiny::getDefaultReactiveDomain())
  txt <- toString(list(...))
  if (is_local) message(txt)
  if (in_shiny) shinyjs::runjs(sprintf("console.debug(\"%s\")", txt))
}

debug_sprintf <- function(fmt, ...) {
  debug_msg(sprintf(fmt, ...))
}
# user interface ----


## UI ----
ui <- dashboardPage(
  skin = "purple",
  dashboardHeader(title = "Reactive Demo",
                  titleWidth = "100%"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    shinyjs::useShinyjs(),
    tags$head(
      # links to files in www/
      tags$link(rel = "stylesheet", type = "text/css", href = "basic_template.css"),
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
      tags$script(src = "custom.js")
    ),
    box(width = 3,
        title = "Diamonds",
        solidHeader = TRUE,
        selectInput("cut", "Cut", levels(diamonds$cut)),
        selectInput("color", "Color", levels(diamonds$color)),
        selectInput("clarity", "Clarity", levels(diamonds$clarity)),
        actionButton("update", "Update Plot")
    ),
    box(width = 9,
        title = "Plot",
        solidHeader = TRUE,
        textOutput("title"),
        plotOutput("plot")
    )
  )
)


# server ----
server <- function(input, output, session) {
  output$plot <- renderPlot({
    data <- filter(diamonds,
                   cut == input$cut,
                   color == input$color,
                   clarity == input$clarity)
    
    ggplot(data, aes(carat, price)) +
      geom_point(color = "#605CA8", alpha = 0.5) +
      geom_smooth(method = lm, color = "#605CA8")
  })
  
  output$title <- renderText({
    input$update # just here to trigger the function
    
    sprintf("Cut: %s, Color: %s, Clarity: %s",
            input$cut,
            input$color,
            input$clarity)
  })
} 

shinyApp(ui, server)






# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white',
             xlab = 'Waiting time to next eruption (in mins)',
             main = 'Histogram of waiting times')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
