library(shiny)
library(datasets)

shinyUI(pageWithSidebar(
  headerPanel("Developing Data Products: Average heights and weights for US women"),
  sidebarPanel(
    h3('Your measurements'),
    numericInput('height', 'Enter your height in inches', 65, min = 48, max = 84, step = 1),
    numericInput('weight', 'Enter your weight in lbs', 135, min = 80, max = 600, step = 1)
    ),
  mainPanel(
    tabsetPanel(
      tabPanel("Overview", 
               textOutput('summary')),
      tabPanel("Results",
               h3("Ladies, let's see how you measure up!"),
               plotOutput('newPlot'),
               h3('Are you above or below average weight for your height?'),
               textOutput('newText'))
    )
  )))
             
