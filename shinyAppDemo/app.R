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
ui <- fluidPage(
  
  # Application title
  titlePanel("My first Shiny App"),
  p("Here I explain how the sideBar panel works"),
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
 
    sidebarPanel(
     
      sliderInput("bins",
                  "Choose the appropriate number of bins to visualize your data:",
                  min = 10,
                  max = 40,
                  value = 20)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
  output$distPlot <- renderPlot({
    # create plot
    ggplot(faithful, aes(eruptions)) +
      geom_histogram(bins = input$bins,
                     fill = "#0066CC",
                     colour = "grey90") +
      xlab("What are we even plotting here?") +
      theme_minimal()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
