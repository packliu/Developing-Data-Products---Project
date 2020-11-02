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

    #build the model to predict horsepower from pmg
    model1<-lm(hp~mpg, data=mtcars)
    
    model1pred<-reactive({
        mpgInput<-input$box1
        predict(model1, newdata=data.frame(mpg=as.numeric(mpgInput)))
    })
    
    #build the model to predict mph from wt
    model2<-lm(mpg~wt, data=mtcars)
    
    model2pred<-reactive({
        mpgInput<-input$box2
        predict(model2, newdata=data.frame(wt=as.numeric(mpgInput)))
    })
    
    output$plot1 <- renderPlot({
        mpgInput<-input$box1
        plot(mtcars$mpg, mtcars$hp, xlab="miles per gallon", 
             ylab="horsepower", pch=16)
        if(input$showModel1){
            abline(model1, col="red",lwd=1)
        }
        legend("topright", pch=3, legend=c("model prediction"), col=c("red"))
        points(mpgInput, model1pred(), col = "red", pch=16, cex=2)
        output$pred1 <- renderText({
            model1pred()
        })
    })
    
    output$plot2 <- renderPlot({
        mpgInput<-input$box2
        plot(mtcars$wt, mtcars$mpg, xlab="weight (/1000 lbs)", 
                ylab="miles per gallon", pch=16)
        if(input$showModel2){
            abline(model2, col="blue",lwd=1)
        }
        legend("topright", pch=1, legend=c("model prediction"), col=c("blue"))
        points(mpgInput, model2pred(), col = "blue", pch=16, cex=2)
        output$pred2 <- renderText({
            model2pred()
        })
    })
        
  })

    
