#
# This is the server logic of a Shiny web application. 
#

library(shiny)
library(tidyverse)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$normal <- renderPlot({
        
        ## Specify randomization
        set.seed(11)
        
        ## Random random climate variation
        Rclim <- rnorm(50, mean=0, sd=0.3)
        
        ## Specify inputs
        N0 <- input$Ninitial
        r <- input$rgrowth
        K <- input$Kcapacity
        
        
        ## Create simulated population
        simPop <- data.frame( "date"=seq(from=as.Date("1971-01-01"), to=as.Date("2020-01-01"),by="year") ,
                              abundance= dNt(N0 = N0,  r = r , K = K, iter=50, Rclim=Rclim),
                              abundanceExt= dNtExtreme(N0 = N0,  r = r , K = K, iter=50, Rclim = Rclim))
        
        
        ### Plot population without extreme event
        ggplot(simPop , aes(x=date, y=abundanceExt)) + geom_line() + geom_vline(xintercept=as.Date("1990-01-01"), color="orange",lwd=1) + theme_classic()
        
})
    output$extreme <- renderPlot({
        
        ## Specify randomization
        set.seed(11)
        
        ## Random random climate variation
        Rclim <- rnorm(50, mean=0, sd=0.3)
        
        ## Specify inputs
        N0 <- input$Ninitial
        r <- input$rgrowth
        K <- input$Kcapacity
        
        
        ## Create simulated population
        simPop <- data.frame( "date"=seq(from=as.Date("1971-01-01"), to=as.Date("2020-01-01"),by="year") ,
                              abundance= dNt(N0 = N0,  r = r , K = K, iter=50, Rclim=Rclim),
                              abundanceExt= dNtExtreme(N0 = N0,  r = r , K = K, iter=50, Rclim = Rclim))
        
        
        ### Plot population with extreme event
        ggplot(simPop , aes(x=date, y=abundanceExt)) + geom_line() + geom_vline(xintercept=as.Date("1990-01-01"), color="orange",lwd=1) + 
            theme_classic()
        
    
    })

})
