# Carregando pacotes ------------------------------------------------------

library(readr)

# Carregando os dados -----------------------------------------------------

base_de_dados <- read_csv2("dados/voos_de_janeiro.csv")

# Pipe (%>%) --------------------------------------------------------------

library(magrittr)

# Caso não tenha instalado: install.packages("magrittr")

# Transforma funçõe aninhadas em funções
# sequenciais

# g(f(x)) = x %>% f() %>% g()

x %>% f() %>% g()   # CERTO
x %>% f(x) %>% g(x) # ERRADO

# Receita de bolo sem pipe. 
# Tente entender o que é preciso fazer.


esfrie(
  asse(
    coloque(
      bata(
        acrescente(
          recipiente(
            rep(
              "farinha", 
              2
            ), 
            "água", "fermento", "leite", "óleo"
          ), 
          "farinha", até = "macio"
        ), 
        duração = "3min"
      ), 
      lugar = "forma", tipo = "grande", untada = TRUE
    ), 
    duração = "50min"
  ), 
  "geladeira", "20min"
)

# Veja como o código acima pode ser reescrito 
# utilizando-se o pipe. 
# Agora realmente se parece com uma receita de bolo.

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>%
  acrescente("farinha", até = "macio") %>%
  bata(duração = "3min") %>%
  coloque(lugar = "forma", tipo = "grande", untada = TRUE) %>%
  asse(duração = "50min") %>%
  esfrie("geladeira", "20min")

# ATALHO DO %>%: CTRL (command) + SHIFT + M  

# versão 4.1   novo pipe  |>

# Exercício ---------------------------------------------------------------

# 1. Reescreva o código abaixo utilizando o pipe. Na sua opinião, 
# de que forma é mais facil de ler e entender o que está sendo executado?
# Com ou sem o pipe? 

round(mean(base_de_dados$atraso_chegada, na.rm = TRUE), 2)


# resolucao 
mean(base_de_dados$atraso_chegada, na.rm = TRUE) %>% 
  round(digits = 2)


# OUTRA forma
base_de_dados$atraso_chegada %>% 
  mean(na.rm = TRUE) %>% 
  round(digits = 2)


# exemplo usando o script 03-filtros
library(dplyr)

# com base R
nova_base_de_dados <- filter(base_de_dados, origem == "EWR")
select(nova_base_de_dados, ano, mes, dia, origem)


# com pipe

voos_ewr <- base_de_dados %>% 
  filter(origem == "EWR") %>% 
  select(ano, mes, dia, origem)
  

# contar quantos voos tem por dia, usando a base filtrada:
voos_ewr %>% count(dia) %>% View()
