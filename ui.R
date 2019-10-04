library(shiny)

shinyUI(fluidPage(
  
  HTML("<script src='https://cc.cdn.civiccomputing.com/8/cookieControl-8.x.min.js'></script>"),
  HTML("<script async src='https://www.googletagmanager.com/gtag/js?id=UA-91956629-1'></script>"),
  tags$script(src = "cookie_control_config.js"),
  
  titlePanel("How to add Cookie Control to an R Shiny app"),
  
  h5("This is a minimal example of a Shiny app using Cookie Control (look at the bottom right corner of the screen)."),
  a(href = "https://github.com/DataScienceScotland/shiny_cookies", "R code and instructions")
  
))