
# carregando dados em variável
dados <- read.csv("data-cleaning/dados/Churn.csv", sep=";",stringsAsFactors = T ,na.strings = "")

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

#--------------------------------------------------- EXPLORANDO OS DADOS

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


#-------------------------------------------------------------------TRATAMENTO
## Salario
summary(dados$Salario)
#mediana
median(dados$Salario,na.rm = T)
#atribuir mediana a NAs
dados[is.na(dados$Salario),]$Salario <- median(dados$Salario,na.rm = T)
#buscar NAS em salario para checar
dados[!complete.cases(dados$Salario),]

## Genero
unique(dados$Genero)
summary(dados$Genero)
#tratar falta de padrao
dados[is.na(dados$Genero) | dados$Genero == "M" ,]$Genero = "Masculino" 
dados[dados$Genero == "F" | dados$Genero == "Fem", ]$Genero = "Feminino" 
#res
summary(dados$Genero)
#remover levels não utilizados
dados$Genero =   factor(dados$Genero)
#visualizar novamente
summary(dados$Genero)

## idades
summary(dados$Idade)
#fora do dominio, numérico - ver idades anormais
dados[dados$Idade<0 | dados$Idade>110 ,]$Idade
#não temos idade NAs
dados[is.na(dados$Idade),]
#opção, preencher com mediana
median(dados$Idade)
#subtituição
dados[dados$Idade<0 | dados$Idade>110 ,]$Idade = median(dados$Idade)
#buscamos novamente
dados[dados$Idade<0 | dados$Idade>110 ,]
summary(dados$Idade)

## duplicidades
#duplicados p/ID
x <-  dados[duplicated(dados$Id),]
x
#excluir reg duplicado
dados <- dados[-c(82),]
#conferindo
dados[dados$Id == x$Id ,]
#conferindo novamente
x <-  dados[duplicated(dados$Id),]
x

## estado
#estados
unique(dados$Estado)
summary(dados$Estado)
#preencher com a moda, RS
dados[!dados$Estado %in% c("RS","SC","PR"),]$Estado = "RS"
summary(dados$Estado)
#removemos fatores 
dados$Estado =   factor(dados$Estado)
#conferindo
summary(dados$Estado)

## outliers
#outliers, criando um parametro com desvio padrão
desv <- sd(dados$Salario, na.rm = T)
desv
dados[dados$Salario >= 2 *desv  , ]$Salario
#outra forma, resultado semelhante, mas sem os NAs
boxplot(dados$Salario)
boxplot(dados$Salario, outline = F)
x <- boxplot(dados$Salario)$out
x
#atualizamos todos para mediana
median(dados$Salario)
dados[dados$Salario >= 2 *desv  , ]$Salario <- median(dados$Salario)
#checamos se sairam os outliers
dados[dados$Salario >= 2 *desv  , ]$Salario