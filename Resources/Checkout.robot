*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${checkout_btn}    //button[normalize-space()='Checkout']
${Proceed_btn}    //button[normalize-space()='Proceed']
${name_first}    //input[@name="firstName"]
${name_last}    //input[@name="lastName"]
${contact_phone}    //input[@name="contactPhone"]
${order_comments}    //textarea[@name="orderComments"]
${purchase_order_no}    //input[@name="po-number"]
${place_order_btn}    //button[normalize-space()='Place Order']
${continue_shopping}    //a[normalize-space()='Continue Shopping']
${order_confirmation_no}    //p[@class='order-confirmation-number']

*** Keywords ***
Click on checkout button
    Wait Until Element Is Visible    ${checkout_btn}    180
    Click Element    ${checkout_btn}
    Wait Until Element Is Visible    ${Proceed_btn}    120
    Scroll Element Into View    ${Proceed_btn}
    Click Element    ${Proceed_btn}
    
Enter the Account Information
    Wait Until Element Is Visible    ${name_first}    100
    Click Element    ${name_first}
    ${firstname}=    Generate Random String    8    [LOWER]
    Input Text    ${name_first}    ${firstname}
    Wait Until Element Is Visible    ${name_last}    100
    Click Element    ${name_last}
    ${lastname}=    Generate Random String    8    [LOWER]
    Input Text    ${name_last}    ${lastname}
    Wait Until Element Is Visible    ${contact_phone}    100
    Click Element    ${contact_phone}
    ${contact_num}=    Generate Random String    10    0123456789
    Input Text    ${contact_phone}    ${contact_num}
    Wait Until Element Is Visible    ${order_comments}    100
    Click Element    ${order_comments}
    Input Text    ${order_comments}    Test Comment
    Wait Until Element Is Visible    ${Proceed_btn}    100
    Click Element    ${Proceed_btn}
Select the Delivery Option
    Wait Until Element Is Visible    //span[@class="slds-form-element__label flex-grow" and normalize-space(text())='Ground Best Way (USA-Canada)']    180s
    Click Element    ${Proceed_btn}
Enter the purchase order number
    Wait Until Element Is Visible    ${purchase_order_no}    180
    Click Element    ${purchase_order_no}
    ${random_digits}=    Generate Random String    4    0123456789
    ${po_num}=    Set Variable    PO-${random_digits}
    Input Text    ${purchase_order_no}    ${po_num}
    Log To Console    ${po_num}
Click on Place Order Button
    Wait Until Element Is Visible    ${place_order_btn}    100
    Scroll Element Into View    ${place_order_btn}
    Click Element    ${place_order_btn}
    Wait Until Element Is Visible    ${order_confirmation_no}    180
    Click Element    ${continue_shopping}
    Wait Until Element Is Visible    //dxp_content_layout-site-logo[@class='lwc-440ckkrho00-host']//img[@class='lwc-6d0jmdgc6e8']    180
Close the browser
    Close Browser









