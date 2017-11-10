*** Settings ***

Resource     Selenium2Library
Library      ExcelLibrary



*** Variables ***
${UName}                testprac3105@mailinator.com
${PWord}                Well@123
${OldEmersonURL}      https://qa.emersonecologics.com/User/Login.aspx
${OldEmerson}         OldEmerson
${OldEmersonwithExceptionUser}    OldEmersonEU
${ExcelLocation1}         TransformerScript\\TestData\\WellweteTextCases.xls
${Browser}      Chrome
 #      Chrome
 #     ff
