#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)
# Load Data
death_data <- read.csv("death_rate.csv",header = TRUE,sep = ";")
z=c("year","rate_of_deaths_per.1000","country")
names(death_data) <-  z
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("death_rate_for country egypt,europe,and america"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       selectInput("Country","Country",choices  =c("egypt" = "egypt",
                                                  "europe" = "europe",
                                                  "america"="america"
                                                                   ))),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotlyOutput("DeathRate"),
      verbatimTextOutput("hover"),
      verbatimTextOutput("click"),
      verbatimTextOutput("brush"),
      verbatimTextOutput("zoom")
       
       #verbatimTextOutput("event")
    )
  )
))
