*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${parts_tab}    //span[normalize-space()='Parts'] 
${see_all}    //span[@class='seeAll']
${Product_name_test}    (//span[@class='prodName'])[1]
${Add_To_Cart_PDP}    //button[normalize-space()='Add To Cart']
${view_cart_popup}    //button[normalize-space()='VIEW CART']
${cart_icon}    //a[@class='cart-icon']//*[name()='svg']


*** Keywords ***
Highlight_Border
    [Arguments]    ${xpath}    ${border_style}
    ${script}=    Catenate    SEPARATOR=
    ...    document.evaluate("${xpath.replace('"', '\\"')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.border = "${border_style}";
    Execute JavaScript    ${script}
    
Click on Parts Tab
    Click Element    ${parts_tab}
    Wait Until Element Is Visible    ${see_all}    15s
    Highlight_Border    ${see_all}    2px solid green
    Sleep    3
    Click Element    ${see_all}
    
Add Product to cart
    Wait Until Element Is Visible    ${Product_name_test}    180
    Highlight_Border    ${Product_name_test}    2px solid green
    Sleep    3
    Wait Until Element Is Visible    //img[@alt='TSTAT SUPPORT']    100
    Highlight_Border    //img[@alt='TSTAT SUPPORT']    2px solid green
    Sleep    3
    Click Element    ${Product_name_test}
    Wait Until Element Is Visible    //h1[normalize-space()='TSTAT SUPPORT']    180
    Highlight_Border    //h1[normalize-space()='TSTAT SUPPORT']    2px solid green
    Sleep    3
    ${Product_Name}=    Get Text    //h1[normalize-space()='TSTAT SUPPORT']
    Log To Console    ${Product_Name}
    Wait Until Element Is Visible    ${Add_To_Cart_PDP}    20
    Highlight_Border    ${Add_To_Cart_PDP}    2px solid green
    Sleep    3
    Click Element    ${Add_To_Cart_PDP}    
    Wait Until Element Is Visible    ${view_cart_popup}    180
    Highlight_Border    ${view_cart_popup}    2px solid green    
    Sleep    3
    Click Element    ${view_cart_popup}
    Wait Until Element Is Visible    //b[normalize-space()='TSTAT SUPPORT']    180
    Highlight_Border    //b[normalize-space()='TSTAT SUPPORT']    2px solid green
    Sleep    3
    ${Prod_validation}=    Get Text    //b[normalize-space()='TSTAT SUPPORT']
    Log To Console    ${Prod_validation}
    Should Be Equal    ${Prod_validation}    TSTAT SUPPORT
    Log To Console    Product Name validation Pass
    Wait Until Element Is Visible    (//span[@part='formatted-rich-text'][normalize-space()='Q668910601'])[1]    100
    Highlight_Border    (//span[@part='formatted-rich-text'][normalize-space()='Q668910601'])[1]    2px solid green
    Sleep    3
    ${pn_validation}=    Get Text    (//span[@part='formatted-rich-text'][normalize-space()='Q668910601'])[1]
    Should Be Equal    ${pn_validation}    Q668910601
    Log To Console    PN Validation Pass
    Wait Until Element Is Visible    //div[@class='mobile-hide']//lightning-formatted-number[contains(text(),'$2.99')]    100
    Highlight_Border    //div[@class='mobile-hide']//lightning-formatted-number[contains(text(),'$2.99')]    2px solid green
    Sleep    3
    ${price_validation}=    Get Text    //div[@class='mobile-hide']//lightning-formatted-number[contains(text(),'$2.99')]
    Should Be Equal    ${price_validation}    $2.99
    Log To Console    Price validation pass


    
    


    
    

