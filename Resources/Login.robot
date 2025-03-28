*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String
Resource   ../Resources/Login.robot
Resource    ./GlobalResources.robot



*** Variables ***

${login_btn}    //input[@id='Login']
${username_plh}    //input[@id='username']
${password_plh}    //input[@id='password']
${username_lbl}    //label[@class="label usernamelabel"]
${password_lbl}    //label[@for="password"]
${login_validation_txt}    Commerce
#${screenshot_index}    1  # Initialize screenshot index
#${SCREENSHOT_DIR}    ${OUTPUT_DIR}/allure-results/screenshots
#${SCREENSHOT_DIR}     C:/Users/Shreshta.K/PycharmProjects/SalesforceEcom/Testcases/output/allure/failure_${Test Name}.png


*** Keywords ***
Open Browser With URL
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Browser Implicit Wait    6

Close Browser Window
    Close Browser

Check If elements Are Visible
    Wait Until Element Is Visible    ${username_lbl}    30
    Element Should Be Visible    ${username_lbl}
    Wait Until Element Is Visible    ${password_lbl}    30
    Element Should Be Visible    ${password_lbl}

Fill The Login Details
    [Arguments]    ${username}    ${password}
    Highlight_Border    ${username_plh}
    Input Text    ${username_plh}    ${username}
    Highlight_Border    ${password_plh}
    Input Password    ${password_plh}    ${password}

Click On The Login Button
    Highlight_Border    ${login_btn}
    Capture Page Screenshot
    Click Button    ${login_btn}
    Wait Until Page Contains    ${login_validation_txt}    180
    Capture Page Screenshot
    Page Should Contain    ${login_validation_txt}

#Capture Screenshot On Failure
#    ${test_name}=    Get Variable Value    ${TEST NAME}  # Get current test case name
#   ${screenshot_name}=    Set Variable    selenium-screenshot-${screenshot_index}.png
 #   ${screenshot_path}=    Capture Page Screenshot    ${OUTPUT_DIR}/${screenshot_name}


  #  Log    Screenshot saved at ${screenshot_path}
   # Log    [ATTACHMENT|${screenshot_path}]

    #${screenshot_index}=    Evaluate    ${screenshot_index} + 1
    #Set Suite Variable    ${screenshot_index}  # Update index globally

