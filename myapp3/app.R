# libraries ----
suppressPackageStartupMessages({
    library(shiny)
    library(shinyjs)
    library(shinydashboard)
})

# setup ----


# functions ----
source("scripts/func.R") # helper functions

# user interface ----

## tabs ----
demo_tab <- tabItem(
    tabName = "demo_tab",
    imageOutput("logo")
)

skin_color <- sample(c("red", "yellow", "green", "blue", "purple", "black"), 1)
random_icon <- sample(c("canadian-maple-leaf", "dragon", "user", "cog", 
                        "dice-d20", "dumpster-fire", "pastafarianism"), 1)
## UI ----
ui <- dashboardPage(
    skin = "red",
    dashboardHeader(title = "Basic Template", 
        titleWidth = "250px" # puts sidebar toggle on the left, in addition to put it right it is titleWidth = "calc(100% - 44px)"
    ),
    dashboardSidebar(
        # https://fontawesome.com/icons?d=gallery&m=free
        sidebarMenu(
            id = "tabs",
            menuItem("Tab Title", tabName = "demo_tab", icon = icon(random_icon))
        ),
        div(
        tags$a(href = "https://debruine.github.io/shinyintro/", 
               "ShinyIntro book", style="padding: 1em; display: block;"), 
        tags$a(href = "https://bmcbioinformatics.biomedcentral.com/articles/10.1186/s12859-023-05420-y", 
                                                                 "Rogue App", style="padding: 1em; display:block;"),
        tags$a(href = "https://www.nature.com/articles/s41586-024-08165-7#Abs1", "Adipose tissue and epigenetic memory of obesity after weig
                          ht loss", style = "padding: 2em; display:block;")
        )
    ),
    dashboardBody(
        shinyjs::useShinyjs(),
        tags$head(
            # links to files in www/
            tags$link(rel = "stylesheet", type = "text/css", href = "basic_template.css"), 
            tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"), 
            tags$script(src = "custom.js")
        ),
        tabItems(
            demo_tab
        )
    )
)


# server ----
server <- function(input, output, session) {
    output$logo <- renderImage({
        list(src = "www/img/shinyintro.png",
             width = "300px",
             height = "300px",
             alt = "ShinyIntro hex logo")
    }, deleteFile = FALSE)
} 

shinyApp(ui, server)