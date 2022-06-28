*** Settings ***
Documentation   Essa suíte testa o site da Amazon 
Resource    amazon_resources_amazon01e02.robot
Test Setup      Abrir o navegador 
Test Teardown   Fechar o navegador


*** Test Cases ***

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Acessar a home page do site Amazon.com.br
    Acessar a categoria "livros" 
    Digitar o nome de produto "Testes de software" no campo de pesquisa 
    Clicar no botão de pesquisa 
    Verificar o resultado da pesquisa se está listando o produto "Base de Conhecimento em Teste de Software" 
    Adicionar o produto "Base de Conhecimento em Teste de Software" no carrinho  
    Verificar se o produto "Base de Conhecimento em Teste de Software" foi adicionado com sucesso  


Caso de Teste 04 - Remover Produto do Carrinho 
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Acessar a home page do site Amazon.com.br
    Acessar a categoria "livros"
    Digitar o nome de produto "Testes de software" no campo de pesquisa
    Clicar no botão de pesquisa
    Verificar o resultado da pesquisa se está listando o produto "Base de Conhecimento em Teste de Software"
    Adicionar o produto "Base de Conhecimento em Teste de Software" no carrinho 
    Verificar se o produto "Base de Conhecimento em Teste de Software" foi adicionado com sucesso 
    Remover o produto "Base de Conhecimento em Teste de Software" do carrinho 
    Verificar se o carrinho fica vazio
     
