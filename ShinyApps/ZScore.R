#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
# Define UI for application that draws a histogram
ui <- fluidPage(
    sliderInput("z", #InputID
        label = "Change sample size", #ID on app
        min = 1,
        max = 100000,
        value = 1),
    textOutput("zvalue") #PlotNameInServer
)

# Define server logic required to draw a histogram
# Define server logic required to draw a histogram
server <- function(input, output, session) {
    
    # output$normaldistribution <- renderPlot({
    #     ggplot(data = NULL, aes(x=(rnorm(input$norm)))) + 
    #         geom_density() #InputID
    
    output$zvalue <- renderText({
        (input$z - mean(1:100000))/(sd(1:100000)) 
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
