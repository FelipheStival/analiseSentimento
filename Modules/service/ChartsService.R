#Prepara os dados para a rendenizacao do grafico de pizza
#recebe como parametro um objeto class s4 
pieService = function(Twittes){
  
  data = classification(Twittes)
  dataCont = data %>%
    group_by(sentiment) %>%
    summarise(count = length(sentiment))
  
  dataCont = as.data.frame(dataCont)
  
  return(dataCont)
}

#Prepara os dados para a geracao do wordcloud
#Rrecebe como parametro objeto class s4
wordcloudservice = function(Twittes){
  data = preparar.dados.percorrer(Twittes)
  auxCorpus = Corpus(VectorSource(data$text))
  auxCorpus = tm_map(auxCorpus, removePunctuation) 
  auxCorpus = tm_map(auxCorpus, removeWords, stopwords('pt'))
  auxCorpus = tm_map(auxCorpus, stemDocument)
  
  return(auxCorpus)
}
