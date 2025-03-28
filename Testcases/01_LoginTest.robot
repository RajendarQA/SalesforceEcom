*** Settings ***
Library     SeleniumLibrary
Resource      ../Resources/Login.robot



*** Test Cases ***
Verify if user is able to go to the Login screen
    Open Browser With URL
    #Run Keyword And Continue On Failure    Capture Screenshot On Failure

Verify if user is able to view the elements in the login screen
    Check If Elements Are Visible
    #Run Keyword And Continue On Failure    Capture Screenshot On Failure

Verify if the user is able to enter the data in the login screen
    Fill The Login Details    ${username}    ${password}
    #Run Keyword And Continue On Failure    Capture Screenshot On Failure

Verify if the user is able to Navigate to the Salesforce
    Click On The Login Button
    #Run Keyword And Continue On Failure    Capture Screenshot On Failure
