*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/AddProductToCart.robot

*** Test Cases ***
Verify if the user is able to view the parts page
    Click on Parts Tab
    Add Product to cart