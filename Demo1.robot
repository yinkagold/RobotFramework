*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          Userdefinedkeywords.txt    # First resource file
Library           DateTime

*** Variables ***
${var1}           4    # First scalar var
${var2}           4    # Second scalar var
@{USER}           gold    gold
&{login}          username=ola    password=ola
@{cities}
${City}           ${EMPTY}
${num12}          ${EMPTY}

*** Test Cases ***
TC _01
    [Documentation]    This is my first test case. It is used to compare two varaibles. *Demo1* \ _TC_01_
    ...    Link is https://www.google.com
    Should Be Equal    ${var1}    ${var2}

TC_02
    [Tags]    Login2
    [Setup]    SetUp demo
    Should Not Be Equal As Strings    @{USER}[0]    @{USER}[1]
    [Teardown]    TearDown demo

TC_04
    [Tags]    Login2
    Should be True    4    4

TC_03
    Should Be Equal As Strings    &{login}[username]    &{login}[password]

TC_05
    [Template]    Should Be Equal As Integers    # This is a template
    4    4    4
    6    6
    8    8

TC_06
    Comparetwovariables

TC_07
    [Setup]    SetUp demo
    DateTime.Get Current Date

AssignIdToElement
    Set Selenium Speed    0.5
    Open Browser    https://ngendigital.com/practice    Chrome
    Select Frame    id=iframe-015
    Assign Id To Element    xpath://tbody/tr[4]/td[3]    pm
    ${num12}    Get Text    pm
    Log    ${num12}
    Capture Page Screenshot
    [Teardown]    Close Browser

DisabledElement
    Set Selenium Speed    0.5
    Open Browser    https://cineplex.com    Chrome
    Maximize Browser Window
    Element Should Be Disabled    xpath://*[@id="search-by-theatre-time-selection-area"]/div/selectize-input/div/div[1]/input
    [Teardown]    Close Browser

CountElement
    Set Selenium Speed    0.5
    Open Browser    https://ngendigital.com/practice    Chrome
    Select Frame    id=iframe-015
    ${var1}    Get Element Count    xpath://input[@name='car']
    Should Be True    ${var1}==3

GoBack
    Open Browser    https://ngendigital.com/practice    Chrome
    Sleep    2
    Go To    https://cineplex.com
    Go Back
    [Teardown]    Close Browser

URL_Verify
    Open Browser    https://ngendigital.com/    Chrome
    Location Should Be    https://ngendigital.com/    It is not same url
    Close Browser
    Open Browser    https://www.gmail.com/    Chrome
    Log Location
    Log Source
    Log Title
    Close Browser

Dummy
    log    Hello World
    fv.Login    User    Pass
    Sleep    5
    fv.Logout

*** Keywords ***
SetUp demo
    Log To Console    Hello World

TearDown demo
    Log To Console    This is TearDown method
