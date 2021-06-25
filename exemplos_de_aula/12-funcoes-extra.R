# transformar um código em uma função!

# código de exemplo: calcular a média de atraso de saída dos voos
# que partiram do aeroporto LGA


# Carregar pacotes
library(readr)
library(dplyr)

# Importar a base de dados
base_de_dados <- read_csv2(file = "dados/voos_de_janeiro.csv")

# filtrar o aeroporto de origem
base_filtrada <- filter(base_de_dados, origem == "LGA")

# calcular a média
media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)

# arredondar a média
media_arredondada <- round(media, 1)

# apresentar a média arredondada no console
media_arredondada







# Transformando em uma função -------------
# Queremos que funcione para outros aeroportos de saída.
# Então o aeroporto de saída será um argumento da nossa funcao
# e ela se chamara: calcular_media_de_atraso_saida

calcular_media_de_atraso_saida <- function(aeroporto_saida){
  # Importar a base de dados
  base_de_dados <- read_csv2(file = "dados/voos_de_janeiro.csv")
  
  # filtrar o aeroporto de origem
  base_filtrada <- filter(base_de_dados, origem == aeroporto_saida)
  
  # calcular a média
  media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)
  
  # arredondar a média
  media_arredondada <- round(media, 1)
  
  # apresentar a média arredondada no console
  media_arredondada
}

# TESTAR!
calcular_media_de_atraso_saida("LGA")

calcular_media_de_atraso_saida("JFK")

# não funciona
calcular_media_de_atraso_saida("BALALBA")



# Colocando mais argumentos ------------

calcular_media_de_atraso_saida_2 <- function(aeroporto_saida, mes){
  # Importar a base de dados
  base_de_dados <- read_csv2(file = paste0("dados/voos_de_", mes, ".csv"))
  
  # filtrar o aeroporto de origem
  base_filtrada <- filter(base_de_dados, origem == aeroporto_saida)
  
  # calcular a média
  media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)
  
  # arredondar a média
  media_arredondada <- round(media, 1)
  
  # apresentar a média arredondada no console
  media_arredondada
}

# TESTAR!
calcular_media_de_atraso_saida_2("LGA", mes = "janeiro")
calcular_media_de_atraso_saida_2("LGA", mes = "abril")

# testes que dão erro
calcular_media_de_atraso_saida_2("JFK")

# teste que não funciona
calcular_media_de_atraso_saida_2("BALALBA")

# Colocando valor padrão para os argumentos ------------

calcular_media_de_atraso_saida_3 <- function(aeroporto_saida, mes = "janeiro"){
  # Importar a base de dados
  base_de_dados <- read_csv2(file = paste0("dados/voos_de_", mes, ".csv"))
  
  # filtrar o aeroporto de origem
  base_filtrada <- filter(base_de_dados, origem == aeroporto_saida)
  
  # calcular a média
  media <- mean(base_filtrada$atraso_saida, na.rm = TRUE)
  
  # arredondar a média
  media_arredondada <- round(media, 1)
  
  # apresentar a média arredondada no console
  media_arredondada
}

# TESTAR!
calcular_media_de_atraso_saida_3("LGA", mes = "janeiro")
calcular_media_de_atraso_saida_3("LGA", mes = "abril")

# esse não vai dar erro mais!
calcular_media_de_atraso_saida_3("JFK")

# esse continua não funcionando
calcular_media_de_atraso_saida_3("BALALBA")

