*** Settings ***
Library     Selenium2Library
Resource         ../Resource/Input.robot
Resource        ../LocatorAndInput/Locator.robot
Resource        ../Keyword/base_ui_keywords.robot
Resource        ../Keyword/WellevateLogin.robot
Library            AutoItLibrary
Library         ../Resource/FileReadAndWrite_FinalOne.py

*** Keywords ***


Split to Lines and Remove Header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    Remove From List    ${LINES}    0
    [Return]    @{LINES}

Get Registration Entity Data Values
    [Arguments]    ${LIST}   ${LableName}
    ${RESULT}=    Set Variable    0
    : FOR    ${LINE}    IN    @{LIST}
    \    Log    ${LINE}
    \    @{COLUMNS}=    Split String    ${LINE}    separator=,
    \    ${Key}=    Get From List    ${COLUMNS}    1
    \    ${VALUE}=    Get From List    ${COLUMNS}    2
    \    Log    ${VALUE}
    \    Log    ${Key}
    \    Log    ${LableName}
##    \    Run Keyword If    '${Key}' == 'FIRST NAME'    ${Result} = ${VALUE}
    \    Log    ${Result}
    [Return]    ${VALUE}




Registration of Wellevate Practitioner
   [Arguments]    ${FName}   ${LName}  ${RandomEmailId}    ${Pass}   ${CPass}   ${ProfAddress}    ${CityName}   ${StateValue}   ${ZipCodeName}   ${Phone}   ${PractitionerTypeValue}
   Double Click Element     ${PractitionerRegistrationBuble}
   Sleep   5
   Input Text     ${FirstName}    ${FName}
   Input Text     ${LastName}     ${LName}
   Input Text     ${Email}        ${RandomEmailId}
  # Input Text     ${Email}        ${EmailExt}
   Sleep   5
   Input Text      ${Password1}      ${Pass}
   Input Text      ${confirmPassword2}    ${CPass}
   Scroll Page   DOWN
   Sleep   5
   Double Click Element    ${CreateAccount}
   Sleep   15
   Input Text   ${ProfeesionalAddress}   ${ProfAddress}
   Input Text   ${City}     ${CityName}
   Sleep   10
   Select From List by Value     ${StateDD}     ${StateValue}
   Input Text   ${ZipCode}   ${ZipCodeName}
   Input Text   ${PhoneNumber}     ${Phone}
   Select From List by Value    ${PractitionerType}      ${PractitionerTypeValue}
   Scroll Page   DOWN
   Sleep   10
  # Choose File     ${UpdatedCertification}    ${CURDIR}\\image1.png
   Double Click Element   ${SubmitButton}
   Sleep   12
   Practitioner Registration Completion Message
   Double Click Element   ${VisitMyDashBoard}
   Sleep  20
   ClosePopUpAtHomePage
   Sleep   5
   NavigateToAccountSettingPage

Practitioner Select Mandatory Attribute Dispensary
    [Arguments]   ${ShopAllProducts}    ${OpenAcess}
  #  Go To    ${PractitionerDashboard}
    Scroll to element     ${DispensaryType}
    Double Click Element    ${DispensaryType}
    Sleep   10
    Double Click Element    ${ShopAllProducts}
    Sleep   5
    Scroll Page    DOWN
    Scroll to element      ${OpenAcess}
    Double Click Element    ${OpenAcess}
    Sleep  3
    Scroll Page    DOWN
    Double Click Element   ${DispensarySubmitButton}
    Scroll Page    UP


Practitioner Select Mandatory Attribute Sales Tax
  [Arguments]    ${CertificationNo}   ${OptIn}
 # NavigateToAccountSettingPage
  Sleep  5
  Scroll to element       ${SalesTaxButton}
  Double Click Element    ${SalesTaxButton}
  Sleep   10
  Agree TO Wellevate
  Sleep   5
  Scroll to element        ${OptIn}
  Double Click Element     ${OptIn}
  Sleep   5
  Input Text   ${ResaleCertification}    ${CertificationNo}
  Sleep  10
  Select Additional State


Sales Tax Setting for Non Taxable state
   [Arguments]     ${AdditionalStateInput}
     Sleep  5
     Scroll to element       ${SalesTaxButton}
     Double Click Element    ${SalesTaxButton}
     Sleep   10
     Agree TO Wellevate
     Sleep   5
     Selet Additional State For Non Taxable state     ${AdditionalStateInput}
     #Choose File
     Sleep   5
     Double Click Element    ${CompleteButton}


Sales Tax Setting for Taxable state (Non Nexus States)
     [Arguments]     ${AdditionalStateInput}
      Sleep  5
   Scroll to element       ${SalesTaxButton}
   Double Click Element    ${SalesTaxButton}
   Sleep   10
   Agree TO Wellevate
    Sleep   5
   Scroll to element        ${OptIn}
   Double Click Element     ${OptIn}
   Sleep   5
 # Input Text   ${ResaleCertification}    ${CertificationNo}
   Sleep  10
   Selet Additional State For Non Taxable state     ${AdditionalStateInput}
    Sleep   5
    Double Click Element    ${CompleteButton}




Completeing mandatory information as Business Setting Tab for new Practioner
#  Sleep   10
#  click element            ${D_UserIcon}
#  Sleep   1
#  click element            ${D_accountSectionButton}
  Sleep   20
  Scroll to element        ${D_prBusinessSettingTab}
  Sleep   5
  click element            ${D_prBusinessSettingTab}
  Sleep   5
  click element            ${D_patientProfitType}
  Scroll Page To Location    0    2000
  Sleep  5
  Drag And Drop By Offset           ${D_profitSlideBarIncrease}    250    0
  Sleep  5
  click button             ${D_SaveChanges}
  Sleep   5
  Scroll Page              UP
  click element            ${D_stripeButton}
  Sleep  5
  Select Window            Title=Stripe: Connect with wellevate ℠
  Sleep  5
  click element            ${D_stripeAccount}
  Sleep  5
  Comment                  Go back to the first window
  Sleep    5
  Select Window            Title=wellevate(SM)
  Reload Page
  Sleep    15
  #Drag And Drop By Offset    xpath=//section[@id='business-settings']/form/div[5]/span/span[6]    450    0
  Logout
  Close Browser Session

Registration of New Patient With Existing Practitioner
    [Arguments]     ${Browser}  ${DispURL}  ${PatFName}    ${PatLName}    ${PatEmailId}    ${PatPass}    ${PatCPass}  ${PatAdd1}   ${PatAdd2}   ${PatCITY}   ${PATZIPCODE}

    open Browser    ${DispURL}   ${Browser}
    Sleep  10

    Maximize Browser Window
    Sleep  5
    Input Text   ${PatientFirstName}            ${PatFName}
    Input Text   ${PatientLastName}             ${PatLName}
    Input Text   ${PatientEmai}                 ${PatEmailId}
    Sleep  5
    Input Text    ${PatientPassword1}              ${PatPass}
    Input Text    ${PatientConfirmPassword2}      ${PatCPass}
    Sleep  5
    Scroll Page    UP
    Sleep  15
    Double Click Element   ${PatientCreateAccount}
    Sleep   15
    Input Text   ${PatientAdress1}    ${PatAdd1}
    Input Text   ${PatientAddress2}   ${PatAdd2}
    Input Text   ${PatientCity}       ${PatCITY}
   #Select From List by Value   ${PatientState}   ${PatSTATE}
    Double Click Element    ${PatientState}
    Sleep  13
    Double Click Element   ${PatientStateOption}
    Sleep   15
    Input Text   ${ZipCode}    ${PATZIPCODE}
     Sleep   15
    Double Click Element   ${CompleteButton}
    Log To Console         ${PatCITY}
    Sleep   15
    Close Browser Session
    Launch Browser
    Sleep   15
    Login with Patient and Practitioner   ${PatEmailId}      ${PatPass}
    Sleep   15
    Close Browser Session


Checkout With New Patient
   [Arguments]  ${RowNumber}  ${ColumnNumber}  ${Items}  ${Timeout}  ${CardHolder}  ${CardNo}  ${CVV}  ${Month}  ${Year}
    Sleep   10
    Add Multiple Items In Cart2  ${Items}
    #Add Multiple Items In Cart   ${Item1}   ${Item2}   ${Item3}    ${Item4}

    Sleep   20
    Double Click Element   ${CartIcon}
    Sleep   10
    Double Click Element   ${CheckoutButton}
    #Wait Until Element Is Enabled     ${ContinueButton}       ${Timeout}
    Sleep   20
    Double Click Element      ${SameAddressRadioButton}
    Sleep   5
    Double Click Element    ${ContinueButton}
    Sleep  13
    Address Suggestion
    Sleep  30
    Wait Until Element Is Visible     ${NextDayAir}       ${Timeout}
    Sleep  5
    Double Click Element   ${NextDayAir}
    Sleep  13
    Scroll Page    DOWN
    Sleep  5
    #Wait Until Element Is Visible     ${ShippingMethodNextStepButton}      ${Timeout}
    Double Click Element   ${ShippingMethodNextStepButton}
    Sleep  20
    Log To Console  Get Element Attribute   ${Payment_M}@class
    Payment Mode Selection
    Wait Until Element Is Visible    ${CardNextButton}      ${Timeout}
    Double Click Element   ${CardNextButton}
    Sleep  10
    Scroll Page    DOWN
    Wait Until Element Is Visible    ${PlaceOrder}      ${Timeout}
    Double Click Element    ${PlaceOrder}
    Sleep  20
    ${PO_NO}    Get Text   ${OrderNo}
    Log To Console    ${PO_NO}

    Log   ${PO_NO}
    @{ExcelFileWiteOrderNumberFile_List}   Create List   ${ExcelLocation1}, ${AppendOrderNo_Sheet}, ${RowNumber}, ${ColumnNumber}, ${PO_NO}
    FileReadAndWrite_FinalOne.appendExcel     @{ExcelFileWiteOrderNumberFile_List}

    Order Status Assertion
    Sleep  5
    Close Browser Session




Add Multiple Items In Cart
    [Arguments]      ${Item1}   ${Item2}   ${Item3}    ${Item4}
    @{Items}=     Create List     ${Item1}   ${Item2}   ${Item3}    ${Item4}
    : For   ${Item}  IN RANGE    0       2
    \   log  ${Items[${Item}]}
    \   Sleep   15
    \   Double Click Element     ${SearchIcon}
    \   Sleep   8
    \   Clear Element Text    ${ProductSearchPlace}
    \  Input text   ${ProductSearchPlace}   ${Items[${Item}]}
    \  Sleep  15
    \  Double Click Element   ${ClickOnProductFirst}
    \  Sleep  8
    \  Double Click Element   ${AddToCartButton}
    \  Sleep   8

No Item In Cart Check
| | ${count} | Get matching xpath count | xpath=(//span[@ng-if='!match.model.header'])[1]
| | Log To console | Count of Cart Element Size ${count}
| | Log To console | ${count}
| | Sleep | 5
| | Run Keyword If | ${count} >= 1
| | ... | Double Click Element | xpath=(//span[@ng-if='!match.model.header'])[1]
| | Sleep | 5
| | Run Keyword If | ${count} >= 1
| | ... | Double Click Element | xpath=//a[@ng-click='vm.addToCart(vm.quantity)']
| | Sleep | 5
| | Run Keyword If | ${count} == 0
| | ... | Double Click Element | xpath=(//span[@class='search-close link absolute'])[2]



#No Item In Cart Check
#    | | ${count} | Get matching xpath count | xpath=(//span[@ng-if='!match.model.header'])[1]
#    | | Log To Console | ${count}
#    | | Run Keyword If | ${count} >= 1
#    | | ... | Double Click Element | xpath=(//span[@ng-if='!match.model.header'])[1]
#    | | ... | Sleep  | 9
#    | | ... | Double Click Element | xpath=//a[@ng-click='vm.addToCart(vm.quantity)']
#    | | ... | ELSE
#    | | ... | Double Click Element | xpath=//*[@class='search-close link absolute']/i




Add Multiple Items In Cart2
    [Arguments]      ${Items}
    @{ItemList}           splitwithSeperator     ${Items}
    log    ${ItemList}
    : For   ${ItemList}  IN    @{ItemList}
    \   log  ${ItemList}
    \   Sleep   8
    \   Double Click Element     ${SearchIcon}
    \   Sleep   9
    \   Clear Element Text    ${ProductSearchPlace}
    \   Input text   ${ProductSearchPlace}   ${ItemList}
    \   Sleep   8
    \   No Item In Cart Check
    \   Sleep   8


Add Multiple Items In Cart1
    [Arguments]      ${Items}
    @{ItemList}           splitwithSeperator     ${Items}
    log    ${ItemList}
    : For   ${ItemList}  IN    @{ItemList}
    \   log  ${ItemList}
    \   Sleep   10
    \   Double Click Element     ${SearchIcon}
    \   Sleep   9
    \   Clear Element Text    ${ProductSearchPlace}
    \  Input text   ${ProductSearchPlace}   ${ItemList}
    \  Sleep   8
    \  Double Click Element   ${ClickOnProductFirst}
    \  Sleep  10
    \  Double Click Element   ${AddToCartButton}
    \  Sleep   8



Checkout With Old Patient
   [Arguments]   ${Timeout}  ${Item1}   ${Item2}   ${Item3}    ${Item4}
    Sleep  10
    Add Multiple Items In Cart   ${Item1}   ${Item2}   ${Item3}    ${Item4}
    Add Multiple Items In Cart1   ${Item1}   ${Item2}   ${Item3}    ${Item4}
    Log To Console    ${CardHolder}   ${CardNo}   ${CVV}
    Sleep   10
    Double Click Element   ${CartIcon}
    Sleep   10
    Double Click Element   ${CheckoutButton}
    #Wait Until Element Is Enabled     ${ContinueButton}       ${Timeout}
    Sleep   20
    Double Click Element      ${SameAddressRadioButton}

    Sleep   5
    Double Click Element    ${ContinueButton}
    Sleep  3
    Address Suggestion
    Sleep  3
    Wait Until Element Is Visible     ${NextDayAir}       ${Timeout}
    Double Click Element   ${NextDayAir}
    Wait Until Element Is Visible     ${ShippingMethodNextStepButton}      ${Timeout}
    Double Click Element   ${ShippingMethodNextStepButton}
    Sleep  5
    Payment Mode Selection
    Wait Until Element Is Visible    ${CardNextButton}      ${Timeout}
    Double Click Element   ${CardNextButton}
    Wait Until Element Is Visible    ${PlaceOrder}      ${Timeout}
    Sleep  5
    Scroll to element      ${PlaceOrder}
    Double Click Element    ${PlaceOrder}
    Sleep   10
    ${PO_NO}    Get Text   ${OrderNo}
    Order Status Assertion
    Log To Console    ${PO_NO}
    Sleep  5
    Close Browser Session



Agree TO Wellevate
| | ${count} | Get matching xpath count | xpath=//label[@for='has_agreed_terms']
| | Log To console | ${count}
| | Run Keyword If | "${count}" == "1"
| | ... | Double Click Element | xpath=//label[@for='has_agreed_terms']
| | ... | ELSE
| | ... | Log To console | ${count}


ClosePopUpAtHomePage
| | ${count} | Get matching xpath count | xpath=//button[@ng-click='cancel()']
| | Log To console | ${count}
| | Run Keyword If | "${count}" == "1"
| | ... | Double Click Element | xpath=//button[@ng-click='cancel()']
| | ... | ELSE
| | ... | Log To console | ${count}


NavigateToAccountSettingPage
   Sleep  20
   Double Click Element    ${AccountImageLogo}
   Sleep   5
   Double Click Element    ${AccountSettings}
   Sleep   5


Address Suggestion
| | Sleep | 5

| | ${count} | Get matching xpath count | xpath=//div[@id='qas-popup']/div[@class='box']//li
| | Sleep | 5
| | Log To console | count of Element is: ${count}
| | Run keyword if | "${count}" == "0"
| | ... | Log To Console | the result is 0
| | ... | ELSE
| | ... | Select Address


Select Address
   Double Click Element    xpath=(//ul[@class='suggestions']/li)[1]
   Double Click Element    xpath=//a[@class='btn btn-primary step-choose']


#Address Suggestion
#| | ${count} | Get matching xpath count | xpath=//ul[@class='suggestions']/li
#| | Sleep | 5
#| | Log To console | ${count}
#| | Run keyword if | "${count}" == "0"
#| | ... | Log To Console | the result is 0
#| | ... | ELSE
#| | ... | Double Click Element | xpath=//a[@class='btn btn-primary step-continue']



Payment Mode Selection
| | ${count} | Get matching xpath count | xpath=//ul[@id='saved-cards']/li[2]/label/span
| | Log To console | Count of Payment Element Size ${count}
| | Log To console | ${count}
| | Run Keyword If | ${count} >= 1
| | ... | Double Click Element | xpath=//ul[@id='saved-cards']/li[1]/label
| | ... | ELSE
| | ... | Payment Detail


Payment Detail
    Wait Until Element Is Visible     ${CardHolderName}      ${Timeout}
    Scroll Page   UP
    Sleep  5
    Log To Console    CardHolderName is : ${CardHolder}
    Input Text     ${CardHolderName}         ${CardHolder}
    Input Text     ${CreditCardNumber}       ${CardNo}
    Input Text     ${CVVNo}                  ${CVV}
    Sleep   5
    Select From List by Value     ${ExpMonthDropdown}        ${Month}
    Select From List by Value     ${ExpYearDropdown}        ${Year}
    Scroll Page   DOWN



Order Status Assertion
   ${OrderConfirmation}         Get Text	 ${OrderStatus}
   Log To Console     ${OrderConfirmation}
   Should be equal as strings       ${OrderConfirmation}      ${orderMsg}


Additional State CheckBox Handling
| | ${Is_Checkbox_Selected} | Run Keyword And Return Status | Checkbox Should Be Selected | xpath=//input[@id='opt-in-checkbox']
| | Log To Console | ${Is_Checkbox_Selected}
| | Run Keyword If | '${Is_Checkbox_Selected}' == 'False'
| | Select Additional State
| | ... | ELSE
| | Double Click Element | ${SaveChangesButton}


Select Additional State
    Double Click Element    ${OptInSalesTx}
    Select From List by Value    ${ADditionalState}      ${AdditionalStateInput}
    Input Text    ${ResaleCertification}      ${CertificationNo}

Selet Additional State For Non Taxable state
     [Arguments]     ${AdditionalStateInput}
      Double Click Element    ${OptInSalesTx}
      Select From List by Value    ${ADditionalState}      ${AdditionalStateInput}


Practitioner Registration Completion Message
  ${RegMessage}        Get Text    ${PractitionerRegistration}
  Log To Console     ${RegMessage}
  Should be equal as strings    ${RegMessage}      ${PractitionerRegistrationMessage}

Registration With Non Taxable State
     [Arguments]    ${FName}   ${LName}  ${RandomEmailId}    ${Pass}   ${CPass}  ${ProfAddressNonTaxable}    ${CityNameNonTaxable}     ${StateValueNonTaxable}    ${ZipCodeNameNonTaxable}   ${Phone}   ${PractitionerTypeValue}
   Double Click Element     ${PractitionerRegistrationBuble}
   Sleep   5
   Input Text     ${FirstName}    ${FName}
   Input Text     ${LastName}     ${LName}
   Input Text     ${Email}        ${RandomEmailId}
  # Input Text     ${Email}        ${EmailExt}
   Sleep   5
   Input Text      ${Password1}      ${Pass}
   Input Text      ${confirmPassword2}    ${CPass}
   Scroll Page   DOWN
   Sleep   5
   Double Click Element    ${CreateAccount}
   Sleep   15
   Input Text   ${ProfeesionalAddress}   ${ProfAddressNonTaxable}
   Input Text   ${City}     ${CityNameNonTaxable}
   Sleep   10
   Select From List by Value     ${StateDD}     ${StateValueNonTaxable}
   Input Text   ${ZipCode}   ${ZipCodeNameNonTaxable}
   Input Text   ${PhoneNumber}     ${Phone}
   Select From List by Value    ${PractitionerType}      ${PractitionerTypeValue}
   Scroll Page   DOWN
   Sleep   10
   Double Click Element   ${SubmitButton}
   Sleep   12
   Practitioner Registration Completion Message
   Double Click Element   ${VisitMyDashBoard}
   Sleep  20
   ClosePopUpAtHomePage
   Sleep   5
   NavigateToAccountSettingPage

Dashboard Shop Displansary
    Double Click Element    ${DashabordShopDisplansary}

Add Multiple Items In Cart by Shop Displansary
    [Arguments]
    @{Items}=     Get WebElements    ${ProductsList}
    : For   ${Item}  IN RANGE    0       5
    \   log  ${Items[${Item}]}
    \   Sleep   5
    \   Double Click Element     ${Items[${Item}]}
    \   Sleep   10
    \   ${status}    ${value}=    Run Keyword And Ignore Error    Page Should Contain Element    ${OutOFStockproductLocator}
    \   Run Keyword If    '${status}'=='PASS'    Double Click Element      //button[@class='btn btn-primary']


Checkout vi Shop Displansary
    [Arguments]   ${Timeout}
    Sleep   12
    Dashboard Shop Displansary
    Sleep   12
    Add Multiple Items In Cart by Shop Displansary
    Sleep   10
    Log To Console    ${CardHolder}   ${CardNo}   ${CVV}
    Double Click Element   ${CartIcon}
    Sleep   10
    Double Click Element   ${CheckoutButton}
    #Wait Until Element Is Enabled     ${ContinueButton}       ${Timeout}
    Sleep   20
    Double Click Element      ${SameAddressRadioButton}
    Sleep   5
    Double Click Element    ${ContinueButton}
    Sleep  3
    Address Suggestion
    Sleep  3
    Wait Until Element Is Visible     ${NextDayAir}       ${Timeout}
    Double Click Element   ${NextDayAir}
    Wait Until Element Is Visible     ${ShippingMethodNextStepButton}      ${Timeout}
    Double Click Element   ${ShippingMethodNextStepButton}
    Sleep  5
    Payment Mode Selection
    Sleep  5
    Wait Until Element Is Visible    ${CardNextButton}      ${Timeout}
    Double Click Element   ${CardNextButton}
    Sleep  5
    Wait Until Element Is Visible    ${PlaceOrder}      ${Timeout}
    Sleep  5
    Scroll to element      ${PlaceOrder}
    Double Click Element    ${PlaceOrder}
    Sleep   10
    ${PO_NO}    Get Text   ${OrderNo}
    Order Status Assertion
    Log To Console    ${PO_NO}
    Sleep  5
    Close Browser Session







