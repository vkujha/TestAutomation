*** Settings ***
Documentation       Page Objects Ancestor file. Contains extensions for Robot Framework and Common Keywords for Page Objects.
#Resource            ../resources/dependencies.robot


*** Variables ***
###### Locators Variables ######
${success_icon}                         css=i.success-icon

*** Keywords ***
######    Page Objects Functionality Extensions   ######


######    Framework Functionality Extensions   #####
Open Browser Session
    [Arguments]     ${url}    ${browser}
    Open Browser                                    ${url}    ${browser}
    Set Browser Implicit Wait                       ${implicit_wait_sec}
    Maximize Browser Window

Close Browser Session
   Close Browser

Verify section exists
    [Documentation]     Verifies section exists via checking labels.
    [Arguments]     @{list}
    ${length}       Get Length                          ${list}
    :FOR    ${i}    IN RANGE   0    ${length}
    \    ${element}    Set Variable    ${list[${i}]}
    \    Run Keyword If    "${element}"!=''     Page Should Contain     ${element}

Verify element highlighted
    [Arguments]     ${element_selector}     ${element_text}
    Element Should Be Visible                           ${element_selector}
    Page Should Contain                                 ${element_text}

Scroll Page
    [Documentation]    Scrolling current page [UP] or [DOWN]
    [Arguments]    ${direction}
    Run Keyword If    '${direction}'=='DOWN'    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Run Keyword If    '${direction}'=='UP'    Execute JavaScript    window.scrollTo(0, 0);

Scroll to element
    [Documentation]    Scrolling to the correct element
    [Arguments]    ${element_locator}
    ${y_pcoordinate}=       Get Vertical Position       ${element_locator}
    ${y_pcoordinate}=       Evaluate                    ${y_pcoordinate} - 150.0
    Execute JavaScript      window.scrollTo(0, ${y_pcoordinate})

Verify elements are present on the page
    [Documentation]     Verifies items are present on page.
    [Arguments]     @{locators_list}
    ${length}           Get Length                      ${locators_list}
    :FOR    ${i}    IN RANGE   0    ${length}
    \    ${element}    Set Variable    ${locators_list[${i}]}
    \    Element Should Be Visible     ${element}

Scroll To Element With CSS Locator
    [Documentation]    Scrolling to the element, even it is inside other element. Locators should not contain double quotes "
    [Arguments]    ${element_locator}
    ${locator}=    Fetch From Right    ${element_locator}    css=
    Execute Async Javascript    var elementToScroll = document.querySelector("${locator}");
    ...                         var stickyHeaderHeight = 160;
    ...                         elementToScroll.scrollIntoView();
    ...                         var position = elementToScroll.getBoundingClientRect();
    ...                         if (position.top < stickyHeaderHeight) {
    ...                             var scrollOn = 0 - stickyHeaderHeight - position.top;
    ...                             window.scrollBy(0, scrollOn);
    ...                         }
    ...                         var callback = arguments[arguments.length - 1];
    ...                         window.setTimeout(callback, 1000);

Scroll To Element With XPATH Locator
    [Documentation]    Scrolling to the element, even it is inside other element. Locators should not contain double quotes "
    [Arguments]    ${element_locator}
    Wait until Page Contains Element                      ${element_locator}
    ${locator}=    Fetch From Right    ${element_locator}    xpath=
    Execute Async Javascript    var elementToScroll = document.evaluate("${locator}" ,document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null ).singleNodeValue;
    ...                         var stickyHeaderHeight = 160;
    ...                         elementToScroll.scrollIntoView();
    ...                         var position = elementToScroll.getBoundingClientRect();
    ...                         if (position.top < stickyHeaderHeight) {
    ...                             var scrollOn = 0 - stickyHeaderHeight - position.top;
    ...                             window.scrollBy(0, scrollOn);
    ...                         }
    ...                         var callback = arguments[arguments.length - 1];
    ...                         window.setTimeout(callback, 1000);

Assert Message Equals
    [Documentation]     Compare two strings and return error in case they are different
    [Arguments]    ${actual_message}    ${expected_message}
    Should Be Equal    ${actual_message}    ${expected_message}
    ...    Message Should Be: "${expected_message}"; \nBut was:\t \ \ "${actual_message}"    values=False

Replace Placeholder In Locator
    [Documentation]     Replace some part in predefined locator with new required value.
    [Arguments]    ${locator_with_placeholder}    ${placehoder}    ${replace_on_string}
    ${updated_locator}=    Replace String    ${locator_with_placeholder}    ${placehoder}    ${replace_on_string}
    [Return]    ${updated_locator}

Press TAB Key On Element
    [Documentation]     Emulating TAB key press on some element.
    [Arguments]    ${element_to_press_tab_on}
    Press Key      ${element_to_press_tab_on}    \\9

Scroll Up
    [Documentation]    Scrolling to the correct element
    Execute JavaScript    window.scrollTo(0, 0)

Check if [Success] window appear
    Wait Until Element Is Visible           ${success_icon}

Check if [Success] window disappear
    Wait Until Element Is Not Visible       ${success_icon}         ${explicit_wait_5_sec}

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})


Read Column Data
    [Arguments]    ${ExcelLocation}    ${Sheet1}
    Open Excel  ${ExcelLocation}
    Create List  ${Empty}
    ${ColCount}  Get Column Count   ${Sheet1}
    Log to Console  ${ColCount}
     :FOR  ${Count}  IN RANGE     1   ${ColCount}
     \  ${InfoList}  Create List
     \  @{ROW1Data} =  GET Row Values      ${Sheet1}    ${COUNT}
     \  Log To Console   ${ROW1Data}
     \  ${Data} =  Get From List   ${ROW1Data}   ${Count}
     \ ${Key}=    Get From List    ${ROW1Data}    0
     \ ${VALUE}=    Get From List   ${ROW1Data}    1
     \  Log To Console   ${Key}
     \  Log To Console   ${VALUE}
     \  ReadColumn Data for user  ${ColCount}  ${ROW1Data}
#     Log To Console   @{ROW1Data}
#        Log To console   ${ROW1Data[1]}



ReadColumn Data for user
    [Arguments]    ${ColCount}   ${ROW1Data}
    :FOR  ${CollIndex}   IN RANGE    ${ColCount}
    \    ${Key}=    Get From List    ${ROW1Data}    ${CollIndex}
    \    Log To console   ${Key}
    \    ${Data} =  Get From List   ${ROW1Data}   ${ColIndex}
    \    Log To console   ${Data}
    \    ${LIST}  CONVERT TO List   ${DATA}
    \    ${Value1} = Get From List  ${List} 1
    \    Insert Into List  ${InfoList}  {ColIndex}  {Value1}
    Log To console   ${InfoList[0]}



Get Input Data By Processing Data File as Excel
    [Tags]    file-reading
    [Arguments]   ${WorkBookName}   ${SheetName}   ${ColumnNo}  ${RowNo}

    Open Excel     ${WorkBookName}
    ${VALUE}  Read Cell Data By Coordinates     ${SheetName}     ${ColumnNo}   ${RowNo}

    [Return]    ${VALUE}



Get Input Data By Processing Data File as CSV
    [Tags]    file-reading
    [Arguments]    ${FilleName}   ${LableName}

   ${FILE_CONTENT}=   Get File    Wellevate/Wellevate/TestData/InputData.csv
    Log    File Content: ${FILE_CONTENT}
    @{LINES}=    Split to Lines and Remove Header   ${FILE_CONTENT}
    Log    ${LINES}

   ${FILE_CONTENT}=   Get File    Wellevate/Wellevate/TestData/${FilleName}
    Log    File Content: ${FILE_CONTENT}
    @{LINES}=    Split to Lines and Remove Header   ${FILE_CONTENT}
    Log    ${LINES}

   ${RESULT}=    Set Variable    0
    : FOR    ${LINE}    IN    @{LINES}
    \    Log    ${LINE}
    \    @{COLUMNS}=    Split String    ${LINE}    separator=,
    \    ${Key}=    Get From List    ${COLUMNS}    1
    \    ${VALUE}=    Get From List    ${COLUMNS}    2
    \    Log    ${VALUE}
    \    Log    ${Key}
    \    Log    ${LableName}
    \    ${res}    Exit for loop if errors    Run Keyword If        '${LableName}'== '${Key}'    Fail   This is a failure
    \    Log    ${Result}
    [Return]    ${VALUE}





Get Input Data By Processing Data File as ExcelFile
    [Tags]    file-reading
    [Arguments]   ${WorkBookName}   ${SheetName}
    Open Excel     ${WorkBookName}
    ${colCount}    Get Column Count    ${SheetName}
    #:FOR  ${ColIndex}   IN RANGE   0   ${colCount}
    #\   ${VALUE}  Read Cell Data By Coordinates     ${SheetName}     ${ColIndex}    1
    ${VALUE0}    Read Cell Data By Coordinates     ${SheetName}         0            1
    ${VALUE1}    Read Cell Data By Coordinates     ${SheetName}         1            1
    ${VALUE2}    Read Cell Data By Coordinates     ${SheetName}         2            1
    ${VALUE3}    Read Cell Data By Coordinates     ${SheetName}         3            1
    ${VALUE4}    Read Cell Data By Coordinates     ${SheetName}         4            1
    ${VALUE5}    Read Cell Data By Coordinates     ${SheetName}         5            1
    ${VALUE6}    Read Cell Data By Coordinates     ${SheetName}         6            1
    ${VALUE7}   Read Cell Data By Coordinates      ${SheetName}         7            1

    @{MyList}=    Create List  ${VALUE0}  ${VALUE1}   ${VALUE2}  ${VALUE3}  ${VALUE4}  ${VALUE5}  ${VALUE6}  ${VALUE7}
    [Return]    ${MyList}



Get Input Data By Processing Data File as ExcelFile1
    [Tags]    file-reading
    [Arguments]   ${WorkBookName}   ${SheetName}
    Open Excel     ${WorkBookName}
    ${colCount}    Get Column Count    ${SheetName}
    #:FOR  ${ColIndex}   IN RANGE   0   ${colCount}
    #\   ${VALUE}  Read Cell Data By Coordinates     ${SheetName}     ${ColIndex}    1
    ${VALUE0}    Read Cell Data By Coordinates     ${SheetName}         0            1
    ${VALUE1}    Read Cell Data By Coordinates     ${SheetName}         1            1

    @{MyList}=    Create List  ${VALUE0}  ${VALUE1}
    [Return]    ${MyList}



Get Input Data By Processing Data File as ExcelFile2
    [Tags]    file-reading
    [Arguments]   ${WorkBookName}   ${SheetName}
    Open Excel     ${WorkBookName}
    ${colCount}    Get Column Count    ${SheetName}
    #:FOR  ${ColIndex}   IN RANGE   0   ${colCount}
    #\   ${VALUE}  Read Cell Data By Coordinates     ${SheetName}     ${ColIndex}    1
    ${VALUE0}    Read Cell Data By Coordinates     ${SheetName}         0            1
    ${VALUE1}    Read Cell Data By Coordinates     ${SheetName}         1            1
    ${VALUE2}    Read Cell Data By Coordinates     ${SheetName}         2            1
    ${VALUE3}    Read Cell Data By Coordinates     ${SheetName}         3            1
    ${VALUE4}    Read Cell Data By Coordinates     ${SheetName}         4            1

    @{MyList}=    Create List  ${VALUE0}  ${VALUE1}   ${VALUE2}  ${VALUE3}  ${VALUE4}
    [Return]    ${MyList}