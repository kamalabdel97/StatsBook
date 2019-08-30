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
ui <- fluidPage(
    sliderInput("norm", #InputID
        label = "Change sample size", #ID on app
        min = 1,
        max = 100000,
        value = 1),
    plotOutput("normaldistribution") #PlotNameInServer
    )

# Define server logic required to draw a histogram
server <- function(input, output, session) {
    
    output$normaldistribution <- renderPlot({
        ggplot(data = NULL, aes(x=(rnorm(input$norm)))) + 
            geom_histogram(aes(fill = ..count..), binwidth = .001) + 
            scale_fill_gradient(low = "orange", high = "maroon")
    })
}

# output$normaldistribution <- renderPlot({
#     ggplot(data = NULL, aes(x=(rnorm(input$norm)))) + 
#         geom_histogram(aes(fill = ..count..)) #InputID


# Run the application 
shinyApp(ui = ui, server = server)
