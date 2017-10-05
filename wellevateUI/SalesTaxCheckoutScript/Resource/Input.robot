*** Settings ***

Resource     Selenium2Library
Library      ExcelLibrary



*** Variables ***

${Timeout}               60
#${UName}                Test12345@gmail.com
#${PWord}                Demo@123

${UName}                 Test12345@gmail.com
${PWord}                 Demo@123

${Browser}               CHROME

${WellevateURL}           https://emerson:2016EmersonHTTP!%40%23@stage.wellevate.me/#/
#${WellevateURL}          http://emerson:2016EmersonHTTP!%40%23@well-qa2.wsnycdev.com/#/
#${WellevateURL}          http://emerson:2016EmersonHTTP!%40%23@well-qa.wsnycdev.com/#/

${FileName}            C:\\Users\\vivek.jha\\.p2\\PycharmWorkSpace\\Wellevate\\TestData\\RoboExcel.xlsx
${FileLocation}        D:\\Images\\mini.jpeg
${FName}               RobotOne
${LName}               RoboTwo
${Pass}                Pass@123
${CPass}               Pass@123
${ProfAddress}         335 Iowa Street
${CityName}            redlands
${StateName}           CA
${ZipCodeName}         92373
${Phone}               9988776655
${PracType}            Other
${EmailExt}            @yap.com
${PatFName}            Patient01
${PatLName}            Well
${PatPass}             Pass@123
${PatCPass}            Pass@123
${PatAdd1}             335 Iowa Street
${PatAdd2}             335 Iowa Street
${PatCITY}             redlands
${PatSTATE}            CA
${PATZIPCODE}          92373
${DisPURL1}            https://emerson:2016EmersonHTTP!%40%23@well-qa.wsnycdev.com/wellevate-tax3#/patient/registration/1/c0fcebe632c9737f102aca5e6d2704
${PatientUrl}          https://emerson:2016EmersonHTTP!%40%23@stage.wellevate.me/prac2007-well#/patient/home
${CardHolder}          Mr Xman
${CardNo}              4111111111111111
${CVV}                 111

${StateValue}                           CA
${PractitionerTypeValue}                MD
${PractitionerDashboard}                https://stage.wellevate.me/#/practitioner/dashboard
${CertificationNo}                      123456
${AdditionalStateInput}                 NH
${PractitionerRegistrationMessage}      Welcome to wellevate℠
${Month}                                1
${Year}                                 2019
${PatientUserName}                      1_pat2007@yap.com
${PatientPassword}                      Test@123
${Item1}                 B20004
${Item2}                 B20004
${Item3}                 B20004
${Item4}                 B20004
${orderMsg}                   Your order has been received.
${ProfAddressNonTaxable}      800 W Ahwanee Ave
${CityNameNonTaxable}         Anchorage
${StateValueNonTaxable}       AK
${ZipCodeNameNonTaxable}      99811
${ProfAddressTaxable}         3033 Joyce Street
${CityNameTaxable}            Gulf Shores
${StateValueTaxable}          AL
${ZipCodeNameTaxable}         36542

${OrderNumber}                123456


${SheetName}            Registration

#${SheetName}           Registration
#${ExcelLocation}        C:\\Users\\jyoti.tiwari\\PycharmProjects\\Robot-Script\\Wellevate\\Resource\\EmersonEcologics.xls
#${ExcelLocation}        C:\\Users\\jyoti\\PycharmProjects\\Robot-Script\\Wellevate\\Resource\\EmersonEcologics.xls

${PO_NO}


#${ExcelLocation1}       C:\\Users\\jyoti.tiwari\\PycharmProjects\\Robot-Script\\Wellevate\\Resource\\WellweteTextCases.xls

${ExcelLocation1}         SalesTaxCheckoutScript\\TestData\\WellweteTextCases.xls
#${ExcelLocation1}        SalesTaxCheckoutScript\\Resource\\WellweteTextCases.xls
#${ExcelLocation1}        Wellevate_9.23\\Resource\\WellweteTextCases.xls
${PracReg_Sheet}         PractitionerRegistration
${PatientReg_ExistPrac}  PatientReg_ExistPractOpenAccess
${SheetName_1}           PatientRegistration
${SheetName_2}           PractitionerAndPatientWithOrder
${SheetName_3}           PractionerLoginCredentials
${AppendOrderNo_Sheet}           OrderIDFetch
#${RowNumber}          2
${ColumnNumber}        9
${Actual_ProductCode}
${AtualCode}
