library(esquisse) #Liberando as bibliotecas
library(ggplot2)
library(tidyverse)

setwd("C:\\Users\\Silva\\Downloads") #importando o arquivo csv
portuguese <- read.csv("Portuguese.csv")
portuguese

portuguese %>% #Criando a estrutura responsavel pela contagem
  group_by(sex, age) %>%
  summarise(
    valor= n()
  ) %>%
  ggplot(aes(x=age, y=valor, fill= sex, label= valor))+
  geom_bar(stat = "identity", position = "dodge")+
  geom_label(position = position_dodge(width = 1), alpha=0.5)+
  labs( #Customizando o grafico
    title = "Relação: Sexo e idade dos acadêmicos",
    subtitle = "Disciplina: Português",
    x= "Idade",
    y= "Frequência",
    caption = "Idade: 15, 16, 17, 18, 19, 20, 21 e 22",
    colour = "Sexo"
  )
