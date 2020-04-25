*** Settings ***
Library           AutoItLibrary
Library           Selenium2Library

*** Variables ***
${abc}            ${EMPTY}

*** Test Cases ***
openCalculator
    Run    calc.exe
    Win Wait Active    Calculator
    Control Click    Calculator    \    Button10
    Win Close    Calculator

notePad
    Run    notepad.exe
    Control Set Text    Untitled - Notepad    \    Edit1    First Deskop Automation
    sleep    1
    Control Send    Untitled - Notepad    \    Edit1    Second Desktop Automation
    Sleep    1
    Send    Third Desktop Automation
    Process Close    notepad.exe
    Run    calc.exe
    Win Wait Active    Calculator
    ${abc}    Statusbar Get Text    Calculator
    log    ${abc}
