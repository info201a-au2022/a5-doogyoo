library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)
library(shinyWidgets)
library(rsconnect)


source("app_server.R")

co2_df <- read_csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

text_page <- tabPanel(
  titlePanel("Introduction"),
  p("Human emissions of carbon dioxide have majorly contributed to climate change
  which has quickly become one of the world's most important and urgent problems. 
  There are many steps that need to be taken in order to combat climate change
  with the first being recognizing that it is a real issue. This shiny application
  utilizes data from \"Our World in Data\" and looks at carbon dioxide emissions
  per capita. The visualization is organized by country and year, and the emissions
  are measured in tonnes per person. An interesting note from the dataset is 
  that although the United States' highest emissions ever were from the year 2005
  the year in which the world produced the most carbon dioxide was 2021. Alongside
  that, the country with the largest growth of carbon dioxice emission in the most 
  recent year was China, producing 8.046 tonnes per person.")
)
chart_2 <- tabPanel(
  titlePanel("Interactive Visualization"),
  sidebarLayout(
    sidebarPanel(
      selectInput(inputId = "country", label = "First Country",
                  choices = unique$country, multiple = FALSE),
      sliderInput("slider", label = ("Year Range"), min = 1750,
                  max = 2021, value = c(1950, 2021)),
      ),
  
    mainPanel(
      
      h3("CO2 Emissions per Capita By Year"),
      plotlyOutput("graph"),
      p("This graph shows CO2 emissions per capita by country yearly. Through 
        this visualization, one can compare the average emissions per person 
        of selected countries. An interesting thing to note is that the population
        of a country does not really have any correlation to how much CO2 an average
        person emits in a given year."),
    )
  )
)

ui <- navbarPage(
  theme = shinytheme("cyborg"),
  "Ethan Kim Assignment 5 Section AH",
  text_page,
  chart_2
)
