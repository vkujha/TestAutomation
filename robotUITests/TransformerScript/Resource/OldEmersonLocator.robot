*** Settings ***

Resource     Selenium2Library


*** Variables ***

${userName}                              id=cphMain_cphLC_Login1_UserName
${Password}                              id=cphMain_cphLC_Login1_Password
${LoginButtonAtPopUp}                    id= cphMain_cphLC_Login1_LoginButton
${WelcomePOPUP}                          xpath=//div[@class='ng-binding layout-align-center-center layout-column']/h1
${OldEmersonLogo}                        xpath=//a[@id='hypHome']/img


${userNameF}                              id=txtEmail
${PasswordF}                              id=txtPassword
${LoginButtonAtPopUpF}                    id=cmdLogin
${LoginFrame}                             xpath=//iframe[@id="ctrlLoginSSL_ifLogin"]



