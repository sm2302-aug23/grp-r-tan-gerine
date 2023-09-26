library(DescTools)
library(shiny)
library(networkD3)

# Define the UI for the Shiny app
ui <- fluidPage(
  titlePanel("Collatz Conjecture Visualization"),
  sidebarLayout(
    sidebarPanel(
      numericInput("start_integer", "Enter a starting integer:", value = 6),
      actionButton("animate_button", "Animate")
    ),
    mainPanel(
      d3NetworkOutput("collatz_network")
    )
  )
)

# Define the server logic
server <- function(input, output) {
  
  observeEvent(input$animate_button, {
    start <- input$start_integer
    collatz_sequence <- generate_collatz_sequence(start)
    
    output$collatz_network <- renderD3Network({
      # Create an interactive network graph
      forceNetwork(
        Links = collatz_sequence,
        Source = "value",
        Target = "next_value",
        NodeID = "value",
        Group = "group",
        width = 800,
        height = 400
      )
    })
  })
}

# Run the Shiny app
shinyApp(ui, server)

# Function to generate Collatz sequence
generate_collatz_sequence <- function(start) {
  sequence <- data.frame(
    value = numeric(0),
    next_value = numeric(0),
    group = numeric(0)
  )
  
  while (start > 1) {
    next <- ifelse(start %% 2 == 0, start / 2, 3 * start + 1)
    sequence <- rbind(sequence, data.frame(value = start, next_value = next, group = ifelse(start %% 2 == 0, "Even", "Odd")))
    start <- next
  }
  
  return(sequence)
}
