# objetivo da aula de hoje

# a partir disso
# tabela <- read_csv2("nome/do/arquivo")

# escrever um codigo que
# filtra_linhas(tabela)

# Carregando pacotes ------------------------------------------------------

library(readr)

# Carregando os dados -----------------------------------------------------

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

base_de_dados_fev <- read_csv2("dados/voos_de_fevereiro.csv") 

# Comparações lógicas -----------------------------------------------------

# Valores lógicos

class(TRUE)
class(FALSE)

# TRUE e FALSE são nomes reservados 

TRUE <- 1

x <- 1

# Testes com resultado verdadeiro
x == 1
"a" == "a"

# Testes com resultado falso
x == 2
"a" == "b"

# Maior
x > 3
x > 0

# Maior ou igual
x > 1
x >= 1

# Menor
x < 3
x < 0

# Menor ou igual
x < 1
x <= 1

# Diferente
x != 1
x != 2

x %in% c(1, 2, 3)

"a" %in% c("b", "c")

## Operadores lógicos também podem ser usados com vetores

numeros <- c(4, 8, 15, 16, 23, 42)

# vetor de lógicos que compara os elementos de "numeros", um por um, com o número 20
numeros < 20

# vetor de lógicos que compara os elementos de "numeros", um por um, com o número 23
numeros == 23

## Comparações lógicas serão a base dos filtros!

numeros <- c(4, 8, 15, 16, 23, 42)

# seleciona apenas o primeiro elemento do vetor "numeros"
numeros[c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)]

c(TRUE, FALSE, FALSE, FALSE, FALSE, FALSE)
numeros == 4

numeros[numeros == 4]

# seleciona apenas aqueles elementos do vetor "numeros" que forem iguais a 15
numeros[numeros == 15]

# Exercícios --------------------------------------------------------------

# 1. Escreva um código que devolva apenas os valores maiores
# ou iguais a 10 do vetor abaixo:

vetor <- c(4, 8, 15, 16, 23, 42)

vetor[c(FALSE, FALSE, TRUE, TRUE, TRUE, TRUE)]

vetor[vetor >= 10]

sum(vetor >= 10)

vetor_maior_que_10 <- vetor[vetor >= 10]

length(vetor_maior_que_10)

# Operadores lógicos ----------

## & - E - Para ser verdadeiro, os dois lados 
# precisam resultar em TRUE

x <- 5
3 >= x & x <=7

y <- 2
y >= 3 & y <= 7

## | - OU - Para ser verdadeiro, apenas um dos 
# lados precisa ser verdadeiro

y <- 2
y >= 3 | y <=7

y <- 1
y >= 3 | y == 0

## O mesmo acontece com vetores

x_vetor <- c(89, 36, 96, 10, 99, 39)
y_vetor <- c(53, 30, 15, 54, 34, 60)

x_vetor > 50 | y_vetor < 10
x_vetor <= 50 & y_vetor > 10

x_vetor > 50 & y_vetor < 10

## ! - Negação - É o "contrário"

!TRUE

!FALSE


w <- 5

w < 4

(!w < 4)
w >= 4

!(x_vetor > 50 | y_vetor < 10)

# Filtrando linhas do data.frame  com vetores lógicos --------------

#base_de_dados$atraso_chegada == 4

base_de_dados$atraso_chegada
base_de_dados$atraso_chegada == 4  # Retorna um vetor de VERDADEIRO ou FALSO

# Podemos filtrar linhas baseadas no retorno do vetor com TRUE e FALSE,
# sendo que: o que for TRUE ficará na base, e o que for FALSE será removido.

base_de_dados[1]
base_de_dados["tempo_voo"]

base_de_dados[base_de_dados$origem == "EWR",]

base_de_dados[base_de_dados$tempo_voo > 100,]

base_de_dados[base_de_dados$tempo_voo > 100, "tempo_voo"]

#  Podemos combinar!

base_de_dados[base_de_dados$origem == "EWR" | base_de_dados$tempo_voo > 100,]

vetor_de_filtros <- base_de_dados$origem == "EWR" & 
  base_de_dados$tempo_voo > 40 &
  base_de_dados$destino == "ALB"

base_de_dados[vetor_de_filtros,]

# Exercícios --------------------------------------------------------------

# 1. Usando a base de voos, escreva um código que devolva apenas os voos 
# que aconteceram no dia 15/01/2013:

as.Date(base_de_dados$data_hora)

base_de_dados_dia_15 <- base_de_dados[as.Date(base_de_dados$data_hora) == "2013-01-15",]

View(base_de_dados_dia_15)

base_de_dados_dia_saida_15 <- base_de_dados[base_de_dados$ano == "2013" &
                                            base_de_dados$mes == "1" &
                                            base_de_dados$dia == "15",]

base_de_dados$ano == "2013"

# 2. Usando a base de voos, escreva um código que devolva apenas os voos 
# que NÃO sairam do aeroporto JFK:

base_de_dados_nao_jfk <- base_de_dados[base_de_dados$origem != "JFK",]

base_de_dados_nao_jfk_jeito_2 <- base_de_dados[!(base_de_dados$origem == "JFK"),]

# 3. Usando a base de voos, escreva um código que devolva apenas os voos 
# que sairam do aeroporto JFK, e foram para Atlanta ("ATL"), 
# e salve em um objeto chamado voos_jfk_atlanta:

voos_jfk_atlanta <- base_de_dados[base_de_dados$origem == "JFK" & base_de_dados$destino == "ATL",] 

View(voos_jfk_atlanta)

# 4. Usando a base de voos, escreva um código que devolva apenas os voos 
# que aconteceram nos dias 15/01/2013 ou 16/01/2013:

voos_dias_15_16 <- base_de_dados[base_de_dados$dia == 15 | base_de_dados$dia == 16, ] 

voos_dias_15_16_jeito2 <- base_de_dados[base_de_dados$dia %in% c(15, 16), ]

voos_dias_15_19_jeito2 <- base_de_dados[base_de_dados$dia %in% c(15, 16, 17, 18, 19), ]

voos_dias_15_19_jeito3 <- base_de_dados[base_de_dados$dia %in% 15:19,]
# filter

# Existe um outro jeito de fazer esse tipo de filtro

# vamos instalar um pacote novo!
# install.packages("dplyr")
library(dplyr)

# podemos escrever de uma forma que não repete o nome "base_de_dados"
base_de_dados[base_de_dados$tempo_voo > 100,]

filtro_com_colchete <- base_de_dados[base_de_dados$tempo_voo > 100,]

filtro_com_colchete_dplyr <- filter(base_de_dados, tempo_voo > 100)

base_de_dados[base_de_dados$origem == "JFK",]

filter(base_de_dados, origem == "JFK")

#filter(seu_data_frame, CONDICOES)

# outros exemplos:

#base_de_dados[base_de_dados$origem == "EWR",]
filter(base_de_dados, origem == "EWR")

#base_de_dados[base_de_dados$origem == "EWR" | base_de_dados$tempo_voo > 100,]
filter(base_de_dados, origem == "EWR" | tempo_voo > 100)

#base_de_dados[base_de_dados$origem == "EWR" & base_de_dados$tempo_voo > 100,]
filter(base_de_dados, origem == "EWR" & tempo_voo > 100)

# opcional: dentro do filter, podemos usar "," ao invés de "&"
# essa é uma comodidade ESPECÍFICA do filter
filter(base_de_dados, origem == "EWR", tempo_voo > 100)

nova_base_de_dados <- filter(base_de_dados, origem == "EWR")

filter(base_de_dados, dia %in% 15:28)
base_de_dados[base_de_dados$dia %in% 15:28, ]

filter(base_de_dados, 15 <= dia & dia <= 28)
base_de_dados[base_de_dados$dia >= 15 & base_de_dados$dia <= 28, ]

select(nova_base_de_dados, ano, mes, dia, origem)

# Exercícios --------------------------------------------------------------

avaliacao_do_cliente <- c(1, 3, 0, 10, 2, 5, 20)
estado_de_nascimento <- c("SP", "PB", "PB", "RJ", "MT", "MT", "PA")

avaliacoes <- data.frame(avaliacao_do_cliente, estado_de_nascimento)

# usando o data.frame "avaliacoes", escreva códigos que atendam os pontos abaixo.
# Se possível, escreva duas versões de cada código: uma com filter e outra usando
# subsetting (os colchetes [])

# 1. Filtre as avaliações superiores a 3.

resultado_com_filter <- filter(avaliacoes, avaliacao_do_cliente > 3)

avaliacoes[avaliacoes$avaliacao_do_cliente > 3,]

resultado_sem_filter <- avaliacoes[avaliacoes$avaliacao_do_cliente > 3,]

resultado_com_filter == resultado_sem_filter

comparando <- resultado_com_filter == resultado_sem_filter

comparando[TRUE]
comparando[c(TRUE, TRUE, TRUE, TRUE, TRUE, TRUE)]

comparando[FALSE]
comparando[c(FALSE, FALSE, FALSE, FALSE, FALSE, FALSE)]

vetor[c()]
comparando[c()]

voos_dias_15_16 == voos_dias_15_16_jeito2

identical(resultado_com_filter, resultado_sem_filter)

comparando <- voos_dias_15_16 == voos_dias_15_16_jeito2

comparando[FALSE]

all(voos_dias_15_16 == voos_dias_15_16_jeito2, na.rm = TRUE)

# 2. Filtre as avaliações de SP ou MT.

filter(avaliacoes, estado_de_nascimento == "SP" | estado_de_nascimento == "MT")
filter(avaliacoes, estado_de_nascimento %in% c("SP", "MT"))

avaliacoes[avaliacoes$estado_de_nascimento %in% c("SP", "MT"),]

# 3. Filtre as avaliações de PB ou MT com nota inferior a 4.

filter(avaliacoes, estado_de_nascimento %in% c("PB", "MT") & avaliacao_do_cliente < 4)

avaliacoes[avaliacoes$estado_de_nascimento %in% c("PB", "MT") & avaliacoes$avaliacao_do_cliente < 4, ]

#####



vetor <- c(11, 1, 5, 6, 9, 13)

vetor[4]

vetor[c(1, 2, 3)]

avaliacoes

avaliacoes[c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE),]

# filter x select

# serve só pra colunas. é o que a gente escreve à direita da , no []
select(avaliacoes, estado_de_nascimento)
