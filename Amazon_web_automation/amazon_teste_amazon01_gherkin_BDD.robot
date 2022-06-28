*** Settings ***
Documentation   Essa suíte testa o site da Amazon 
Resource    amazon_resources_amazon01e02.robot
Test Setup      Abrir o navegador 
Test Teardown   Fechar o navegador

 
*** Test Cases ***
Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br 
    Quando adicionar o produto "Base de Conhecimento em Teste de Software" no carrinho 
    Então o produto "Base de Conhecimento em Teste de Software" deve ser mostrado no carrinho 
 
Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    E existe o produto "Base de Conhecimento em Teste de Software" no carrinho
    Quando remover o produto "Base de Conhecimento em Teste de Software" do carrinho
    Então o carrinho deve ficar vazio