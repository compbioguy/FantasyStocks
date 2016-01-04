library(quantmod)
test <- list()
options(scipen=1000)

shinyServer(function(input, output) {
  #output$plot <- renderPlot({
  #  data <- getSymbols(input$symb, src = "yahoo", 
  #    from = input$dates[1],
  #    to = input$dates[2],
  #    auto.assign = FALSE)
  #  chartSeries(data, theme = chartTheme("white"), 
  #    type = "line", log.scale = input$log, TA = NULL)
  #})
  
  output$plot <- renderPlot({
  	#output$symbs <- as.list(unique(c(symbs, input$symb)))
  	#print(test)
  	if(input$symb != ""){
		test <<- as.list(unique(c(test, input$symb)))
	}
  	#print(test)
  	final <- c()
  	selected <- unique(c(input$symb, input$symbols))
  	print(selected)
    #data <- getSymbols(input$symb, src = "yahoo", 
    for(i in 1:length(test)){
       if(test[[i]] %in% selected){
		   data <- getSymbols(test[[i]], src = "yahoo", 
		   from = input$dates[1],
		   to = input$dates[2],
		   auto.assign = FALSE)
		   final <- cbind(final, data[ , paste(test[[i]], ".Close", sep="")])
		}
	}
    #print(final)
    matplot(final, main="", type="l", xaxt="n", ylab="")
    print(input$symbols)
    output$selectedSymbols <- renderUI({
  		checkboxGroupInput("symbols", "Show", test, selected=selected)		
	})
	})
  
  
})

    #data <- getSymbols(c("GOOG", "AME", src = "yahoo", 
