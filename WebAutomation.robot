*** Settings ***
Library           SeleniumLibrary
Resource          CommonlyUsedKeyWords.txt

*** Test Cases ***
OpenBrowser
    Open Browser    https://facebook.com    Chrome
    Maximize Browser Window
    Sleep    2
    Input Text    css:#email    Gold
    Sleep    2
    Input Text    css:#pass    ola
    Sleep    2

AdvancedXPath
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Sleep    2
    Click Element    xpath://input[@value='merc']/following-sibling::*[2]
    Sleep    4
    [Teardown]    close browser    # This mamually close the browser if the test case fails

Testboxdemo
    [Documentation]    Implicit wait is to tell the webDriver to pill the DOM for a certain amount of time when trying to find an element or elements if they are not immediately available
    ...    Explicit wait is wait for a certian condition to occur before proceeding further in the code.
    ...    For good coding practices implicit wait should be used except for rare cases
    ...    Time format( 0.5, 42, 1 min 5s)
    Set Selenium Timeout    5
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Sleep    2
    Page Should Contain Textfield    xpath://input[@name='FirstName']    It has failed    Warn
    Input Text    xpath://input[@name='FirstName']    NgenDitial
    Sleep    2
    Textfield Value Should Be    xpath://input[@name='FirstName']    NgenDitial
    Clear Element Text    xpath://input[@name='FirstName']
    Sleep    2
    [Teardown]    Close Browser

ButtonDemo
    Open Browser    https://facebook.com    Firefox
    Maximize Browser Window
    Input Text    css:#email    demo
    Sleep    2
    Input Text    css:#pass    demo1
    Click Button    xpath://input[@value='1']
    [Teardown]    Close Browser

CheckboxDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Sleep    2
    Page Should Contain Checkbox    //input[@value='bmw']    Checkbox not found    Info
    Sleep    2
    Select Checkbox    //input[@value='bmw']
    Sleep    4
    Checkbox Should Be Selected    //input[@value='bmw']
    Sleep    3
    Unselect Checkbox    //input[@value='bmw']
    [Teardown]    Close Browser

ListElementDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Sleep    2
    Page Should Contain List    css:#FromCity    List not found    Info
    Sleep    2
    @{cities}    Get List Items    css:#FromCity
    FOR    ${City}    IN    @{cities}
    LOG    ${City}
    Sleep    4
    List Selection Should Be    css:#FromCity    Toronto
    Sleep    2
    Select From List By Index    css:#FromCity    1
    Sleep    2
    Select From List    css:#FromCity    Chicago
    [Teardown]    Close Browser

RadioButtonDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Page Should Contain Radio Button    xpath://input[@value='flight']
    Sleep    2
    Select Radio Button    flight    flighthotel
    Sleep    2
    Radio Button Should Be Set To    flight    flighthotel
    Sleep    2
    [Teardown]    Close Browser

ImageDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Page Should Contain Image    xpath://*[@id="header_stickynav5256"]/nav/div/div[1]/div[2]/div/a/img
    Sleep    3
    Click Image    //*[@id="header_stickynav5256"]/nav/div/div[1]/div[2]/div/a/img    action_chain=True
    Sleep    4
    [Teardown]    Close Browser

TableDemo
    Open Browser    https://ngendigital.com/practice    Chrome
    Maximize Browser Window
    Select Frame    id=iframe-015
    Page Should Contain Element    xpath:/html/body/fieldset[7]/table    Table not found    INFO
    Table Should Contain    xpath:/html/body/fieldset[7]/table    Country
    Sleep    2
    Table Cell Should Contain    xpath:/html/body/fieldset[7]/table    2    3    Canada
    Sleep    2
    Table Should Contain    xpath:/html/body/fieldset[7]/table    1    Justin Trudeau
    Sleep    2
    Table Row Should Contain    xpath:/html/body/fieldset[7]/table    5    Chancellor
    Sleep    2
    ${textfield}    Get Text    xpath://tbody/tr[4]/td[1]
    Log To Console    ${textfield}
    Should Be Equal As Strings    ${textfield}    Theresa May
    Sleep    2
    [Teardown]    Close Browser

FlightApp
    Open Browser    https://ngendigital.com/demo-application    Chrome
    Sleep    2
    Select Frame    id=iframe-015
    Wait Until Keyword Succeeds    1 min    5s    Login_to_flightApp
    Sleep    4
    [Teardown]    Close Browser
