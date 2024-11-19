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

-------------#####################################################--------------
#ui <- fluidPage(
#  checkboxGroupInput("icons", "Choose icons:",
#                     choiceNames =
#                       list(icon("calendar"), icon("bed"),
#                            icon("cog"), icon("bug")),
#                    choiceValues =
#                      list("calendar", "bed", "cog", "bug")
#  ),
#  textOutput("txt")
#)

-----------#######################################################--------------


ui <- fluidPage(titlePanel("Learning buy doing Demos"),
                sidebarLayout(
                  sidebarPanel(
checkboxGroupInput(
  inputId = "fav_things",
  label = "What are your favourite things?",
  choices = c("Coding", "Cycling", "Cooking")
                  ),
actionButton(
  inputId = "count_fav_things",
  label = "Count",
  icon = icon("calculator")
            )
                              
                              ),
#mainPanel should be inside the sidebarLayout but outside SidebarPanel
mainPanel(textOutput(outputId = "n_fav_things"))
                              )
)
# Define server logic required to draw a histogram
server <- function(input, output) {
  # count favourite things
  observeEvent(input$count_fav_things, {
    n <- length(input$fav_things)
    count_text <- sprintf("You have %d favourite things", n)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)
