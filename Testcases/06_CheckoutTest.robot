*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Checkout.robot

*** Test Cases ***
Verify if the user is able to checkout
    Click on checkout button
    Enter the Account Information
    Select The Delivery Option
    Enter The Purchase Order Number
    Click On Place Order Button
    Close the browser