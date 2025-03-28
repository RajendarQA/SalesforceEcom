*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ./GlobalResources.robot

*** Variables ***
${profile_icon}    //span[@class='menu-trigger-p slds-text-align_right slds-truncate slds-text-title_bold lwc-5uc1gleli5']
${my_carts}    //span[@title="My Carts"]
${new_cart_btn}    //span[@class='btnLabel']   
${before_cart_name}    //div[@class='row']//div[@class='info infoCartName']//div[@class='infoValue']
${pencil_icon_curr_cart}    //div[@class='row']//div[@class='info infoCartName']//lightning-primitive-icon[@exportparts='icon']
${cart_name_after_rename}    (//span[@class="textBlue"])[1]
${rename_curr_cart_txt_box}    //input[contains(@id, 'input-')]
${PREFIX}    Automation_test_
${after_creating}    //div[@class='row']//span[@class='textBlue' and starts-with(normalize-space(), 'Automation_test_')]
${save_cart_name}    //button[normalize-space()='Save']
${view_cart_btn}    //div[@class='btnBox desktopView']//btn[@class='btn viewCartBtn'][normalize-space()='View Cart']
${daikin_logo}    //dxp_content_layout-site-logo[@class='lwc-440ckkrho00-host']//img[@class='lwc-6d0jmdgc6e8']

*** Keywords ***
Click on the profile icon
    Wait Until Element Is Visible    ${profile_icon}    30
    Highlight_Border    ${profile_icon}
    Click Element    ${profile_icon}
Click on my carts option
    Wait Until Element Is Visible    ${my_carts}    10
    Highlight_Border    ${my_carts}
    Click Element    ${my_carts}
Create a new cart
    Wait Until Element Is Visible    ${new_cart_btn}    180
    Highlight_Border    ${new_cart_btn}
    Click Element    ${new_cart_btn}


Random_Cart_Name
    ${random_num}=    Generate Random String    4    0123456789
    ${random_cart}=    Set Variable    Automation_test_${random_num}
    RETURN    ${random_cart}

Rename the cart name

    Wait Until Element Is Visible    ${cart_name_after_rename}    180
    Wait Until Element Is Visible    ${pencil_icon_curr_cart}    180
    Highlight_Border    ${pencil_icon_curr_cart}
    Sleep    3
    Click Element    ${pencil_icon_curr_cart}
    Wait Until Element Is Visible    ${rename_curr_cart_txt_box}    50
    Highlight_Border    ${rename_curr_cart_txt_box}
    Click Element    ${rename_curr_cart_txt_box}
    Press Keys    ${rename_curr_cart_txt_box}    CTRL+a   BACKSPACE
    #${random_num}=    Generate Random String    4    0123456789
    #${random_cart}=    Set Variable    Automation_test_${random_num}
    ${cart_name}=    Random_Cart_Name
    Input Text    ${rename_curr_cart_txt_box}    ${cart_name}

Save the cart name    
    Wait Until Element Is Visible    ${save_cart_name}    180
    Highlight_Border    ${save_cart_name}
    Click Element    ${save_cart_name}
    Wait Until Element Is Visible    ${after_creating}    180
    Highlight_Border    ${view_cart_btn}
    Wait Until Element Is Visible    ${view_cart_btn}    40
    Click Element    ${view_cart_btn}
    Wait Until Element Is Visible    ${daikin_logo}    120
    Highlight_Border    ${daikin_logo}
    Click Element    ${daikin_logo}










