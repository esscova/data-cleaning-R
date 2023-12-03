
# Setando diretório com base de dados
setwd("D:/Projetos/R/limpeza-tratamento/dados")

# carregando dados em variável
dados <- read.csv("Churn.csv", sep=";",stringsAsFactors = T ,na.strings = "")

# conhecendo os dados
dim(dados)

head(dados)

summary(dados)
