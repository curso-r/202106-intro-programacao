# Carregando pacotes ------------------------------------------------------

library(readr)

# vamos instalar um pacote novo!
# install.packages("dplyr")
library(dplyr)

# Lista de arquivos -------------------------------------------------------

arquivos <- c("dados/voos_de_janeiro.csv", "dados/voos_de_fevereiro.csv",
              "dados/voos_de_marco.csv")


# Resultados - Loop -------------------------------------------------------

base_de_dados_completa <- data.frame()

for(arquivo in arquivos){
  
  print(paste0("Estou lendo o arquivo que está no caminho ", arquivo))
  
  dados <- read_csv2(arquivo,
                     col_types = "dddddddddcdcccddddT",
                     col_names = TRUE,
                     locale = locale(decimal_mark = ",", grouping_mark = "."))
  
  print(paste0("Esse arquivo tem ", nrow(dados), " linhas"))
  
  print(paste0("Vou incluir essas ", nrow(dados),
               " linhas em uma tabela de consolidação que tem ", nrow(base_de_dados_completa),
               " linhas"))
  
  
  base_de_dados_completa <- bind_rows(base_de_dados_completa, dados)
  
  print(paste0("Após incluir as linhas adicionais, minha tabela de consolidação tem ", nrow(base_de_dados_completa)))
  
}

# para não bagunçar os nossos arquivos, vamos criar uma pasta especial só para receber uma cópia
# da nossa tabela base_de_dados_completa
dir.create("dados/pasta_especial")

write_csv2(base_de_dados_completa, "dados/pasta_especial/base_de_dados_ate_junho.csv")
