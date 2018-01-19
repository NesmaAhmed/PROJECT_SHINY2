#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(plotly)

death_data <- read.csv("death_rate.csv",header = TRUE,sep = ";")
z=c("year","rate_of_deaths_per.1000","country")
names(death_data) <-  z
# Define server logic required to draw a histogram
shinyServer(function(input, output,session) {
  
  get_data <- reactive({
    death_data=death_data[death_data$country==input$Country,1:2]
  
  })
 
  output$DeathRate <- renderPlotly({
    data2=get_data()
    x=data2[,1]
    print(x)
    y=data2[,2]
  # print(data2)
  d= plot_ly(
     x = x,
     y = y,
     name = "SF Zoo",
     type = "bar"
   )
   
  })
 
  
  output$hover <- renderPrint({
    d <- event_data("plotly_hover")
    if (is.null(d)) "Hover events appear here (unhover to clear)" else d
  })
  
  output$click <- renderPrint({
    d <- event_data("plotly_click")
    if (is.null(d)) "Click events appear here (double-click to clear)" else d
  })
  
  output$brush <- renderPrint({
    d <- event_data("plotly_selected")
    if (is.null(d)) "Click and drag events (i.e., select/lasso) appear here (double-click to clear)" else d
  })
  
  output$zoom <- renderPrint({
    d <- event_data("plotly_relayout")
    if (is.null(d)) "Relayout (i.e., zoom) events appear here" else d
  })
  
  
})
