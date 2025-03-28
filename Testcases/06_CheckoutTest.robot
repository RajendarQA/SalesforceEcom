*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/Checkout.robot

*** Test Cases ***
Verify if the user is able to checkout
    Click on checkout button
Verify if the user is able to Select the shipping address
    Select The Shipping Address
Verify if the user is able to enter the Account information
    Enter the Account Information
Verify if the user is able to Select the delivery Option
    Select The Delivery Option
Verify if the user is able to Enter the purchase order number
    Enter The Purchase Order Number
Verify if the user is able to place an order
    Click On Place Order Button
    Close the browser