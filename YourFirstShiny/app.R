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
my_ui <- fluidPage(

    # Application title
    titlePanel("Welcome to Shiny!"),
    
    # these headings are STATIC (they don't change)
    h2("This is a basic shiny application"),
    
    # this creates an input, assigned to the label username in the input object
    textInput(inputId = "Tamyaq", label = "Tamana Yaqoubi"),
    
    # this creates an output
    textOutput(outputId = "This is so much fun!")
)

# The server is a function that takes input and output as arguments 
my_server <- function(input, output) {

    # this is assigning a value to the message part of the output
    # using renderText(), so the UI can display it! 
    # it will be automatically recalculated when the value changes
    output$message <- renderText({
        message_str <- paste("Hello,", input$username, ", how are you?") # Using the input!
        message_str # the last line gets returned
    })
}

# Run the application 
shinyApp(ui = my_ui, server = my_server)
