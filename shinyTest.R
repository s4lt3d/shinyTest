library("shiny")

ui <- fluidPage(
	sliderInput(inputId = "num",
	label="Choose a number", 
	value = 25,
	min = 1,
	max = 100000),
	plotOutput("hist")
)

server <- function(input, output) {
	output$hist <- renderPlot({
	title <- "Variable random values"
	plot(rnorm(input$num), main = title)
	})
}

shinyApp(ui=ui, server=server, options = list(port=80, host="0.0.0.0"))
