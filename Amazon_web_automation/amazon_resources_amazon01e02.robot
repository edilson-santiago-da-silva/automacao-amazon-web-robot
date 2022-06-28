*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}             chrome
${URL}                 https://www.amazon.com.br/
${MENU_LIVROS}         //a[@href='/Livros/b/?ie=UTF8&node=6740748011&ref_=nav_cs_books'][contains(.,'Livros')]

*** Keywords ***

Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser 

#------------------------------------------------------------------------------
#Implementações do caso de teste 03

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_LIVROS}

Acessar a categoria "livros"
    Click Element    locator=${MENU_LIVROS}

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text    locator=field-keywords  text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element    locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"                                                                
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium a-color-base a-text-normal'][contains(.,'${PRODUTO}')]

Adicionar o produto "${PRODUTO}" no carrinho
    Click Element    locator=//span[@class='a-size-medium a-color-base a-text-normal'][contains(.,'${PRODUTO}')]
    Click Element    locator=add-to-cart-button

Verificar se o produto "Base de Conhecimento em Teste de Software" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]    

#------------------------------------------------------------------------------
# Implementações do caso de teste 04

Remover o produto "Base de Conhecimento em Teste de Software" do carrinho
    Click Element    locator=//a[contains(.,'Ir para o carrinho')]
    Click Element    locator=//input[@value='Excluir']

Verificar se o carrinho fica vazio
    Wait Until Element Is Visible    locator=//h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]
    
#------------------------------------------------------------------------------
# GHERKIN STEPS
# Implementações do caso de teste 03

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
    Acessar a categoria "livros"
    Digitar o nome de produto "Base de Conhecimento em Teste de Software" no campo de pesquisa
    Clicar no botão de pesquisa

Quando adicionar o produto "Base de Conhecimento em Teste de Software" no carrinho
    Verificar o resultado da pesquisa se está listando o produto "Base de Conhecimento em Teste de Software"
    Adicionar o produto "Base de Conhecimento em Teste de Software" no carrinho

Então o produto "Base de Conhecimento em Teste de Software" deve ser mostrado no carrinho
    Click Element    locator=//a[contains(.,'Ir para o carrinho')]
      
#-------------------------------------------------------------------------------
# GHERKIN STEPS
# Implementações do caso de teste 04
    
E existe o produto "Base de Conhecimento em Teste de Software" no carrinho
    Verificar o resultado da pesquisa se está listando o produto "Base de Conhecimento em Teste de Software"
    Adicionar o produto "Base de Conhecimento em Teste de Software" no carrinho

Quando remover o produto "Base de Conhecimento em Teste de Software" do carrinho
    Remover o produto "Base de Conhecimento em Teste de Software" do carrinho
    
Então o carrinho deve ficar vazio
    Verificar se o carrinho fica vazio

    
    
    




   


