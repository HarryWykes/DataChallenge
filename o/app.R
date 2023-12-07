
#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(this.path)

fit <- read.csv(paste0(this.dir(), "/clean/cleaned_heart.csv"))

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Levels of Cholesterol on Heart Disease (0/1)"),
  
  # Flexible fluid row with narrow column for slider input for number of bins 
  fluidRow(
    column(width=4,
           sliderInput("bins",
                       "Number of bins:",
                       min = 1,
                       max = 50,
                       value = 30), 
           radioButtons("variablechoice", "Choice of variable:", 
                        choices = c("ChestPainType", "RestingBP", "Cholesterol", 
                                    "FastingBS"))
    ),
    
    # Show a plot of the generated distribution
    column(width=8,
           plotOutput("distPlot")
    )
  ),
  
  # A new row for the data table
  fluidRow(
    column(width=12,
           dataTableOutput("dat_table")
    )
  )
)




# Define server logic required to draw a histogram
server <- function(input, output) {
  
  # Render the plot
  output$distPlot <- renderPlot({
    
    ggplot(cleaned_heartdata, aes(x=Cholesterol, 
                                  colour=HeartDisease, 
                                  fill=HeartDisease)) +
      geom_histogram(alpha=0.5, position="identity", bins=input$bins) +
      facet_grid(HeartDisease ~ .) + xlab("Cholesterol")
    
  })
  
  # Render the table
  output$dat_table <- renderDataTable(cleaned_heartdata, options=list(pageLength=10))
}

# Run the application 
shinyApp(ui = ui, server = server)