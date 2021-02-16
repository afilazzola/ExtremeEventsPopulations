#
# This is the server logic of a Shiny web application. 
#

library(shiny)
library(tidyverse)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$normal <- renderPlot({
        
        ## Specify inputs
        N0 <- input$Ninitial
        r <- input$rgrowth
        K <- input$Kcapacity
        climVar <- input$climVar
        iter <- input$iter
        severe <- input$severe
        
        ## Range of years
        yearRange <- seq(as.Date("1971/01/01"), by = "year", length.out = iter)
        
        ## Specify randomization
        set.seed(11)
        
        ## Random random climate variation
        Rclim <- rnorm(iter, mean=0, sd=climVar)
        Rclim <- ifelse(Rclim == 0, 1, Rclim) ## specify if no climate variability
        
      
        
        
        ## Create simulated population
        simPop <- data.frame( "date"= yearRange ,
                              abundance= dNt(N0 = N0,  r = r , K = K, iter=iter, Rclim=Rclim),
                              abundanceExt= dNtExtreme(N0 = N0,  r = r , K = K, iter=iter, Rclim = Rclim, severity = severe))
        
        
        ### Plot population without extreme event
        ggplot(simPop , aes(x=date, y=abundance)) + geom_line() +  theme_classic() + ylab("Abundance")
        
})
    output$extreme <- renderPlot({
        
        ## Specify inputs
        N0 <- input$Ninitial
        r <- input$rgrowth
        K <- input$Kcapacity
        climVar <- input$climVar
        iter <- input$iter
        severe <- input$severe
        
        ## Range of years
        yearRange <- seq(as.Date("1971/01/01"), by = "year", length.out = iter)
        
        ## Specify randomization
        set.seed(11)
        
        ## Random random climate variation
        Rclim <- rnorm(iter, mean=0, sd=climVar)
        Rclim <- ifelse(Rclim == 0, 1, Rclim) ## specify if no climate variability
        
    
        
        
        ## Create simulated population
        simPop <- data.frame( "date"= yearRange ,
                              abundance= dNt(N0 = N0,  r = r , K = K, iter=iter, Rclim=Rclim),
                              abundanceExt= dNtExtreme(N0 = N0,  r = r , K = K, iter=iter, Rclim = Rclim, severity = severe))

        
        ### Plot population with extreme event
        ggplot(simPop , aes(x=date, y=abundanceExt)) + geom_line() + geom_vline(xintercept=as.Date("1990-01-01"), color="orange",lwd=1) + 
            theme_classic()+ ylab("Abundance")
        
    
    })
    output$demo <- downloadHandler(
        filename = paste0("SimPop", Sys.Date(), ".csv", sep="", row.names=F),
        content = function(file) {
            write.csv(simPop, file)
    })

})
