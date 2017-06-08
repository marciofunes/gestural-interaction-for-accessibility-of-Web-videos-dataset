Gestural Interaction for Accessibility of Web videos Dataset
=====================================

Dataset com os dados qualitativos coletados de 36 usuários que tiveram a oportunidade de interagir com vídeos utilizando gestos

Descrição
----------

Dataset 1 | Questionário de Pré-Atividade
------------ | -------------
Váriaveis | 16
Tipo de váriaveis | usuarios, genero, idades, acuidadeVisual, recursoEspecial, escolaridade, utilizaComputador, acessoVideos, frequencia, dispositivo, programaLeitura, siteVideos, conteudoVideo, dificuldades, interageVideo, interageTipo, conhecerGestual


Dataset 2 | Questionário de Pós-Atividade
------------ | -------------
Váriaveis | 8
Tipo de váriaveis | gestoGeral, gestoTarefas, dificuldadeMyo, dificuldade_myoTipo, pesonalizarGestos, usariaGestos, melhorMetodo, melhoriaAcessibilidade

Código R para a aplicação do MCA (Multiple Correspondence Analysis)
Fonte: http://gastonsanchez.com/visually-enforced/how-to/2012/10/13/MCA-in-R/

Pacotes necessários:

``` r
# load packages
library(FactoMineR)
require(FactoMineR)
require(ggplot2)
```
