base = read.csv('credit_data.csv')
base$clientid = NULL

##Variável Numérica contínua -> income, loan, age
##Variável Numérica discreta -> default (0,1 = não,sim)
##Variável Categórica nominal -> ID cliente

summary(base)
##Puxa alguns dados relevantes da minha base de dados para cada coluna

base[base$age < 0, ]
##Pesquisando na base de dados idades menores que 0 e mostrando todas as colunas.
##base[intervalo buscado, colunas mostradas]

base[base$age < 0, 1:2]
##R começa a contar a partir do 1

base[base$age < 0 & !is.na(base$age),]
##O "&" é o normal de condicional e "!" forma a negativa
##is.na é para achar parâmetros que são nulos

idade_invalida = base[base$age < 0 & !is.na(base$age),]
##Salvando o tratamento inicial em uma varável


#Tratando os dados possibilidades:
#1 Apagar a coluna de age
base$age = NULL


##2 Apagar apenas os registros com problemas
base = base[base$age > 0, ]


##3 preencher os dados manualmente (ligando pras pessoas)


##4 Calcular a média das idades e completar na base
mean(base$age, na.rm = TRUE)
##na.rm = true desconsidera valores NA no cálculo

mean(base$age[base$age > 0], na.rm = TRUE)
##tirando do cálculo as idades negativas

base$age = ifelse(base$age < 0, 40.92, base$age)
##dados negativos consertados
##ifelse (teste, se sim, se não)

base[is.na(base$age), ]
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = T), base$age)
##dados NA consertados com a média





##Escalonamento de dados
##Para o aprendizado de máquinas as vezes se usa medidas que se valem de distancias
##logo valores maiores acabam sendo mais representativos do que valores menores
##como é o caso do income comparado com age nessa base

##Para resolver isso fazemos o escalonamento
#O mais comum é a normalização X = (X-mínimo)/(máximo-mínimo)
#Outra bem comum é a padronização X = (x-média)/desvio padrão

##O R já faz isso automaticamente
base[,1:3] = scale(base[,1:3]) 
##Padronizando todas as linhas, mas apenas atributos de 1 até 3, sem o default






































