
# Setando diretório com base de dados
setwd("D:\\Projetos\\Data-science\\data cleaning R\\dados")

# carregando dados em variável
dados <- read.csv("Churn.csv", sep=";",stringsAsFactors = T ,na.strings = "")

# conhecendo os dados
head(dados)
summary(dados)

# renomeando colunas
colnames(dados) <- c("Id","Score","Estado","Genero","Idade","Patrimonio","Saldo","Produtos","TemCartCredito","Ativo","Salario","Saiu")
head(dados)

# explorando dados categoricos

#Estados
counts <- table(dados$Estado)
barplot(counts, main="Estados", xlab="Estados")

#Gênero
counts <- table(dados$Genero)
barplot(counts, main="Gêneros", xlab="Gêneros")

# explorando dados numericos

#Score
summary(dados$Score)
boxplot(dados$Score)
hist(dados$Score)

#Idade
summary(dados$Idade)
boxplot(dados$Idade)
hist(dados$Idade)

#Saldo
summary(dados$Saldo)
boxplot(dados$Saldo)
hist(dados$Saldo)

#Salario
summary(dados$Salario)
boxplot(dados$Salario)
boxplot(dados$Salario,outline = F)

# Valores faltantes
dados[!complete.cases(dados),]


#tratar salários
#nas por median
summary(dados$Salario)

#mediana
median(dados$Salario,na.rm = T)

#atribuir mediana a NAs
dados[is.na(dados$Salario),]$Salario <- median(dados$Salario,na.rm = T)

#buscar NAS em salario para checar
dados[!complete.cases(dados$Salario),]
