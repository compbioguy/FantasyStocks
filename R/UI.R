library(shiny)

shinyUI(fluidPage(
  titlePanel("Fantasy Stocks"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select a stock"),
    
      textInput("symb", "Symbol", "GOOG"),
    
      dateRangeInput("dates", 
        "Date range",
        start = "2013-01-01", 
        end = as.character(Sys.Date())),
      
      br(),
      br(),
      
      checkboxInput("log", "Plot y axis on log scale", 
        value = FALSE)
      
    ),
    
    mainPanel(
    	plotOutput("plot"),
    	#conditionalPanel(
  		#	condition = "symb.value == 'GOOG'",
  		#	checkboxInput("headonly", "Only use first 1000 rows")),
  		uiOutput("selectedSymbols"),
  		uiOutput("textBoxes")
  	)
  )
))