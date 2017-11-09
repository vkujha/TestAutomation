*** Settings ***

Resource    ../Keyword/OldEmersonLogin.robot
Resource         ../Resource/OldEmersonInput.robot
Resource         ../Resource/OldEmersonLocator.robot
Resource        ../Keyword/base_ui_keywords.robot
Library         ../Resource/FileReadAndWrite_FinalOne.py
Library           String


*** Test Cases ***

#[Test Cases TC001 oldEmerson Login With Normal User For App will be Redirect To Redesign New ]
#   @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, ${OldEmerson}
#    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
#    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
#    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, ${OldEmerson}, ${RowNumber}
#    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
#    \   Launch Browser For Old QA    ${ReadInputDataList[0]}
#    \   OLD QA Login     ${ReadInputDataList[1]}    ${ReadInputDataList[2]}
#    \   ${Location}   Get Location
#    \    Log To Console     ${Location}
#    \    Wait Until Element Is Visible     ${WelcomePOPUP}       60
#    \    Verify Redirection From OLD TO New Website
#    \    Close Browser


#[Test Cases TC002 oldEmerson Login With Normal User For App will be Not Redirect To Redesign New]
#   @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, ${OldEmersonwithExceptionUser}
#    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
#    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
#    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, ${OldEmersonwithExceptionUser}, ${RowNumber}
#    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
#    \   Launch Browser For Old QA    ${ReadInputDataList[0]}
#    \   OLD QA Login     ${ReadInputDataList[1]}    ${ReadInputDataList[2]}
#    \   ${Location}   Get Location
#    \    Log To Console     ${Location}
#    \    Wait Until Element Is Visible     ${OldEmersonLogo}        60
#    \    Verify No Redirection From OLD TO New Website
#    \    Close Browser


[Test Cases TC003 oldEmerson Login With Normal User For App will be Redirect To Redesign New -From Iframe Login ]
    @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, ${OldEmerson}
    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, ${OldEmerson}, ${RowNumber}
    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
    \   Launch Browser For Old QA    ${ReadInputDataList[0]}
    \   OLD QA Login in Diff Frame     ${ReadInputDataList[1]}    ${ReadInputDataList[2]}
    \   ${Location}   Get Location
    \    Log To Console     ${Location}
    \    Wait Until Element Is Visible     ${WelcomePOPUP}       60
    \    Verify Redirection From OLD TO New Website
    \    Close Browser



#[Test Cases TC004 oldEmerson Login With Normal User For App will be not Redirect To Redesign New -From Iframe Login ]
#   @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, ${OldEmersonwithExceptionUser}
#    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
#    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
#    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, ${OldEmersonwithExceptionUser}, ${RowNumber}
#    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
#    \   Launch Browser For Old QA    ${ReadInputDataList[0]}
#    \   OLD QA Login in Diff Frame     ${ReadInputDataList[1]}    ${ReadInputDataList[2]}
#    \   ${Location}   Get Location
#    \    Log To Console     ${Location}
#    \    Wait Until Element Is Visible     ${OldEmersonLogo}        60
#    \    Verify No Redirection From OLD TO New Website
#    \    Close Browser


[Test Cases TC005 oldEmerson Login With Normal User For App will be Redirect To Redesign New -From Iframe Login on IE Browser]
    @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, ${OldEmerson}
    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, ${OldEmerson}, ${RowNumber}
    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
    \   Launch Browser For Old Emerson-IE Browser
    \   OLD QA Login in Diff Frame     ${ReadInputDataList[1]}    ${ReadInputDataList[2]}
    \   ${Location}   Get Location
    \    Log To Console     ${Location}
    \    Wait Until Element Is Visible     ${OldEmersonLogo}       60
    \    Verify No Redirection From OLD TO New Website
    \    Close Browser