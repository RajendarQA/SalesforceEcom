*** Settings ***
Library     SeleniumLibrary
Resource      ../Resources/NavigateToPartsStore.robot

*** Test Cases ***
Verify if the user is able to click on the contacts tab
    #Click App Launcher
    Click Contacts Tab
Verify if the user is able to select the contact
    Select The Contact
Verify if the user is able to navigate to the parts store page
    Select The Dropdown And Click On Login To Experience As User
    Select On Login To Experience As User
    Click On PartsStore Option
    Check if page contains Parts Store title
    Validate Logged-in User





