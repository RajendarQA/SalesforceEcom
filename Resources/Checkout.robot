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
    Click Element    ${checkout_btn}
    Wait Until Element Is Visible    ${Proceed_btn}    180
    Scroll Element Into View    ${Proceed_btn}
    Click Element    ${Proceed_btn}
Enter the Account Information
    Wait Until Element Is Visible    ${name_last}    180
    Click Element    ${name_first}
    Sleep    1
    ${firstname}=    Generate Random String    8    [LOWER]
    Input Text    ${name_first}    ${firstname}
    Sleep    1
    Click Element    ${name_last}
    ${lastname}=    Generate Random String    8    [LOWER]
    Input Text    ${name_last}    ${lastname}
    Sleep    1
    Click Element    ${contact_phone}
    ${contact_num}=    Generate Random String    10    0123456789
    Input Text    ${contact_phone}    ${contact_num}
    Sleep    1
    Click Element    ${order_comments}
    Input Text    ${order_comments}    Test Comment
    Sleep    1
    Click Element    ${Proceed_btn}
    Sleep    50
Select the Delivery Option
    Click Element    ${Proceed_btn}
    Sleep    3
Enter the purchase order number
    Click Element    ${purchase_order_no}
    ${random_digits}=    Generate Random String    4    0123456789
    ${po_num}=    Set Variable    PO-${random_digits}
    Input Text    ${purchase_order_no}    ${po_num}
    Sleep    4
    Log To Console    ${po_num}
Click on Place Order Button
    Sleep    5
    Scroll Element Into View    ${place_order_btn}
    Click Element    ${place_order_btn}
    Sleep    25
    Wait Until Element Is Visible    ${order_confirmation_no}
    Sleep    4
    Click Element    ${continue_shopping}
    Sleep    5
Close the browser
    Close Browser
