*** Settings ***
Resource        ../Keyword/WellevateRegistration.robot
Resource        ../Keyword/WellevateLogin.robot
Resource        ../Keyword/base_ui_keywords.robot
Resource        ../Resource/Input.robot
Library         ../Resource/FileReadAndWrite_FinalOne.py
Library           String




*** Test Cases ***

Checkout with Patient And Fetch Order ID
    [Tags]      Login with Existing Patient >> Fetch Order Number >>>> Write in Excel
    @{GetRowNumberAndColumnNumber_List}   Create List   ${ExcelLocation1}, ${AppendOrderNo_Sheet}
    @{RowNumberAndColumnNumber}    FileReadAndWrite_FinalOne.getRowAndColumnNumbers     @{GetRowNumberAndColumnNumber_List}
    : FOR    ${RowNumber}    IN RANGE    1    ${RowNumberAndColumnNumber[0]}
    \  @{ExcelFileReadDataFromExcel_List}   Create List   ${ExcelLocation1}, ${AppendOrderNo_Sheet}, ${RowNumber}
    \  @{ReadInputDataList}         FileReadAndWrite_FinalOne.ReadExcelData     @{ExcelFileReadDataFromExcel_List}
    \  Launch Browser
    \  Login with Patient and Practitioner      ${ReadInputDataList[0]}   ${ReadInputDataList[1]}
    #\  Checkout With New Patient ${RowNumber}  ${ColumnNumber} ${Items}  ${Timeout}  ${CardHolder}  ${CardNo}    ${CVV}    ${Month}    ${Year}
    \  Checkout With New Patient    ${RowNumber}  ${ColumnNumber}  ${ReadInputDataList[2]}  ${ReadInputDataList[3]}  ${ReadInputDataList[4]}  ${ReadInputDataList[5]}    ${ReadInputDataList[6]}    ${ReadInputDataList[7]}}    ${ReadInputDataList[8]}

