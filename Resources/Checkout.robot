*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ./GlobalResources.robot

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
${Ground_Best_Way_canada}    //span[@class="slds-form-element__label flex-grow" and text()="Ground Best Way (USA-Canada)"]
${Ground_Best_Way_chkBox}    //span[text()='Ground Best Way (USA-Canada)']/ancestor::label//span[contains(@class, 'slds-radio_faux')]


*** Keywords ***

Click on checkout button
    Wait Until Element Is Visible    ${checkout_btn}    180
    Highlight_Border    ${checkout_btn}
    Sleep    5
    Click Element    ${checkout_btn}
    Wait Until Element Is Visible    ${Proceed_btn}    180
    Highlight_Border    ${Proceed_btn}
    Sleep    3
    Scroll Element Into View    ${Proceed_btn}
    Click Element    ${Proceed_btn}
Enter the Account Information
    Wait Until Element Is Visible    ${name_last}    180
    Highlight_Border    ${name_first}
    Sleep    3
    Click Element    ${name_first}
    ${firstname}=    Generate Random String    8    [LOWER]
    Input Text    ${name_first}    ${firstname}
    Wait Until Element Is Visible    ${name_last}    180
    Highlight_Border    ${name_last}
    Sleep    3
    Click Element    ${name_last}
    ${lastname}=    Generate Random String    8    [LOWER]
    Input Text    ${name_last}    ${lastname}
    Wait Until Element Is Visible    ${contact_phone}    180
    Highlight_Border    ${contact_phone}
    Sleep    3
    Click Element    ${contact_phone}
    ${contact_num}=    Generate Random String    10    0123456789
    Input Text    ${contact_phone}    ${contact_num}
    Wait Until Element Is Visible    ${order_comments}    180
    Highlight_Border    ${order_comments}
    Click Element    ${order_comments}
    Input Text    ${order_comments}    Test Comment
    Wait Until Element Is Visible    ${Proceed_btn}    180
    Highlight_Border    ${Proceed_btn}
    Click Element    ${Proceed_btn}
Select the Delivery Option
    Wait Until Element Is Visible    ${Ground_Best_Way_canada}    180
    #Highlight_Border    ${Ground_Best_Way_canada}
    Sleep    5
    Wait Until Element Is Visible    ${Ground_Best_Way_chkBox}    180
    #Highlight_Border    ${Ground_Best_Way_Checkbox}
    #Click Element    ${Ground_Best_Way_Checkbox}
    Sleep    3
    Click Element    ${Proceed_btn}
Enter the purchase order number
    Wait Until Element Is Visible    ${purchase_order_no}    180
    Highlight_Border    ${purchase_order_no}
    Sleep    3
    Click Element    ${purchase_order_no}
    ${random_digits}=    Generate Random String    4    0123456789
    ${po_num}=    Set Variable    PO-${random_digits}
    Input Text    ${purchase_order_no}    ${po_num}
    Sleep    4
    Log To Console    ${po_num}
Click on Place Order Button
    Wait Until Element Is Visible    ${place_order_btn}    180
    Scroll Element Into View    ${place_order_btn}
    Highlight_Border    ${place_order_btn}
    Sleep    3
    Click Element    ${place_order_btn}
    Wait Until Element Is Visible    ${order_confirmation_no}    180
    Highlight_Border    ${continue_shopping}
    Sleep    5
    Click Element    ${continue_shopping}
    Sleep    5
Close the browser
    Close Browser

