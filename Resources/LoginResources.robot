*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${browser}    chrome
${url}    https://daa--qasit.sandbox.lightning.force.com/lightning/page/home
${username}    rajendar.bolla@daikinapplied.com.qasit
${password}    Daikin@2025
${login_btn}    //input[@id='Login']
${username_field}    //input[@id='username']
${password_field}    //input[@id='password']
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
    Highlight_Border    ${username_label}    2px solid green

    Wait Until Element Is Visible    ${password_label}    30
    Element Should Be Visible    ${password_label}
    Highlight_Border    ${password_label}    2px solid green

Fill the Login details
    [Arguments]    ${username}    ${password}

    Highlight_Border    ${username_field}    2px solid green
    Sleep    3
    Input Text    ${username_field}    ${username}

    Highlight_Border    ${password_field}    2px solid green
    Sleep    3
    Input Password    ${password_field}    ${password}

Click on the login button
    Highlight_Border    ${login_btn}    2px solid green
    Sleep    3
    Click Button    ${login_btn}
    Wait Until Page Contains    Commerce    180
    Page Should Contain    Commerce

Highlight_Border
    [Arguments]    ${xpath}    ${border_style}
    ${script}=    Catenate    SEPARATOR=
    ...    document.evaluate("${xpath.replace('"', '\\"')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.border = "${border_style}";
    Execute JavaScript    ${script}

