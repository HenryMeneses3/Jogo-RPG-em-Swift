# Coordenador de Heróis --- RPG em Swift

Bem-vindo ao **Coordenador de Heróis**, um RPG totalmente em Swift onde
você assume o papel de um estrategista responsável por coordenar
missões, gerenciar heróis, evoluir seus atributos e enfrentar desafios
crescentes conforme os dias passam.

Este projeto foi criado para rodar **diretamente no terminal**, podendo
ser executado em ambientes como:

-   Swift instalado localmente
-   Xcode
-   Swift Online Editors (como Replit, OnlineGDB, SwiftFiddle)

## Proposta do Projeto

Este RPG oferece:

### 4 Heróis iniciais, cada um com uma especialidade

Cada herói possui: - Inteligência\
- Vigor\
- Mobilidade\
- Ataque\
- Nível\
- XP

Atributos aumentam ao subir de nível, e reduzem caso falhem missões
difíceis.

### 15 Missões ao total

-   Cada missão tem requisitos mínimos\
-   3 níveis de dificuldade\
-   XP variável\
-   Penalidades caso o herói falhe em 2 ou mais requisitos

A cada rodada **apenas 4 missões são sorteadas** para você escolher.

### Sistema de Dias

-   A cada **3 missões completadas**, avança-se **1 dia**
-   Ao avançar o dia:
    -   Todas penalidades por fracasso são restauradas
    -   Cada 5 dias surge um **Chefe Final**

### Sistema de Ranking

Você recebe pontos conforme: - Missões completadas - Dificuldade -
Conquistas especiais (chefes derrotados)

O ranking aparece no menu principal.

### Sistema de Itens

Os heróis podem receber itens aleatórios após missões: - Poções que
restauram atributos\
- Pergaminhos que aumentam XP\
- Amuletos que aumentam stats temporariamente

## Estrutura do Sistema

### Classes Principais

-   `Heroi` → Contém atributos, XP, nível, penalidades, itens
-   `Missao` → Requisitos, dificuldade, XP e recompensa
-   Funções de controle → missão, ranking, inventário, ciclo de dias

## Como Executar o Projeto

### 1. Instale o Swift

**macOS**\
Swift já vem instalado com o Xcode\
Ou instale pela linha de comando:

    xcode-select --install

**Windows ou Linux**\
Baixe:\
https://www.swift.org/download/

### 2. Compile o projeto

    swiftc main.swift -o jogo

### 3. Execute o jogo

    ./jogo

## Como Jogar

1.  Escolha um herói\
2.  Analise os requisitos das missões disponíveis\
3.  Envie alguém para a missão\
4.  Ganhe XP e suba de nível\
5.  Evite penalidades por fracasso\
6.  A cada 3 missões, avança 1 dia\
7.  A cada 5 dias, prepare-se para o Chefe Final\
8.  Suba no ranking global do reino!

## Dependências

Nenhuma.\
O projeto usa apenas **Swift Foundation**.

## Autor

Henry Sant Anna Meneses
