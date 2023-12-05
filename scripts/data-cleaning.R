
# Setando diretório com base de dados
setwd("D:/Projetos/R/limpeza-tratamento/dados")

# carregando dados em variável
dados <- read.csv("Churn.csv", sep=";",stringsAsFactors = T ,na.strings = "")

# conhecendo os dados
head(dados)
summary(dados)

# renomeando colunas
colnames(dados) = c("Id","Score","Estado","Genero","Idade","Patrimonio","Saldo","Produtos","TemCartCredito","Ativo","Salario","Saiu")
head(dados)
