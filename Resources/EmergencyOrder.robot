*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${daikin_logo}    //dxp_content_layout-site-logo[@class='lwc-440ckkrho00-host']//img[@class='lwc-6d0jmdgc6e8']
${Search_bar}    //input[@class="searchInput"]
${Search_btn}    //button[@class="btn"]
${emergency_product_pn}    //span[@class="prodName" and text()="UV LIGHT ASSEMBLY 21"]
${Add_To_cart_btn}    //button[@title="Add to Cart"]
${View_Cart_Popup}     //button[normalize-space()='VIEW CART']
${Product_Name_After_Adding-To_Cart}    //b[normalize-space()='UV LIGHT ASSEMBLY 21'] 
${Request_Emergency_Order_button}    (//button[@title='Emergency Order'][normalize-space()='Request Emergency Order'])[1]
${Requested_By_Field}    //label[contains(text(),'Requested By')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Phone_Number_field}    //label[contains(text(),'Phone Number')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Job_Site_Name_field}    //label[contains(text(),'Job Site Name')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Requested_Delivery_Date_field}    //label[contains(text(),'Requested Delivery Date')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Model_Numbers_Field}    //label[contains(text(),'Model Number(s)')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Serial_Numbers_field}    //label[contains(text(),'Serial Number(s)')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${GO_or_SO_Numbers_field}    //label[contains(text(),'GO or SO Number')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Please_Describe_the_emergency_situation_field}    //textarea[@maxlength="32768"]
${Terms_And_Conditions}    //span[@title='Terms & Conditions']
${Terms_And_Conditions_Dropdown}    //button[@type='button']//lightning-primitive-icon[@size='x-small']
${I_agree_to_terms_and_conditions_checkbox}    //span[contains(text(),'I Agree to Terms & Conditions')]/preceding-sibling::span
${Submit_button}    //button[@aria-label='Save'and text()='Submit']
${View_Emergency_Order_button}    //div[@class='mobile-hide']//button[@title='DEmergency Order'][normalize-space()='View Emergency Order']

*** Keywords ***
Highlight_Border
    [Arguments]    ${xpath}    ${border_style}
    ${script}=    Catenate    SEPARATOR=
    ...    document.evaluate("${xpath.replace('"', '\\"')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.border = "${border_style}";
    Execute JavaScript    ${script}
    
Search for the emergency Product
    Wait Until Element Is Visible    ${daikin_logo}    180
    Highlight_Border    ${daikin_logo}    2px solid green
    Sleep    3
    Click Element    ${daikin_logo}    
    Wait Until Element Is Visible    ${Search_bar}    100
    Highlight_Border    ${Search_bar}    2px solid green
    Sleep    3
    Click Element    ${Search_bar}
    Input Text    ${Search_bar}    300069509
    Wait Until Element Is Visible    ${Search_btn}    100
    Highlight_Border    ${Search_btn}    2px solid green
    Sleep    3
    Click Element    ${Search_btn}
Add the Emergency Product to the Cart
    Wait Until Element Is Visible    ${emergency_product_pn}    100
    Highlight_Border    ${emergency_product_pn}    2px solid green
    Sleep    3
    Click Element    ${emergency_product_pn}
    Wait Until Element Is Visible    ${Add_To_cart_btn}    180
    Highlight_Border    ${Add_To_cart_btn}    2px solid green
    Sleep    3
    Click Element    ${Add_To_cart_btn}
    Wait Until Element Is Visible    ${View_Cart_Popup}    180
    Highlight_Border    ${View_Cart_Popup}    2px solid green
    Sleep    3
    Click Element    ${View_Cart_Popup}
    Wait Until Element Is Visible    ${Product_Name_After_Adding-To_Cart}    180
    Highlight_Border    ${Product_Name_After_Adding-To_Cart}    2px solid green
    Sleep    4
Fill the Emergency Details
    Scroll Element Into View    ${Request_Emergency_Order_button}
    Wait Until Element Is Visible    ${Request_Emergency_Order_button}    180
    Highlight_Border    ${Request_Emergency_Order_button}    2px solid green
    Sleep    3
    Click Element    ${Request_Emergency_Order_button}
    Wait Until Element Is Visible    ${Requested_By_Field}    100
    Highlight_Border    ${Requested_By_Field}    2px solid green
    Sleep    3
    Click Element    ${Requested_By_Field}
    ${RANDOM_NUM}=    Generate Random String    3    0123456789
    ${RANDOM_NAME}=    Generate Random String    4    [LETTERS]
    ${Requested_By_User}=    Set Variable    TestUser_${RANDOM_NAME}_${RANDOM_NUM}
    Input Text    ${Requested_By_Field}    ${Requested_By_User}
    Wait Until Element Is Visible    ${Phone_Number_field}    100
    Highlight_Border    ${Phone_Number_field}    2px solid green
    Sleep    3
    ${Phone_Number}=    Generate Random String    10    0123456789
    Input Text    ${Phone_Number_field}    ${Phone_Number}
    Wait Until Element Is Visible    ${Job_Site_Name_field}    100
    Highlight_Border    ${Job_Site_Name_field}    2px solid green
    Sleep    3
    ${Job_Site_Name}=    Generate Random String    10    [LETTERS]
    Input Text    ${Job_Site_Name_field}    ${Job_Site_Name}
    Click Element    ${Requested_Delivery_Date_field}
    Wait Until Element Is Visible    ${Requested_Delivery_Date_field}    200
    Highlight_Border    ${Requested_Delivery_Date_field}    2px solid green
    Sleep    3
    Input Text    ${Requested_Delivery_Date_field}    Jun 25, 2025  
    Wait Until Element Is Visible    ${Model_Numbers_Field}    100
    Click Element    ${Model_Numbers_Field}
    Highlight_Border    ${Model_Numbers_Field}    2px solid green
    Sleep    3
    ${Model_Numbers}=    Generate Random String    8    0123456789
    Input Text    ${Model_Numbers_Field}    ${Model_Numbers}
    Wait Until Element Is Visible    ${Serial_Numbers_field}    100
    Highlight_Border    ${Serial_Numbers_field}    2px solid green
    Sleep    3
    ${Serial_Numbers}=    Generate Random String    8    0123456789
    Input Text    ${Serial_Numbers_field}    ${Serial_Numbers}
    Scroll Element Into View    ${GO_or_SO_Numbers_field}
    Wait Until Element Is Visible    ${GO_or_SO_Numbers_field}    100
    Highlight_Border    ${GO_or_SO_Numbers_field}    2px solid green
    Sleep    3
    ${Go_Or_So_Number}=    Generate Random String    8    0123456789
    Input Text    ${GO_or_SO_Numbers_field}    ${Go_Or_So_Number}
    Scroll Element Into View    ${Please_Describe_the_emergency_situation_field}
    Wait Until Element Is Visible    ${Please_Describe_the_emergency_situation_field}    100
    Highlight_Border    ${Please_Describe_the_emergency_situation_field}    2px solid green
    Sleep    3
    Input Text    ${Please_Describe_the_emergency_situation_field}    This is a test situation for requesting an emergency order product
    Element Should Be Visible    ${Terms_And_Conditions}
    Wait Until Element Is Visible    (//span[@class='slds-checkbox_faux'])[1]    200
    Sleep    3
    Click Element    (//span[@class='slds-checkbox_faux'])[1]
    Wait Until Element Is Visible    ${Submit_button}    20
    Click Element    ${Submit_button}
    Wait Until Element Is Visible    ${View_Emergency_Order_button}    180
    Click Element    ${View_Emergency_Order_button}
        
        
    
    
    

    