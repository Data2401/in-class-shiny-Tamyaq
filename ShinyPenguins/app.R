# Goal: Use the demo to make a plot of the starWars with selectInput for coloring the points


# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(plotly)
library(starwars)


color_options <- c("species", "gender", "homeworld")
axis_options <- c("height", "mass", "birth_year")


# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("StarWars!"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "color",
                        label = "Color your points by:",
                        choices = "species", "gender", "eye_color", "height"  ),
            selectInput(inputId = "x",
                        label = "Variable on the X axis:",
                        choices = "height", "mass", "birth_year", 
                        selected = "height"),
            selectInput(inputId = "y",
                        label = "Variable on the Y axis:",
                        choices = "height", "mass", "birth_year", 
                        selected = "mass"  )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("starwarsPlot"), 
           plotOutput("ColorPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  
    # color_choice <- reactive({get(input$color)})
    starwars <- starwars %>% mutate(gender = factor(gender))
    
    output$starwarsPlot <- renderPlot({
       p <- ggplot(starwars, aes(x = .data[[input$x]], y = .data[[input$y]], col = .data[[input$color]])) + geom_point()
       p
    })
    output$ColorPlot <- renderPlot(({
        p2 <- ggplot(starwars, aes(x = .data[[input$color]], fill =.data[[input$color]] )) + geom_bar()
        p2
    }))
}

# Run the application 
shinyApp(ui = ui, server = server)
