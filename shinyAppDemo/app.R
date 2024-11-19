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

##############################-------------########################-------------
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

############################################-----------############-------------

ui <- fluidPage(titlePanel("Basic Demo"),
                sidebarLayout(
                  sidebarPanel(
                    checkboxGroupInput(
                      inputId = "fav_things",
                      label = "What are your favourite things?",
                      choices = c("Coding", "Cycling", "Cooking", "another choice", "choice...again")
                    ),
                    actionButton(
                      inputId = "count_favourite_things",
                      label = "Count",
                      icon = icon("calculator")
                    )
                  ),
                  mainPanel(textOutput(outputId = "n_fav_things"))
                ))
# Define server logic required to draw count choices through observeEvent() reactive function and counting the length
#server <- function(input, output) {
#  # count favourite things
#  observeEvent(input$count_fav_things, {
#    n <- length(input$fav_things)
#    count_text <- sprintf("You have %d favourite things", n)
#    output$n_fav_things <- renderText(count_text)
#  })
#}

# 2nd version using a render fuction paired with an outpiut function
#server <- function(input, output){
#  #count the choices/favourite things through renderText function
#  observeEvent(input$count_favourite_things,#create a new column at input named count_things
#               {
#                 n = length(input$fav_things)
#                 countText = sprintf("You have %d fav things", n)
#    output$n_fav_things = renderText(countText)
# })
#  
# }

# 3rd option to do the same thing by using reactive() to create a new function called count_text, which updates 
# the value when the input for the reactive function changes

# Here isolate is used to prevent count_text() from changing when a user clicks the checkboxes

server <- function(input, output) {
  # update count_text on fav_things
  count_text <- reactive({
    input$count_favourite_things # just here to trigger the reactive
    fav_things <-
      isolate(input$fav_things) # don't trigger on checks
    n <- length(fav_things)
    sprintf("You have %d favourite things", n)
  })
  
  # display count_text when it updates
  output$n_fav_things <- renderText(count_text())
}




# Run the application 
shinyApp(ui = ui, server = server)
