#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   

    output$plot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2] 
    bins <- seq(min(x), max(x), length.out = as.numeric(input$selection) + 1)
    
    # draw the histogram with the specified number of bins
    hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    if (input$checkbox1 ) {
            rug(x)
    }
    
    if(input$checkbox2) {
            dens <- density(x, adjust = input$BandWidth)
            lines(dens, col = "blue")
    }
    
  })
  
})
