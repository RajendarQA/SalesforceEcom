*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://daa--qasit.sandbox.lightning.force.com/lightning/page/home
${username}    rajendar.bolla@daikinapplied.com.qasit
${password}    Daikin@2025
${login_btn}    //input[@id='Login']
${username_label}    //label[@class="label usernamelabel"]
${password_label}    //label[@for="password"]


*** Keywords ***
Open browser with url
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    6
Close browser window
    Close Browser
Check if elements are visible  
    Wait Until Element Is Visible    ${username_label}    30
    Element Should Be Visible    ${username_label}
    Wait Until Element Is Visible    ${password_label}    30
    Element Should Be Visible    ${password_label}
Fill the Login details
    [Arguments]    ${username}    ${password}
    Input Text    //input[@id='username']    ${username}
    Input Password    //input[@id='password']    ${password}
Click on the login button
    Click Button    ${login_btn}
    Wait Until Page Contains    Commerce    180
    Page Should Contain    Commerce


            