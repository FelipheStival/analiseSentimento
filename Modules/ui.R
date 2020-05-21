
ui = navbarPage("APS-2020",
                 theme = shinytheme("flatly"),
                 tabPanel("Sentimentos",
                          sidebarLayout(
                             sidebarPanel(
                                tags$h4("Escolha o assunto"),
                                tags$hr(),
                                selectInput("AssuntoTwi","Escolha o assunto",choices = NULL),
                                tags$h4("ou digita para pesquisar"),
                                tags$hr(),
                                textInput("insertTwi","Digite o assunto")
                             ),
                             mainPanel(
                                tabsetPanel(
                                   tabPanel("Grafico pizza", withLoader(plotlyOutput("pieplot",width = "100%",height = "80vh"),type = "html",loader = "loader5")), 
                                   tabPanel("Word Cloud",withLoader(plotOutput("wordcloudchart",width = "100%",height = "80vh"),type = "html",loader = "loader5")), 
                                   tabPanel("Tabela Twittes",dataTableOutput("tabletwittes"))
                                )
                             )
                          )
                     ),
                 tabPanel("Rede")
)