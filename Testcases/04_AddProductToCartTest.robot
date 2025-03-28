*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/AddProductToCart.robot

*** Test Cases ***
Verify if the user is able to navigate to the parts page
    Click on Parts Tab
Verify if the user is able to navigate to PLP
    Navigate To PLP
Verify if the user is able to navigate to PDP
    Navigate To PDP
Verify if the user is able to add a product to the cart
    Add The Product To The Cart
Verify if the user is able to navigate to the cart page
    View The Cart