*** Settings ***
Test Teardown     Close Browser
Resource          CommonKeywords.txt
Library           ExcelLibrary
Resource          ExcelDataFetch.txt

*** Test Cases ***
TC01_LoginScreen_Object
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Objects_webPage
    [Teardown]

TC02_LoginScreen_defaultUsernamePassword
    LoginNavigateURL
    ChangeToiFrame
    DefaultValueUsernamePassword
    [Teardown]

TC03_User_does_not_enter_email
    LoginNavigateURL
    ChangeToiFrame
    EmptyUsername

TC04_User_does_not_enter_password
    Set Selenium Speed    0.5
    LoginNavigateURL
    ChangeToiFrame
    EmptyPassword

TC05_User_does_not_enter_username_password
    LoginNavigateURL
    ChangeToiFrame
    EmptyUsername_or_Password

TC06_User_enters_invalid_email_format
    Set Selenium Speed    0.5
    LoginNavigateURL
    ChangeToiFrame
    InvalidUsernameFormat

TC07
    [Documentation]    To get data from an excel file using sheet name, test case name and column name
    ...    Using the data driven approach, getting deails from excel sheet
    LoadExcelData    Sheet1    TC07    Userame

TC07_User logs in with valid username and password
    LoginNavigateURL
    ChangeToiFrame
    Login
    Select Frame    id=iframe-115
    verfiyAfterLogin
