
server = shinyServer(function(input, output,session) {

  
#=============== Starting aplication =====================
  
  #=====init select trends=======
  observe({
    trends = getTrends(woeid = 23424768)
    updateSelectInput(session,"AssuntoTwi",choices = trends$name)
  })
  #==============================
  
#=========================================================
  
  
  
#============== Charts ===================================
  
  #=== charts init ===
  observe({
    if(input$AssuntoTwi != ""){
      ##Geting twiites
      
      if(input$insertTwi != ""){
        twi = searchTwitter(input$insertTwi, n = 200)  
      }
      else{
        twi = searchTwitter(input$AssuntoTwi, n = 200)  
      }
      
      #===Render charts====
      output$pieplot = renderPlotly({
        data = pieService(twi)
        chart.pie(data = data)
      })
      
      output$wordcloudchart = renderPlot({
        data = wordcloudservice(twi)
        chart.word(data)
      })
      #=====Render table====
      output$tabletwittes = DT::renderDataTable({
        data = classification(Twittes = twi)
        data
      })
    }
    
  })
  
})
