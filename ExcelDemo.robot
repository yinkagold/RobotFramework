*** Settings ***
Library           ExcelLibrary

*** Variables ***
${count1}         ${EMPTY}
@{Count}
${VAR1}           ${EMPTY}

*** Test Cases ***
ExcelTC01
    ExcelLibrary.Add New Sheet

ReadExcelDemo
    Open Excel    https://docs.google.com/spreadsheets/d/1hRVYzN0GaHgWEittVs1Am2Bd8a7m9a0CcTrnPPgm3XQ/edit#gid=0    Chrome
    Check Cell Type    Sheet1    2    1
    ${count1}    Get Column Count
    @{Count}    Get Column Values    Sheet1    2
    FOR    ${VAR1}    IN    @{Count}
        LOG    ${VAR1}
    ${count1}    Get Sheet Names
    ${VAR1}    Read Cell Data By Coordinates    Sheet1    1    1
    ${count1}    Read Cell Data By Name    Sheet1    E2

WriteToExcel
    [Documentation]    Copy excel file path and use forward slash for path
    ...    Create a new excel sheet and then save by name
    ...    demo sheet name and file name is demo.xls
    ...    When a opening a file, while saving the name it will be save needs to be different
    Open Excel
    Create Excel Workbook    demo
    Put String To Cell    demo    0    1    Gold
    Save Excel    demo.xls
