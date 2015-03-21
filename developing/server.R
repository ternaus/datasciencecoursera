library(shiny)

weight.from.height <- function(height.inches) {
  #Use women dataset that describes Average Heights and Weights for American Women  
  weight <- predict(lm(weight ~ height, data=women), data.frame(height=height.inches))
  return(as.numeric(weight))
}

shinyServer(
  function(input, output) {
    output$result <- renderPrint(weight.from.height(input$inches))
  }
  )