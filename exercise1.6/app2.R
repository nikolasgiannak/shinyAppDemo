#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(titlePanel("Addition Demo"),
                sidebarLayout(
                  sidebarPanel(
                    numericInput("n1", "Write the first number of choice", 0, min =0, max =100),
                    numericInput("n2", "Write the second number of choice", 0, min = 0, max = 50),
                    numericInput("n3", "Write the third number of choice", 0, min = 0, max = 100 ),
                    numericInput("num4", "Write the 4th number of choice", 0, min = 0, max = 100 )
                      ),
                  actionButton(
                    inputId = "addition",
                    label = "Add numbers",
                                  )
                  ),
                  mainPanel(textOutput(outputId = "n1_n2_n3_num4"))
                )

# Define server logic required to draw a histogram
server <- function(input, output) 
  {
  # perfrom the addition of numbers
   observeEvent(input$addition, {
                sum <- input$n1 + input$n2 + input$n3
                add_text <- sprintf("%d + %d + %d + %d = %d", input$n1, input$n2, input$n3,input$num4, sum)
                output$n1_n2_n3_num4 <- renderText(add_text)
   
   }
   )
  }

# Run the application 
shinyApp(ui = ui, server = server)
