

# read data on the web
countries <- readr::read_csv("https://datahub.io/core/country-list/r/data.csv")
languages <- jsonlite::read_json("https://datahub.io/core/language-codes/r/language-codes.json")


library(googlesheets4)
gs4_deauth()
sheet_id <- "https://docs.google.com/spreadsheets/d/1tQCYQrI4xITlPyxb9dQ-JpMDYeADovIeiZZRNHkctGA/"
sheet_id <- read_sheet(sheet_id)


shinyintro::app("radiotables")
