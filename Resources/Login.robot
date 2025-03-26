*** Settings ***
Library    SeleniumLibrary
Resource    ./GlobalResources.robot

*** Variables ***
${browser}    chrome
${url}    https://daa--qasit.sandbox.lightning.force.com/lightning/page/home
${username}    rajendar.bolla@daikinapplied.com.qasit
${password}    Daikin@2025
${login_btn}    //input[@id='Login']
${username_plh}    //input[@id='username']
${password_plh}    //input[@id='password']
${username_lbl}    //label[@class="label usernamelabel"]
${password_lbl}    //label[@for="password"]

*** Keywords ***
Open browser with url
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    6

Close browser window
    Close Browser

Check if elements are visible
    Wait Until Element Is Visible    ${username_lbl}    30
    Element Should Be Visible    ${username_lbl}
    Wait Until Element Is Visible    ${password_lbl}    30
    Element Should Be Visible    ${password_lbl}
Fill the Login details
    [Arguments]    ${username}    ${password}

    Highlight_Border    ${username_plh}
    Sleep    5
    Input Text    ${username_plh}    ${username}

    Highlight_Border    ${password_plh}
    Sleep    5
    Input Password    ${password_plh}    ${password}

Click on the login button
    Highlight_Border    ${login_btn}
    Sleep    4
    Click Button    ${login_btn}
    Wait Until Page Contains    Commerce    180
    Page Should Contain    Commerce



