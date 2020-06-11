*** Settings ***
Library     ExampleLibrary
Library     Dialogs
Variables   variables.py

*** Variables ***
${GA_UCC_LOGIN_URL}      https://apps.gsccca.org/login.asp
${GA_UCC_SEARCH_URL}      https://search.gsccca.org/UCC_Search/search.asp?searchtype=Article9

*** Keyword ***
Teardown Actions
    ${debug}=   Get Environment Variable    ROBOT_PAUSE_ON_FAILURE      "FALSE"
    Run Keyword if      '${SUITE_STATUS}' == 'FAIL' and '${debug}' == 'TRUE'       Pause Teardown On Failure
    Close All Browsers

*** Keyword ***
Pause Teardown On Failure
    Pause Execution     "Paused due to task failure, click OK to continue teardown"

*** Keyword ***
Open State of GA UCC Search
    Open Available Browser  ${GA_UCC_LOGIN_URL}

*** Keyword ***
Login to GA UCC Search
    [Arguments]     ${username}     ${password}
    Wait Until Element Is Visible   name:txtUserID
    Input Text  name:txtUserID  ${username}
    Input Text  name:txtPassword  ${password}
    Submit Form  //form[@name="frmLogin"]

** Keyword ***
Check for visibility and click
    [Arguments]    ${selector}
    Wait Until Element Is Visible   ${selector}
    Click Element   ${selector}

** Keyword **
Search for federal tax lien on business
    [Arguments]     ${text}
    Go To       ${GA_UCC_SEARCH_URL}
    Select Radio Button   debtorsearch   0
    Select Radio Button   exact   0
    Input Text  name:DebtorOrganizationName  ${text}
    Submit Form  //form[@name="frmSearch"]

** Keyword ***
Check for any results
    Wait Until Page Contains Element    //table[@class='TABLEResults']
    ${text}=  Get Text      //table[@class='TABLEResults']
    Create File   output/text.txt     ${text}