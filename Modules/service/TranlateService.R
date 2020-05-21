#Prepara dados removendo caracteres especiais
#@param twi string com twitter
preparar.dados.string = function(twi){
  
  twi = rm_accent(twi)
  clean_tweet = gsub("&amp", "",twi)
  clean_tweet = gsub("[^\x01-\x7F]", "", clean_tweet)
  clean_tweet = gsub("(RT|via)((?:\\b\\W*@\\w+)+)", "", clean_tweet)
  clean_tweet = gsub("@\\w+", "", clean_tweet)
  clean_tweet = gsub("[[:punct:]]", "", clean_tweet)
  clean_tweet = gsub("[[:digit:]]", "", clean_tweet)
  clean_tweet = gsub("http\\w+", "", clean_tweet)
  clean_tweet = gsub("[ \t]{2,}", "", clean_tweet)
  clean_tweet = gsub("^\\s+|\\s+$", "", clean_tweet) 
  clean_tweet = gsub("\n","",clean_tweet)
  
  
  return(clean_tweet)
}

#Percorre todas as linhas da lista e retorna string para analise
#@param TwiData lista com twittes
preparar.dados.percorrer = function(TwiData){
  Finaldata = NULL
  for(i in 1:length(TwiData)){
    Convert = as.data.frame(TwiData[[i]])
    Text = preparar.dados.string(Convert$text)
    Text = Text[[1]]
    Finaldata = rbind(Finaldata,Text)
  }
  rownames(Finaldata) = NULL
  Finaldata = as.data.frame(Finaldata)
  colnames(Finaldata) = c("text")
  Finaldata$text = as.character(Finaldata$text)
  
  return(Finaldata)
}
