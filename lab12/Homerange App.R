library("tidyverse")
library("shiny")

homerange <- readr::read_csv("data/Tamburelloetal_HomeRangeDatabase.csv")

library(shiny)

ui <- fluidPage(
  radioButtons("x", "Select X Variable", choices = c("trophic.guild", "thermoregulation"), 
               selected = "trophic.guid"),
  plotOutput("plot", width = "500px", height = "400px")
)

server <- function(input, output) {
  output$plot <- renderPlot({
    ggplot(data = homerange, aes_string(x="locomotion", fill = input$x))+
      geom_bar(position = "dodge", alpha = 0.6, color = "black")+
      theme_linedraw(base_size = 18)+
      labs(x = NULL, 
           y= NULL,
           fill = "Fill Variable")
  })
}

shinyApp(ui, server)