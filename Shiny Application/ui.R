#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny) 

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("data (mtcars) model prediction"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            textInput("box1", "enter mpg in range of (10, 35)", value=20),
            textInput("box2", "enter wt in range of (1.5, 5.5) *1000lbs", value=3),
            #sliderInput("sliderMPG", "Number of MPG:", 10, 35, value = 20),
            checkboxInput("showModel1", "Show/Hide Model1", value = TRUE),
            checkboxInput("showModel2", "Show/Hide Model2", value = TRUE)
            #submitButton("submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            tabsetPanel(type="tabs",
                        tabPanel("tab 1", br(), plotOutput("plot1"),
                                 h3("Predicted horsepower from mpg"),
                                 textOutput("pred1")),
                        tabPanel("tab 2", br(), plotOutput("plot2"),
                                 h3("Predicted mpg from wt"),
                                 textOutput("pred2"))
            )
            
        )
    )
))


