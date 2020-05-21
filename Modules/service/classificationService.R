#Funcao para a classificacao de sentimentos
#@Retorna um objeto do tipo dataframe com frases e sentimento
classification = function(Twittes){
  
  ##Carregando dados para classificacao
  data("oplexicon_v3.0")
  data("sentiLex_lem_PT02")
  
  op30 = oplexicon_v3.0
  sent = sentiLex_lem_PT02
  
  ##Preparando dados
  TwittesData = preparar.dados.percorrer(Twittes)
  df_comments = TwittesData %>% mutate(comment_id = row_number()) %>%
    select(c("comment_id","text"))
  
  ##Tokkenizacao
  df = df_comments %>% unnest_tokens(term, text)
  
  ##Classificacao
  df_comments_unnested <- df %>% 
    inner_join(op30, by = "term") %>% 
    inner_join(sent %>% select(term, lex_polarity = polarity), by = "term") %>% 
    group_by(comment_id) %>% 
    summarise(
      comment_sentiment_op = sum(polarity),
      comment_sentiment_lex = sum(lex_polarity),
      n_words = n()
    ) %>% 
    ungroup() %>% 
    rowwise() %>% 
    mutate(
      most_neg = min(comment_sentiment_lex, comment_sentiment_op),
      most_pos = max(comment_sentiment_lex, comment_sentiment_op)
    )
  
  ##Resultado
  result = df_comments %>% inner_join(
    df_comments_unnested %>% select(comment_id, sentiment = comment_sentiment_op),
    by = "comment_id"
  ) %>% filter(sentiment != 0) %>%
    mutate(sentiment = ifelse(sentiment < 0,"negativo","positivo"))
  
  return(result)
  
}
