#Grafico de pizza
#@param data objeto do tipo dataframe
chart.pie = function(data){
  
  fig = plot_ly(data, labels = ~sentiment, values = ~count, type = 'pie') 
  return(fig)
  
}
#Grafico wordlista
#@param data objeto s4 com twittes
chart.word = function(data){
  fig = wordcloud(data)
  
  return(fig)
}