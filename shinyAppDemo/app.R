#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(ggplot2)

# Define UI for application that draws a histogram
ui <- fluidPage(titlePanel("Basic Demo"),
                splitLayout(
                  h2("My favourite things"),
                  tags$ul(tags$li("Coding"),
                          tags$li("Cycling"),
                          tags$li("Cooking")),
                  p("This is a very basic demo."),
                  tags$img(
                    src = "https://debruine.github.io/shinyintro/images/logos/shinyintro.png",
                    width = "100px",
                    height = "100px"
                  )
                ))
# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({# set x-axis label depending on the value of display_var
    if (input$display_var == "eruptions") {
      xlabel <- "Eruption Time (in minutes)"
    } else if (input$display_var == "waiting") {
      xlabel <- "Waiting Time to Next Eruption (in minutes)"
    }
    # create plot
    ggplot(faithful, aes(.data[[input$display_var]])) +
      geom_histogram(bins = input$bins,
                     fill = "#0066CC",
                     colour = "grey90") +
      xlab("xlabel") +
      theme_minimal()
  })
  
  
  }

# Run the application 
shinyApp(ui = ui, server = server)
