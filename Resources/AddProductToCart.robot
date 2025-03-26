*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ./GlobalResources.robot

*** Variables ***
${Product_name_test}    //span[@class='prodName' and text()="FILTER AIR 24 X 24 X 2 DISPOSABLE PERFECT PLEAT SC MERV 8 (CASE=12)"]
${Search_bar}    //input[@class="searchInput"]
${Search_btn}    //button[@class="btn"]
${Product_Name_After_Adding_To_Cart}    //h1[contains(text(),'FILTER AIR 24 X 24 X 2 DISPOSABLE PERFECT PLEAT SC')]
${Add_To_Cart_PDP}    //button[normalize-space()='Add To Cart']
${view_cart_popup}    //button[normalize-space()='VIEW CART']
${cart_icon}    //a[@class='cart-icon']//*[name()='svg']
${Product_Name_In_Cart}    //b[contains(text(),'FILTER AIR 24 X 24 X 2 DISPOSABLE PERFECT PLEAT SC')]
${Product_PN_In_Cart}    (//span[@part='formatted-rich-text'][normalize-space()='300049596'])[1]    
${Product_Price_in_cart}    //div[@class='mobile-hide']//lightning-formatted-number[contains(text(),'$52.63')]

*** Keywords ***
Click on Parts Tab
    Wait Until Element Is Visible    ${Search_bar}    180
    Highlight_Border    ${Search_bar}
    Sleep    3
    Click Element    ${Search_bar}
    Input Text    ${Search_bar}    300049596
    Sleep    3
    Wait Until Element Is Visible    ${Search_btn}    180
    Highlight_Border    ${Search_btn}
    Sleep    3
    Click Element    ${Search_btn}
    
Add Product to cart
    Wait Until Element Is Visible    ${Product_name_test}    180
    Highlight_Border    ${Product_name_test}
    Sleep    3
    Click Element    ${Product_name_test}
    Wait Until Element Is Visible    ${Product_Name_After_Adding_To_Cart}    180
    Sleep    3
    ${Product_Name}=    Get Text    ${Product_Name_After_Adding_To_Cart}
    Log To Console    ${Product_Name}
    Wait Until Element Is Visible    ${Add_To_Cart_PDP}    180
    Highlight_Border    ${Add_To_Cart_PDP}
    Sleep    3
    Click Element    ${Add_To_Cart_PDP}    
    Wait Until Element Is Visible    ${view_cart_popup}    180
    Highlight_Border    ${view_cart_popup}
    Sleep    3
    Click Element    ${view_cart_popup}
    Wait Until Element Is Visible    ${Product_Name_In_Cart}    180
    Sleep    3
    ${Prod_validation}=    Get Text    ${Product_Name_In_Cart}
    Log To Console    ${Prod_validation}
    Should Be Equal    ${Prod_validation}    FILTER AIR 24 X 24 X 2 DISPOSABLE PERFECT PLEAT SC MERV 8 (CASE=12)
    Log To Console    Product Name validation Pass
    Wait Until Element Is Visible    ${Product_PN_In_Cart}    100
    Sleep    3
    ${pn_validation}=    Get Text    ${Product_PN_In_Cart}
    Should Be Equal    ${pn_validation}    300049596
    Log To Console    PN Validation Pass
    Wait Until Element Is Visible    ${Product_Price_in_cart}    100
    Sleep    3
    ${price_validation}=    Get Text    ${Product_Price_in_cart}
    Should Be Equal    ${price_validation}    $52.63
    Log To Console    Price validation pass