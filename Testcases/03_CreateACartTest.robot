*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/CreateACart.robot

*** Test Cases ***
Verify if the user is able to click on Profile icon
    Click On The Profile Icon
Verify if the user is able to Navigate to my carts page
    Click On My Carts Option
Verify if the user is able to create a new cart
    Create A New Cart
Verify if the user is able to rename the cart name
    Rename the cart name
Verify if the user is able to save the cart name
    Save The Cart Name