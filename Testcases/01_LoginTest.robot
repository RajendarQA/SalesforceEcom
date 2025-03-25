*** Settings ***
Library     SeleniumLibrary
Resource      ../Resources/Login.robot


*** Test Cases ***
Verify if user is able to go to the Login screen
     Open browser with url
     Sleep    5
Verify if user is able to view the elements in the login screen
    Check if elements are visible
    
Verify if the user is able to enter the data in the login screen
    Fill the Login details    ${username}    ${password}
    Sleep    2
    
Verify if the user is able to Click on the Login button
    Click on the login button
    
