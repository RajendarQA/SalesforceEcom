*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/EmergencyOrder.robot

*** Test Cases ***
Verify if the user is able to add an emergency product into cart
    Search For The Emergency Product
    Add The Emergency Product To The Cart

Verify if the user is able to fill the emergency details in the cart page
    Fill The Emergency Details
