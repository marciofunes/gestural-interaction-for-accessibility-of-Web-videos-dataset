Gestural Interaction for Accessibility of Web videos Dataset
=====================================

Dataset com os dados qualitativos coletados de 36 usuários que tiveram a oportunidade de interagir com vídeos utilizando gestos

Descrição
----------

Dataset 2 | Questionário de Pós-Atividade
------------ | -------------
Váriaveis | 16
Tipo de váriaveis | usuarios, genero, idades, acuidadeVisual, recursoEspecial, escolaridade, utilizaComputador, acessoVideos, frequencia, dispositivo, programaLeitura, siteVideos, conteudoVideo, dificuldades, interageVideo, interageTipo, conhecerGestual


Dataset 2 | Questionário de Pós-Atividade
------------ | -------------
Váriaveis | 8
Tipo de váriaveis | gestoGeral, gestoTarefas, dificuldadeMyo, dificuldade_myoTipo, pesonalizarGestos, usariaGestos, melhorMetodo, melhoriaAcessibilidade

Código R para a aplicação do MCA (Multiple Correspondence Analysis)

Fonte: http://gastonsanchez.com/visually-enforced/how-to/2012/10/13/MCA-in-R/
Linguagem: R

Instalação:
-------

``` r
# Pacotes necessários
library(FactoMineR)
require(FactoMineR)
require(ggplot2)
```
Importando o Dataset:
-------

``` r
# Importando arquivo .csv
dataset1<-read.csv("usuariosPre.csv")

# Carregando o dataset selecionado
data(list=dataset1)

# Seleção das variaveis
newdataset = dataset1[, c("genero","acuidadeVisual","recursoEspecial")]

# Conferindo as variaveis selecionadas (opcional)
head(newdataset)
```
usuário | genero | acuidadeVisual | recursoEspecial
------------ | ------------- | ------------- | ------------- 
1   |   M | cegueira total  |   recurso_Sim
2   |   M | cegueira total  |   recurso_Sim
3   |   M | cegueira total  |   recurso_Sim
4   |   M | cegueira total  |   recurso_Sim
5   |   F | cegueira total  |   recurso_Sim
6   |   M | cegueira total  |   recurso_Sim

``` r
# number of categories per variable
cats = apply(newteste, 2, function(x) nlevels(as.factor(x)))

cats
```
genero | acuidadeVisual | recursoEspecial
------------ | ------------- | -------------
2 | 5 | 2 

``` r
# apply MCA
mca1 = MCA(newteste, graph = FALSE)

# list of results
mca1
```
``` r
**Results of the Multiple Correspondence Analysis (MCA)**
The analysis was performed on 36 individuals, described by 3 variables
*The results are available in the following objects:

name              description                       
"$eig"            "eigenvalues"                     
"$var"            "results for the variables"       
"$var$coord"      "coord. of the categories"        
"$var$cos2"       "cos2 for the categories"         
"$var$contrib"    "contributions of the categories" 
"$var$v.test"     "v-test for the categories"       
"$ind"            "results for the individuals"     
"$ind$coord"      "coord. for the individuals"      
"$ind$cos2"       "cos2 for the individuals"        
"$ind$contrib"    "contributions of the individuals"
"$call"           "intermediate results"            
"$call$marge.col" "weights of columns"              
"$call$marge.li"  "weights of rows" 
```
``` r
# table of eigenvalues
mca1$eig
```
Tabela de 

Dimensões | Autovalores | Percentual de variância | Percentual de variância acumulada
------------ | ------------- | ------------- | -------------
dim 1 | 0.5602135    |          28.010673                |          28.01067
dim 2 | 0.4367443     |         21.837217                 |         49.84789
dim 3 | 0.3333333     |         16.666667                 |         66.51456
dim 4 | 0.3333333     |         16.666667                 |         83.18122
dim 5 | 0.2104994     |         10.524968        |                  93.70619
dim 6 | 0.1258762     |          6.293809         |                100.00000

Utilizando o ``` rggplot2()``` para gerar gráficos 
-------
``` r
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
```
Utilizando o ``` r geom_density2d() ``` para visualizar zonas de altamente concentração:
-------
``` r
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
  ```
