#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(
  
  selectInput ("selection", "Number of bins in histgram (approximate):", 
               c(10,20,35,50), 20 ),
  checkboxInput("checkbox1", "Showindividual observations"),
  checkboxInput("checkbox2", "Show density estimate"),
  plotOutput("plot"),
  
  conditionalPanel(condition = "input.checkbox2 == true", 
                   sliderInput ("BandWidth","BandWidth adjustment:", min = 0.2,
                                max = 2, value = 1))
  
  
  
))
