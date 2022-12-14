library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)
library(shinyWidgets)
library(rsconnect)



  co2_data <- read_csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")
  
  year_highest <- co2_data %>% 
    filter(co2 == max(co2, na.rm = TRUE)) %>%
    pull(year)
  
  us_emission <- co2_data %>%
    filter(country == "United States") %>%
    filter(co2 == max(co2)) %>%
    pull(year)
  
  biggest_co2_growth_2020 <- co2_data %>%
    filter(year == "2020") %>%
    filter(country != "World" & country != "Asia" & country != "Africa") %>%
    filter(co2_growth_abs == max(co2_growth_abs, na.rm = TRUE)) %>%
    pull(country)

  
  unique <- co2_data %>%
    filter(year == "2000")
  dates <- co2_data %>%
    filter(country == "China")
  
  shiny_server <- function(input, output) {
    
    plot <- function(country, year) {
      new_data <- co2_data %>%
        filter(country %in% input$country)
        filter(year %in% input$year)
        return(new_data)
    }
  
  output$graph <- renderPlotly({
    ggplot(plot(input$country)) +
      geom_line(aes(x = year, y = co2_per_capita, color = country),
               position = "dodge") +
      labs(x = "Year", y = "CO2 Emissions per Capita (Tonnes per Person)")
    
  })
  
}