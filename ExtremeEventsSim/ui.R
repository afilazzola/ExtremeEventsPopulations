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
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
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
                value = 100)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("normal"),
            plotOutput("extreme")
        )
    )
))