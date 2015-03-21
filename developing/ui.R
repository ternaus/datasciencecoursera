library(shiny)
shinyUI(
  pageWithSidebar(
    headerPanel("Weight esitmator for a female in US of a given height"),    
    sidebarPanel(            
      h4("Total height in"),      
      numericInput('inches', 'inches: ', 60)
    ),
  mainPanel(
    h4("Weight in pounds: "),
    verbatimTextOutput("result")
    )
  )
)