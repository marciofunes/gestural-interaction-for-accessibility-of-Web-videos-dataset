# load packages
library(FactoMineR)
require(FactoMineR)
require(ggplot2)

teste<-read.csv("dataset.csv")

# load data tea
data(list=teste)

# select these columns
newteste = teste[, c("gestoGeral","gestoTarefas","dificuldadeMyo")]

# take a peek
head(newteste)

# number of categories per variable
cats = apply(newteste, 2, function(x) nlevels(as.factor(x)))

cats

# apply MCA
mca1 = MCA(newteste, graph = FALSE)

# list of results
mca1

# table of eigenvalues
mca1$eig

# data frame with variable coordinates
mca1_vars_df = data.frame(mca1$var$coord, Variable = rep(names(cats), cats))

# data frame with observation coordinates
mca1_obs_df = data.frame(mca1$ind$coord)

# plot of variable categories
ggplot(data=mca1_vars_df, 
       aes(x = Dim.1, y = Dim.2, label = rownames(mca1_vars_df))) +
  geom_hline(yintercept = 0, colour = "gray70") +
  geom_vline(xintercept = 0, colour = "gray70") +
  geom_text(aes(colour=Variable)) +
  ggtitle("MCA plot of variables using R package FactoMineR")

# MCA plot of observations and categories
ggplot(data = mca1_obs_df, aes(x = Dim.1, y = Dim.2)) +
  geom_hline(yintercept = 0, colour = "gray70") +
  geom_vline(xintercept = 0, colour = "gray70") +
  geom_point(colour = "gray50", alpha = 0.7) +
  geom_density2d(colour = "gray80") +
  geom_text(data = mca1_vars_df, 
            aes(x = Dim.1, y = Dim.2, 
                label = rownames(mca1_vars_df), colour = Variable)) +
  ggtitle("MCA aplicada ao Grupo 3 - Dados Quantitativos de Pré-Atividade") +
  scale_colour_discrete(name = "Variable")

