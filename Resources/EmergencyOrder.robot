*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ./GlobalResources.robot

*** Variables ***

${Search_bar}    //input[@class="searchInput"]
${Search_btn}    //button[@class="btn"]
${Add_To_cart_btn}    //button[@title="Add to Cart"]
${View_Cart_Popup}     //button[normalize-space()='VIEW CART']
${Product_Name_After_Adding-To_Cart}    //b[normalize-space()='${emergency_product}']
${Request_Emergency_Order_btn}    (//button[@title='Emergency Order'][normalize-space()='Request Emergency Order'])[1]
${Requested_By_lbl}    //label[contains(text(),'Requested By')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Phone_Number_lbl}    //label[contains(text(),'Phone Number')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Job_Site_Name_lbl}    //label[contains(text(),'Job Site Name')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Requested_Delivery_Date_lbl}    //label[contains(text(),'Requested Delivery Date')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Model_Numbers_lbl}    //label[contains(text(),'Model Number(s)')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Serial_Numbers_lbl}    //label[contains(text(),'Serial Number(s)')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${GO_or_SO_Numbers_lbl}    //label[contains(text(),'GO or SO Number')]/descendant::abbr[normalize-space()='*']/ancestor::label/following::input[1]
${Please_Describe_the_emergency_situation_lbl}    //textarea[@maxlength="32768"]
${Terms_And_Conditions}    //span[@title='Terms & Conditions']
${Terms_And_Conditions_drpDown}    //button[@type='button']//lightning-primitive-icon[@size='x-small']
${I_agree_to_terms_and_conditions_chkBox}    //label[span[text()='I Agree to Terms & Conditions']]/span[@part='indicator']
${Submit_btn}    //button[@aria-label='Save'and text()='Submit']
${View_Emergency_Order_btn}    //div[@class='mobile-hide']//button[@title='DEmergency Order'][normalize-space()='View Emergency Order']

*** Keywords ***

Search For The Emergency Product
    Wait Until Element Is Visible    ${daikin_logo}    180
    Highlight_Border    ${daikin_logo}
    Click Element    ${daikin_logo}    
    Wait Until Element Is Visible    ${Search_bar}    100
    Highlight_Border    ${Search_bar}
    Click Element    ${Search_bar}
    Input Text    ${Search_bar}    ${emergency_product_pn}
    Wait Until Element Is Visible    ${Search_btn}    100
    Highlight_Border    ${Search_btn}
    Click Element    ${Search_btn}
Add The Emergency Product To The Cart
    Wait Until Element Is Visible    ${emergency_product_name}    100
    Highlight_Border    ${emergency_product_name}
    Click Element    ${emergency_product_name}
    Wait Until Element Is Visible    ${Add_To_cart_btn}    180
    Highlight_Border    ${Add_To_cart_btn}
    Click Element    ${Add_To_cart_btn}
    Wait Until Element Is Visible    ${View_Cart_Popup}    180
    Highlight_Border    ${View_Cart_Popup}
    Click Element    ${View_Cart_Popup}
    Wait Until Element Is Visible    ${Product_Name_After_Adding-To_Cart}    180
    Highlight_Border    ${Product_Name_After_Adding-To_Cart}
    
Random_Requested_By_UserName
    ${RANDOM_NUM}=    Generate Random String    3    0123456789
    ${RANDOM_NAME}=    Generate Random String    4    [LETTERS]
    ${Requested_By_User}=    Set Variable    TestUser_${RANDOM_NAME}_${RANDOM_NUM}
    RETURN    ${Requested_By_User}


Fill The Emergency Details
    Scroll Element Into View    ${Request_Emergency_Order_btn}
    Wait Until Element Is Visible    ${Request_Emergency_Order_btn}    180
    Highlight_Border    ${Request_Emergency_Order_btn}
    Click Element    ${Request_Emergency_Order_btn}
    Wait Until Element Is Visible    ${Requested_By_lbl}    100
    Highlight_Border    ${Requested_By_lbl}
    Click Element    ${Requested_By_lbl}
    ${Requested_By_Name}=    Random_Requested_By_UserName
    Input Text    ${Requested_By_lbl}    ${Requested_By_Name}
    Wait Until Element Is Visible    ${Phone_Number_lbl}    100
    Highlight_Border    ${Phone_Number_lbl}
    ${10_dig_string}=    10_digit_random_string
    Input Text    ${Phone_Number_lbl}    ${10_dig_string}
    Wait Until Element Is Visible    ${Job_Site_Name_lbl}    100
    Highlight_Border    ${Job_Site_Name_lbl}
    Input Text    ${Job_Site_Name_lbl}    ${10_dig_string}
    Click Element    ${Requested_Delivery_Date_lbl}
    Wait Until Element Is Visible    ${Requested_Delivery_Date_lbl}    200
    Highlight_Border    ${Requested_Delivery_Date_lbl}
    Input Text    ${Requested_Delivery_Date_lbl}    Jun 25, 2025
    Wait Until Element Is Visible    ${Model_Numbers_lbl}    100
    Click Element    ${Model_Numbers_lbl}
    Highlight_Border    ${Model_Numbers_lbl}
    Input Text    ${Model_Numbers_lbl}    ${10_dig_string}
    Wait Until Element Is Visible    ${Serial_Numbers_lbl}    100
    Highlight_Border    ${Serial_Numbers_lbl}
    Input Text    ${Serial_Numbers_lbl}    ${10_dig_string}
    Scroll Element Into View    ${GO_or_SO_Numbers_lbl}
    Wait Until Element Is Visible    ${GO_or_SO_Numbers_lbl}    100
    Highlight_Border    ${GO_or_SO_Numbers_lbl}
    Input Text    ${GO_or_SO_Numbers_lbl}    ${10_dig_string}
    Scroll Element Into View    ${Please_Describe_the_emergency_situation_lbl}
    Wait Until Element Is Visible    ${Please_Describe_the_emergency_situation_lbl}    100
    Highlight_Border    ${Please_Describe_the_emergency_situation_lbl}
    Input Text    ${Please_Describe_the_emergency_situation_lbl}    This is a test situation for requesting an emergency order product
    Scroll Element Into View    ${I_agree_to_terms_and_conditions_chkBox}
    Wait Until Element Is Visible    ${I_agree_to_terms_and_conditions_chkBox}    200
    Click Element    ${I_agree_to_terms_and_conditions_chkBox}
    Scroll Element Into View    ${Submit_btn}
    Wait Until Element Is Visible    ${Submit_btn}    20
    Click Element    ${Submit_btn}
    Wait Until Element Is Visible    ${View_Emergency_Order_btn}    180
    Click Element    ${View_Emergency_Order_btn}
        
        
    
    
    

    