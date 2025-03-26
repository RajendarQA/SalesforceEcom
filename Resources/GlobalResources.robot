*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Highlight_Border
    [Arguments]    ${xpath}    ${border_style}=2px solid green
    ${script}=    Catenate    SEPARATOR=
    ...    document.evaluate("${xpath.replace('"', '\\"')}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.border = "${border_style}";
    Execute JavaScript    ${script}
