*** Settings ***
Resource        ../Resource/Input.robot
Resource        ../Resource/Locator.robot
Resource        ../Keyword/base_ui_keywords.robot

*** Keywords ***

Launch Browser
    open Browser      ${WellevateURL}     ${Browser}
    Maximize Browser Window

Login
    Double Click Element    ${LoginButton}
    Sleep   5
    Input Text      ${userName}     ${UName}
    Input Text      ${Password}     ${PWord}
    Click Button    ${LoginButtonAtPopUp}

WelleVate LaunchBrowserAndLogin
   Launch Browser
   Sleep   15
   Login


Login with Patient and Practitioner
    [Arguments]     ${UName}     ${PWord}
    Sleep   22
    Double Click Element    ${LoginButton}
    Sleep   5
    Input Text      ${userName}     ${UName}
    Input Text      ${Password}     ${PWord}
    Sleep   10
    Click Button    ${LoginButtonAtPopUp}


Logout
   Sleep   10
   Scroll to element      ${AccountImageLogo}
   Sleep   5
   Double Click Element    ${AccountImageLogo}
   Sleep   5
   Double Click Element         ${Logout}

Login Patient at Patient Home Page
   [Arguments]    ${UName}   ${PWord}
    Sleep   5
    Input Text      ${PatEmail}     ${UName}
    Input Text      ${PatPass}     ${PWord}
    Click Button    ${SubmitButton}


##
