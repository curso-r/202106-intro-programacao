# Carregando pacotes ------------------------------------------------------

library(readr)

# Carregando os dados -----------------------------------------------------

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

# Controle de fluxo -------------------------------------------------------

# É muito comum usarmos operadores lógicos para fazer os nossos códigos 
# tomarem decisões.
# Para isso, utilizamos os controladores de fluxo.

# if: faz uma ação se a condição for atendida

# estrutura:
# if(CONDICAO) {
# ACAO
# }


x <- 1

if(x == 2) {         
  Sys.time()    
}

# if/else: faz uma ação se as condições anteriores não forem atendidas.

x <- -1

if(x < 0){
  print("negativo")
} else {
  print("não negativo")
}

# else-if: generaliza o comportamento do if

x <- 0

if(x < 0) {
  "negativo"
} else if(x == 0) {
  "neutro"
} else {
  "positivo"
}

# Mais um exemplo de if! Contagem regressiva para o carnaval!

hoje <- Sys.Date()
carnaval <- as.Date("2021-02-16")

dias_para_carnaval <- as.numeric(carnaval - hoje) 

if(hoje < carnaval){
  
  paste("Faltam", dias_para_carnaval, "dias para o carnaval!")
  
} else if(hoje == carnaval){
  
  "Hoje é carnaval!"
  
} else {
  
  "O carnaval de 2021 já passou... agora só ano que vem!"
  
}

# Exercícios --------------------------------------------------------------

# 1. Imagine que você é uma pessoa professora, e quer usar o R para saber
# se as pessoas alunas foram aprovadas ou não na disciplina,
# segundo a nota final.
# Usando o if, preencha os campos com ... abaixo para que o if retorne:
# aprovada se tiver nota maior  ou igual a 5,
# reprovada se tiver nota menor que 3,
# e recuperação se tiver nota maior que 3 e menor que 5.


nota <- 10

if(nota >= 5){
  
  print("Parabéns! Você passou!")
  
} else if(nota < 3) {
  
  print("Reprovada")
  
} else {
  # 3 <= nota < 5
  
  print("Que pena, mas ainda dá tempo de recuperar. A prova de recuperação é no dia X/Y")
}

# 2. Continuando o exercício anterior: 
# Depois de preencher os campos, teste o código com diferentes notas!
# O que o código retorna é coerente com a nota que você passou?


1
3
5
6
10


# Voltando a falar sobre tabelas!  ------------------------------------

# Vamos carregar mais uma base! Voos de fevereiro

base_de_dados_fev <- read_csv2("dados/voos_de_fevereiro.csv")

head(base_de_dados_fev)

# Queremos juntar as bases com dados de janeiro em fevereiro, e uma única base.
# a base contém as mesmas colunas!
# usar a funcao rbind() (de row bind)

base_jan_fev <- rbind(base_de_dados, base_de_dados_fev)

# E se eu quiser adicionar uma nova coluna? 
# cbind()   (de column bind)

nome_mes <- "janeiro"
cbind(base_de_dados, nome_mes)

# Valores especiais -------------------------------------------------------

# Existem valores reservados para representar dados faltantes,
# infinitos, e indefinições matemáticas.

NA   # (Not Available) significa dado faltante/indisponível.

NaN  # (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1).
# Um NaN é um NA, mas a recíproca não é verdadeira.

Inf  # (Infinito) é um número muito grande ou o limite matemático, por exemplo,
# 1/0 e 10^310. Aceita sinal negativo -Inf.

NULL # representa a ausência de objeto (no R).

# Comparações lógicas

idade_ana <- 30
idade_beto <- NA
idade_carla <- NA

idade_ana == idade_beto

idade_beto == idade_carla

5 == NA

# Use as funções is.na(), is.nan(), is.infinite() e is.null()
# para testar se um objeto é um desses valores.

x <- NA
is.na(x)

0/0
log(-1)

0/0 == NaN
is.nan(0 / 0)

2^(9999999999999999999999999999999)

1/Inf

idades + 1
idades - 1

mean(idades)

mean(idades, na.rm = TRUE)

idades <- c(15, 64, 31, NA, 59)
is.na(idades)

is.nan(NaN)
is.infinite(10 ^ 309)
is.null(NULL)

# Dataframes e funções ------------

# E se quisermos calcular coisas com a coluna atraso_chegada?

sum(base_de_dados$atraso_chegada) 

# A coluna atraso_chegada possui NA, por isso a soma dela será NA!

# Verificando os NA:

is.na(base_de_dados$atraso_chegada) # retornará um vetor com TRUE e FALSE,
# sendo que TRUE representa a presença de NA.

sum(is.na(base_de_dados$atraso_chegada)) # Quantos NA tem na coluna?
# Assim somaremos quantos NA tem na coluna,
# pois cada TRUE (presença de NA) será contabilizado como 1.

mean(is.na(base_de_dados$atraso_chegada))

# ... e se quisermos ignorar o NA? 
# Algumas funções possuem um argumento para remover os NA:
# na.rm = TRUE

# Qual é a soma ....?
sum(base_de_dados$atraso_chegada, na.rm = TRUE)

# Menor valor encontrado: o menor número encontrado na coluna
min(base_de_dados$atraso_chegada, na.rm = TRUE)

# Maior valor encontrado: o maior número encontrado na coluna
max(base_de_dados$atraso_chegada, na.rm = TRUE)

# Média 
mean(base_de_dados$atraso_chegada, na.rm = TRUE)

# Mediana 
median(base_de_dados$atraso_chegada, na.rm = TRUE)

# Variância
var(base_de_dados$atraso_chegada, na.rm = TRUE)

# Desvio padrão
sd(base_de_dados$atraso_chegada, na.rm = TRUE)


# Exercícios ------------------------------------------
# 1. Calcule o valor mínimo e valor máximo da coluna "atraso_saida". O que 
# esses valores significam?

max(base_de_dados$atraso_saida, na.rm = TRUE)
min(base_de_dados$atraso_saida, na.rm = TRUE)

base_de_dados$origem


# exemplo

library(dplyr)

origem_referencia <- "EWR"

aeroporto_referencia <- filter(base_de_dados, origem == origem_referencia)

media_atraso_aeroporto_referencia <- mean(aeroporto_referencia$atraso_saida, na.rm = TRUE) 

library(readr)

write_csv2(base_de_dados, "exportacao.csv")

origem_referencia <- "JFK"

if(origem_referencia == "EWR"){
  
  base_de_dados_de_referencia <- filter(base_de_dados, origem == origem_referencia)
  
  media_de_referencia <- mean(base_de_dados_de_referencia$atraso_saida, na.rm = TRUE)
  
  print(paste0("A média de atraso no aeroporto de Newark é ", media_de_referencia))
  
} else if (origem_referencia == "JFK"){
  
  base_de_dados_de_referencia <- filter(base_de_dados, origem == origem_referencia, 
                                        dia == 17)
  
  media_de_referencia <- mean(base_de_dados_de_referencia$atraso_saida, na.rm = TRUE)
  
  print(paste0("A média de atraso no aeroporto JFK no dia 17 é ", media_de_referencia))
}
