# This is your app's code.

library(shiny)

# UI part: What the user will see
ui <- fluidPage(
  titlePanel("My First Shiny App"),  # App title
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",  # Input widget: A slider for "bins"
                  "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
    ),
    mainPanel(
      plotOutput("distPlot")  # Output: A plot that changes when you adjust the slider
    )
  )
)

# Server part: What the app does
server <- function(input, output) {
  output$distPlot <- renderPlot({
    x <- faithful$eruptions  # Built-in data: Geyser eruption times
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    hist(x, breaks = bins, col = 'blue', border = 'white', main = "Histogram of Eruptions")
  })
}

# Run the app
shinyApp(ui = ui, server = server)
