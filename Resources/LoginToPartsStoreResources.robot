*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${app_launcher}    //div[@class="slds-icon-waffle"]
${contacts_tab}    //span[normalize-space()='Contacts']
${contacts_url}    https://daa--qasit.sandbox.lightning.force.com/lightning/o/Contact/home
${contact_ex}    //span[contains(text(),'Rajendar Bolla')]
${contact_page_dropdown}    //lightning-button-menu[@class='menu-button-item slds-dropdown_actions slds-dropdown-trigger slds-dropdown-trigger_click']//lightning-primitive-icon[@variant='bare']
${Login_to_exp_as_user}    //span[normalize-space()='Log in to Experience as User']
${pop_up_to_navigate}    (//h1[normalize-space()='Log in as Site User'])[1]
${parts_store_option}    //span[normalize-space()='PartsStore']
${parts_solutions_title}    Parts Solutions
${Daikin_Logo}    (//img[@class="lwc-6d0jmdgc6e8"])[1]    
${profile_icon}    //span[@class='menu-trigger-p slds-text-align_right slds-truncate slds-text-title_bold lwc-5uc1gleli5']   
${my_account_information}    //span[@title="My Account Information"]
${login_user_name}    //h1[contains(text(),' Rajendar Bolla')]



*** Keywords ***
Click App Launcher
    Wait Until Element Is Visible    ${app_launcher}    180
    Click Element    ${app_launcher}
    
Click Contacts Tab
    Wait Until Element Is Visible    ${contacts_tab}    180s
    Execute Javascript    document.evaluate("${contacts_tab}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();    #Click Element    ${contacts_tab}
    #Execute JavaScript    arguments[0].click();    locator=${contacts_tab}
    #Execute JavaScript    document.querySelector("${contacts_tab}").click()
    #Sleep    10
    #Go To    ${contacts_url}
    
Select the Contact
    #${get_contact_text}=    Get Text    ${contact_ex}
    #Log To Console    ${get_contact_text}
    Wait Until Element Is Visible    ${contact_ex}    180
    Click Element    ${contact_ex}
   
Select the dropdown and click on Login to experience as user
    Wait Until Element Is Visible    ${contact_page_dropdown}    180
    Click Element    ${contact_page_dropdown}
    
Select on Login to experience as user
    Wait Until Element Is Visible    ${Login_to_exp_as_user}    180
    Click Element    ${Login_to_exp_as_user}
    
Click on PartsStore option
    Wait Until Element Is Visible    ${parts_store_option}    180
    Click Element    ${parts_store_option}

Check if page contains Parts Store title
    Wait Until Element Is Visible    ${Daikin_Logo}    30 
    Click Element    ${Daikin_Logo}
    #Wait Until Element Is Visible    ${parts_solutions_title}    20
    Page Should Contain    ${parts_solutions_title}

Validate Logged-in User

    Click Element    ${profile_icon}
    Wait Until Element Is Visible    ${my_account_information}    10
    Click Element    ${my_account_information}
    ${after_login_user}=    Get Text    ${login_user_name}
    Log To Console    ${after_login_user}
    Should Be Equal    ${after_login_user}    Hello Rajendar Bolla


        

    

              
    
        

    




    