*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/CreateACart.robot

*** Test Cases ***
Verify if the user is able to create a new cart
    Click On The Profile Icon
    Click On My Carts Option
    Create A New Cart
    Rename the cart name