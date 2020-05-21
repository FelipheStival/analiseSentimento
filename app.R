
#==============================================#
# Carregando pacotes a serem utilizados
app.LoadPackages = function() 
{
  
  require(openssl)
  require(base64enc)
  require(shiny) 
  require(ggplot2) 
  require(stringr)
  require(twitteR)
  require(abjutils)
  require(plotly)
  require(shinythemes)
  require(shinycustomloader)
  require(lexiconPT)
  require(tidytext)
  require(dplyr)
  require(tm)
  require(SnowballC)
  require(wordcloud)
  require(DT)
  
}
#==============================================#

#==============================================#
# Compilando arquivos
app.CompileModules = function() {
  
  require(compiler)
  
  modulos = list.files(pattern = ".R$", recursive = T, full.names = T)
  app.index = grep("app.R", modulos)
  modulos = modulos[-app.index]
  
  log = sapply(modulos, function(m.in) {
    m.out = strsplit(m.in, split = "\\.")[[1]]
    m.out[length(m.out)] = 'Rc'
    m.out = paste(m.out, collapse = ".")
    cmpfile(m.in, m.out)     
  })
}
#==============================================#

#==============================================#
# Carregando arquivos compilados
app.LoadModules = function() {
  
  require(compiler)
  
  modulos = list.files(pattern = ".Rc$", recursive = T, full.names = T)
  log = sapply(modulos, loadcmp)
}
#==============================================#

#==============================================#
# Removendo arquivos compilados
app.ResetModules = function() {
  modulos = list.files(pattern = ".Rc$", recursive = T, full.names = T)
  log = sapply(modulos, unlink)
}


#Inicia setup
app.init = function(){
  
  #Setup twitter
  setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)
  
}

#==============================================#

app.LoadPackages()
app.ResetModules()
app.CompileModules()
app.LoadModules()
app.init()

shinyApp(ui, server)

