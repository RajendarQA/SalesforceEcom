*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${browser}    chrome
${url}    https://daa--qasit.sandbox.lightning.force.com/lightning/page/home
${username}    rajendar.bolla@daikinapplied.com.qasit
${password}    Daikin@2025

${contacts_url}    https://daa--qasit.sandbox.lightning.force.com/lightning/o/Contact/home
${contacts_tab}    //span[normalize-space()='Contacts']
${contact_name}    Mohan Test
${contact_ex}    //span[contains(text(),'${contact_name}')]
${login_user_name}    //h1[contains(text(),'${contact_name}')]
${User_LoggedIn}    ${contact_name}

${daikin_logo}    //dxp_content_layout-site-logo[@class='lwc-440ckkrho00-host']//img[@class='lwc-6d0jmdgc6e8']



${product_name}    FILTER AIR 24 X 24 X 2 DISPOSABLE PERFECT PLEAT SC MERV 8 (CASE=12)
${Product_name_test}    //span[@class='prodName' and text()="${product_name}"]
${Product_Name_After_Adding_To_Cart}    //h1[contains(text(),'${product_name}')]
${Product_Name_In_Cart}    //b[contains(text(),'${product_name}')]

${product_pn}    300049596
${Product_PN_In_Cart}    (//span[@part='formatted-rich-text'][normalize-space()='${product_pn}'])[1]
${product_price}    $38.28
${Product_Price_in_cart}    //div[@class='mobile-hide']//lightning-formatted-number[contains(text(),'${product_price}')]

${emergency_product_pn}    300069509
${emergency_product}    UV LIGHT ASSEMBLY 21
${emergency_product_name}    //span[@class="prodName" and text()="${emergency_product}"]

*** Keywords ***
Highlight_Border
    [Arguments]    ${xpath}    ${border_style}=2px solid green
    ${script}=    Catenate    SEPARATOR=
    ...    document.evaluate("${xpath.replace('"', '\\"')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.border = "${border_style}";
    Execute JavaScript    ${script}


10_digit_random_string
    ${contact_num}=    Generate Random String    10    0123456789
    RETURN    ${contact_num}
    
10_letter_random_string
    ${random_letters}=    Generate Random String    10    [LETTERS]
    RETURN    ${random_letters}




