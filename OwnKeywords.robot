*** Settings ***
Library           join.py

*** Variables ***
${var}            ${EMPTY}

*** Test Cases ***
joinStrings
    ${var}    Join Two Strings    Omolola    Olayinka
    log    ${var}
