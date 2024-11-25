

# Install shinyintro

devtools::install_github("debruine/shinyintro")

# Access the book

shinyintro::book()

# Run demo apps offline

shinyintro::app("first_demo")

#INstall test application shinytest2, as shinytest did not have 0 exit status
devtools::install_github("rstudio/shinytest2")
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)




# Run the application 
shinyApp(ui = ui, server = server)
