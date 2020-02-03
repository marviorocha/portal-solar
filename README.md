Portal Solar - Teste Técnico


## Objetivo geral

Implementar novas funcionalidades ao sistema de busca, recomendação e melhor custo de frete para geradores de energia.

### Requisitos Principais


- [x] Recomendação geradores de energia para o usuário
- [x] Filters Preço, Nome
- [x] Script para automação de deploy e github ./deploy
- [x] Consultar frete baseado no CEP modelo 'Freight'


Implementar uma funcionalidade de recomendação geradores de energia para o usuário utilizando os campos que existem no modelo de PowerGenerator. Em outras palavras, o usuário poderá informar alguns dados que possa ser utilizado para recomendar estes geradores de energia. Não se prenda a quantos e quais informações o usuário poderá informar. **O algoritmo de escolha é livre, fique a vontade**.

Implementar função para consultar o custo do frete (modelo Freight) baseado no CEP informado. Ao clicar no produto deve ser abrir uma modal, uma nova tela ou uma partial para tal função. Dica: Utilize alguma API pública para descobrir cidade e estado através do CEP, irá ajudar no processo de precificação do frete.

Requisitos Secundários
Implementar um filtro simples que ordene por preço na tela inicial, trazendo os resultados ordenados por nome e adicionando paginação para mostrar somente 6 itens por página.

Aplicar um segundo filtro baseado no anterior, ordenando por KWP.

Implementar função para calcular o peso cubado do produto e persistir isso no banco. Dica: Cálculo para o peso cubado -> Comprimento x Largura x Altura x Fator cubagem (300)

Modificar consulta do custo do frete afim de trazer o valor com o PESO MENOR do produto, ou seja, o valor do frete não importa e sim o peso do produto. Dica: Verifique o valor baseado no peso do produto ou no peso cubado. (menor = melhor)

Fazer ao menos testes unitários para serviços e métodos criados para a recomendação de geradores, consulta de CEP e a busca simples por nome, mas não se limitando, testes são sempre bem vindos.