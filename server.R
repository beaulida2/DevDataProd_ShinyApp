library(shiny)
library(datasets)
data(women)

shinyServer(
  function(input, output) {
    output$newPlot <- renderPlot({
      plot(women, xlab = "Height (in)", ylab = "Weight (lb)",
           main = "US women aged 30-39: Average heights and weights",
           col = 'lightblue', pch = 16, cex = 2, ylim = c(90, 250))
      height <- input$height
      weight <- input$weight
      points(height, weight, col = "red", pch = 4, cex = 5, lwd = 5)
    })
    output$newText <- renderText({
      if (input$height < 58 | input$height >72) "Sorry, you are not within average height!"
      else if (women$weight[women$height == input$height] < input$weight) "You are above average weight for your height!"
      else if (women$weight[women$height == input$height] > input$weight) "You are below average weight for your height!"
      else if (women$weight[women$height == input$height] == input$weight) "You are exactly average weight for your height!"
      })
    output$summary <- renderText({
      "This Shiny app is my course project for the Coursera Developing Data Products Course.
      This is a simple app that uses data from the R dataset 'women' that gives us the average
      heights and weights for American women aged 30-39. R documentation tells us that the dataset
      appears to have been taken from the American Society of Actuaries Build and Blood Pressure Study.
      This app allows you to enter your height (in) and weight (lb) measurements and will 
      plot your height and weight in relation to the average women's heights/weights and let you 
      know if you fall above or below the average weight measurement for you height according to
      the provided data. This app is just meant for fun and to practice using Shiny! Enjoy playing 
      around with it!"
    })
  }
)
