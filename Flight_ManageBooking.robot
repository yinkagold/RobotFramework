*** Settings ***
Test Teardown     Close Browser
Library           SeleniumLibrary
Resource          ExcelDataFetch.txt
Resource          CommonKeywords.txt

*** Test Cases ***
T08_Book a Flight-Round Trip betwen To and Fro Destinations_verify'Fromä cities
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    ValidateFromCity
    Logout
    [Teardown]    Close Browser

TC09_Book_a_Flight-Round_trip_bteween_To_and_From_Destinations_verify'To'_cities
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    ValidateToCity

T10_Book_a_Flight-Round_Trp_between_To_and_From_Destinations_Verify'Class'
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    ValidateClass

TC11_Book_a_Flight-Verfigy_Radio_Button_Should_Not_Be_Selected_By_Default
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    RadioButtonValidation

TC12_Book_a_Flight-OneWay_Trip_between_To_and_From_Destinations_From_Toronto_to_Paris_Economy
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    BookFirstFareFlight

TC13_NewYorkToMumbai
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    BookEconomy

TC14_BusinessClass
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    BookBusiness

TC15_Select_either_flight_or_flighthotel
    LoginNavigateURL
    ChangeToiFrame    id=iframe-015
    Login
    ChangeToiFrame    id=iframe-115
    verfiyAfterLogin
    ValidationOnManageBooking
    Click Element    xpath://button[contains(text(), 'Get Fare')]
    Wait Until Keyword Succeeds    2    1    Page Should Contain    Please choose one of Flight or Flight + Hotel!
