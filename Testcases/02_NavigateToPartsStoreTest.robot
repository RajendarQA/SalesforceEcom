*** Settings ***
Library     SeleniumLibrary
Resource      ../Resources/NavigateToPartsStore.robot

*** Test Cases ***
Verify if the user is able to Navigate to the contacts page
    #Click App Launcher
    Click Contacts Tab
Verify if the user is able to select the contact
    Select The Contact
Verify if the user is able to click on Login to experience as user from the selected contact
    Select The Dropdown And Click On Login To Experience As User
    Select On Login To Experience As User
Verify if the user is able to Navigate to Parts store page
    Click On PartsStore Option
    Check if page contains Parts Store title
Verify if the correct user has logged in
    Validate Logged-in User





