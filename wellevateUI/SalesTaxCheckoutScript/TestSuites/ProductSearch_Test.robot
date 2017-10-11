*** Settings ***
Documentation    Suite description
Resource        ../Keyword/WellevateRegistration.robot
Resource        ../Keyword/WellevateLogin.robot
Resource        ../Keyword/ProductSearch.robot
Resource        ../Keyword/base_ui_keywords.robot
Resource        ../Resource/Input.robot
Library         ../Resource/FileReadAndWrite_FinalOne.py
Library           String

*** Test Cases ***

Product Global Search Practioner Login
    [Tags]      Login with Existing Patient >> Global Search Product Code >> Assert on Actual And Expected
    @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, Prac_LoginCredentials
    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, Prac_LoginCredentials, ${RowNumber}
    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
    \  Launch Browser
    \  Login with Patient and Practitioner      ${ReadInputDataList[0]}   ${ReadInputDataList[1]}
    \  Global Search using Product Code For Practitioner         ${ReadInputDataList[2]}



Product Dispansary Search Practioner Login
    [Tags]      Login with Existing Patient >> Dispansary Search Product Code >> Assert on Actual And Expected
    @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, Prac_LoginCredentials
    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, Prac_LoginCredentials, ${RowNumber}
    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
    \  Launch Browser
    \  Login with Patient and Practitioner      ${ReadInputDataList[0]}   ${ReadInputDataList[1]}
    \  Dispansary Search using Product Code For Practitioner        ${ReadInputDataList[2]}



Product Global Search Patient Login
    [Tags]      Login with Existing Patient >> Global Search Product Code >> Assert on Actual And Expected
    @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, Pat_LoginCredentials
    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, Pat_LoginCredentials, ${RowNumber}
    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
    \  Launch Browser
    \  Login with Patient and Practitioner      ${ReadInputDataList[0]}   ${ReadInputDataList[1]}
    \  Global Search using Product Code for Patient         ${ReadInputDataList[2]}



Product Dispansary Search Patient Login
    [Tags]      Login with Existing Patient >> Dispansary Search Product Code >> Assert on Actual And Expected
    @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, Pat_LoginCredentials
    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, Pat_LoginCredentials, ${RowNumber}
    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
    \  Launch Browser
    \  Login with Patient and Practitioner      ${ReadInputDataList[0]}   ${ReadInputDataList[1]}
    \  Dispansary Search using Product Code For Patient         ${ReadInputDataList[2]}





#*** Keywords ***
#Provided precondition
#    Setup system under test