*** Settings ***
Library         Selenium2Library
Resource         ../Resource/OldEmersonInput.robot
Resource         ../Resource/OldEmersonLocator.robot
Library           OperatingSystem



*** Keywords ***

Launch Browser For Old QA
  [Arguments]       ${Browser}
      SelectBrowser
      Maximize Browser Window

Launch Browser For Old Emerson-IE Browser
    Set Environment Variable    webdriver.ie.driver    C:\\Users\\vivek.jha\\git\\QaAutomation\\RobotTests\\wellevateUI\\Driver\\IEDriverServer.exe
    Open Browser    ${OldEmersonURL}    ie

Launch Browser For Old Emerson-Safari Browser
   # Create Webdriver    Safari    C:\\Users\\vivek.jha\\git\\QaAutomation\\RobotTests\\wellevateUI\\Driver\\selenium-safari-driver-2.43.1.jar
    Open Browser    ${OldEmersonURL}    Safari

OLD QA Login
   [Arguments]       ${UName}    ${PWord}
     Sleep   15
     Log To Console   Page Fully Loaded
     Input Text      ${userName}      ${UName}
     Sleep   5
     Input Text      ${Password}      ${PWord}
     Click Button    ${LoginButtonAtPopUp}

OLD QA Login in Diff Frame
    [Arguments]       ${UName}    ${PWord}
     ${count}=    Get Matching Xpath Count    //iframe[@id="ctrlLoginSSL_ifLogin"]
     Log To Console    Frame Size is ${count}
     Select Frame    ${LoginFrame}
     Input Text      ${userNameF}      ${UName}
     Input Text      ${PasswordF}      ${PWord}
     Click Button     ${LoginButtonAtPopUpF}



Verify Redirection From OLD TO New Website
| | Sleep | 10
| | ${count} | Get matching xpath count | xpath=//div[@class='ng-binding layout-align-center-center layout-column']/h1
| | Log To console | ${count}
| | Run Keyword If | "${count}" == "1"
| | ... | Log To console | ${count}
| | ... | ELSE
| | ... | Log To console | ${count}

Verify No Redirection From OLD TO New Website
| | Sleep | 10
| | ${count} | Get matching xpath count | xpath=//a[@id='hypHome']/img
| | Log To console | ${count}
| | Run Keyword If | "${count}" == "1"
| | ... | Log To console | Not Redirected To New Emerson
| | ... | ELSE
| | ... | Log To console | Rediredted To New Emerson


SelectBrowser
| | Log To Console | Browser Is ${Browser}
| | Run Keyword If | "${Browser}" == "Chrome"
| | ... | ChromeCompatible
| | ... | ELSE
| | ... | FirefoxCompatible


FirefoxCompatible
       Set Log Level    trace
      ${caps}=    Evaluate    sys.modules['selenium.webdriver'].DesiredCapabilities.FIREFOX.copy()    sys, selenium.webdriver
      Create Webdriver    Firefox    capabilities=${caps}
      Go To    ${OldEmersonURL}

ChromeCompatible
       open Browser      ${OldEmersonURL}     ${Browser}