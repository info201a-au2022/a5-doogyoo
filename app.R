

#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
source("app_ui.R")
source("app_server.R")

library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)
library(shinyWidgets)
library(rsconnect)


# Run the application 
shinyApp(ui = ui, server = shiny_server)