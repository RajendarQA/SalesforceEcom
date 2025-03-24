*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/EmergencyOrder.robot

*** Test Cases ***
Verify if the user is able to add an emergency product into cart
    Search for the emergency Product
    Add the Emergency Product to the Cart

Verify if the user is able to fill the emergency details in the cart page
    Fill the Emergency Details
