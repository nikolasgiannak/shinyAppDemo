

# Install shinyintro

devtools::install_github("debruine/shinyintro")

# Access the book

shinyintro::book()

# Run demo apps offline

shinyintro::app("first_demo")


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
ui <- fluidPage(


# Run the application 
shinyApp(ui = ui, server = server)
