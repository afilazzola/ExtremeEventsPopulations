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
    titlePanel("Simluation of Population Extremes"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            
            numericInput("iter", label = h3("Number of Years"), value = 50),
            
            hr(),
            fluidRow(column(3, verbatimTextOutput("value"))),
            sliderInput("Ninitial",
                        "Initial Population Size:",
                        min = 1,
                        max = 500,
                        value = 20),
        sliderInput("rgrowth",
                    "Population growth rate:",
                    min = 0.5,
                    max = 3,
                    value = 0.2),
         sliderInput("Kcapacity",
                "Carrying Capacity:",
                min = 100,
                max = 1000,
                value = 500),
        sliderInput("climVar",
                    "Climate Variability:",
                    min = 0,
                    max = 1,
                    value = 0.2),
        downloadButton("demo", label = "Download Data"),
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("normal"),
            plotOutput("extreme")
        )
    )
))
