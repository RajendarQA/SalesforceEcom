*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ./GlobalResources.robot

*** Variables ***
${Search_bar}    //input[@class="searchInput"]
${Search_btn}    //button[@class="btn"]
${Add_To_Cart_PDP}    //button[normalize-space()='Add To Cart']
${view_cart_popup}    //button[normalize-space()='VIEW CART']
${cart_icon}    //a[@class='cart-icon']//*[name()='svg']

*** Keywords ***
Click on Parts Tab
    Wait Until Element Is Visible    ${Search_bar}    180
    Highlight_Border    ${Search_bar}
    Click Element    ${Search_bar}
    Input Text    ${Search_bar}    ${product_pn}
    Wait Until Element Is Visible    ${Search_btn}    180
    Highlight_Border    ${Search_btn}
    Click Element    ${Search_btn}
    
Navigate to PLP
    Wait Until Element Is Visible    ${Product_name_test}    180
    Highlight_Border    ${Product_name_test}

Navigate to PDP
    Click Element    ${Product_name_test}
    Wait Until Element Is Visible    ${Product_Name_After_Adding_To_Cart}    180
    ${Product_Name}=    Get Text    ${Product_Name_After_Adding_To_Cart}
    Log To Console    ${Product_Name}
Add the product to the cart
    Wait Until Element Is Visible    ${Add_To_Cart_PDP}    180
    Highlight_Border    ${Add_To_Cart_PDP}
    Click Element    ${Add_To_Cart_PDP}
View the cart
    Wait Until Element Is Visible    ${view_cart_popup}    180
    Highlight_Border    ${view_cart_popup}
    Click Element    ${view_cart_popup}
    Wait Until Element Is Visible    ${Product_Name_In_Cart}    180
    ${Prod_validation}=    Get Text    ${Product_Name_In_Cart}
    Log To Console    ${Prod_validation}
    Should Be Equal    ${Prod_validation}    ${product_name}
    Log To Console    Product Name validation Pass
    Wait Until Element Is Visible    ${Product_PN_In_Cart}    100
    ${pn_validation}=    Get Text    ${Product_PN_In_Cart}
    Should Be Equal    ${pn_validation}    ${product_pn}
    Log To Console    PN Validation Pass
    Wait Until Element Is Visible    ${Product_Price_in_cart}    100
    ${price_validation}=    Get Text    ${Product_Price_in_cart}
    Should Be Equal    ${price_validation}    ${product_price}
    Log To Console    Price validation pass