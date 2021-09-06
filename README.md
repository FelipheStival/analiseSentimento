# Aplicativo para análise de sentimentos
Aplicativo para análise de sentimentos utilizando Machine Learning (NLP)

# Sumário

<!--ts-->
   1. [Sumário](#Sumário)
   2. [Pré-requisitos](#Pré-requisitos)
   3. [Instalação](#Instalação)
   4. [Execução e objetivo][#Execução]
<!--te-->

# Pré-requisitos

Antes de começar, você precisa ter instalado em sua máquina as seguintes ferramentas: <br>

<!--ts-->
   1. [R](#1-R)
   2. [RStudio](#2-RStudio)
<!--te-->

### 1. R
Caso você não tenha o R instalado, você pode obter o mesmo pelo seguinte link: <br>
https://www.r-project.org/ 

### 2. RStudio 
Depois de instalar o R, você deve instalar o RStudio para executar o código, o RStudio pode ser encontrado no seguinte link: <br>
https://www.rstudio.com/products/rstudio/download/ 

# Instalação

Para realizar a instalado você precisa realizar os seguintes passos.

<!--ts-->
   1. [Obter chave de acesso Twitter](#1-Chave-acesso)
   2. [Configurar chave da API no aplicativo](#2-Configurar-API-no-codigo)
<!--te-->

### 1. Chave-acesso

Para obter a chave de acesso para a API do facebook, você deve acessar o endereço: https://developer.twitter.com/en/docs/twitter-api, depois de realizar o cadastro você deve solicitar ao Twitter acesso a API e esperar o acesso ser liberado.

### 2. Configurar API no codigo

Depois de obter a chave de acesso para a API do Twitter, você precisa acessar o arquivo Modules/globals.R e configurar as variáveis globais. Você encontrara o arquivo nesse formato e deve editar as variáveis de acordo com suas informaçoes de acesso.

```r
#=================Configuracao interface============================
NOME_APLICACAO = "APS-2020"
#===================================================================


#=================Configuracao API twitter==========================
api_key             = ""
api_secret          = ""
access_token        = ""
access_token_secret = ""
#===================================================================
```

# Execução

Depois de ter instalado basta executar o programa pelo RStudio. O programa possui uma dashboard web onde o usuário pode digitar o assunto e o programa irá pesquisar os Twitter atráves da API e retornar uma análise de sentimento que pode ser análisada por meios de gráficos interativos.

