*** Settings ***
Resource     Selenium2Library

*** Variables ***

${userName}                            id= email
${Password}                            id=password
${LoginButton}                         id= login-dialog
${LoginButtonAtPopUp}                  xpath=//button[@class='btn btn-primary btn-w-lg input-form ng-binding']
${PractitionerRegistrationBuble}       xpath=//a[@ui-sref='practitioner-registration']
${FirstName}                           name=firstname
${LastName}                            name=lastname
${Email}                               name=email
${CreateAccount}                       xpath=//button[@type='submit']
${ProfeesionalAddress}                 name=professional_address
${City}                                name=city
${StateDD}                             xpath=//select[@name='state']
${State}                               xpath=//select[@name='state']/option[@value='AL']
${ZipCode}                             name=postcode
${PhoneNumber}                         name=phone_number
${PractitionerType}                    xpath=//select[@name='profession']
${UpdatedCertification}                xpath=//span[@ng-multiple='multiple']
${SubmitButton}                        xpath=//button[@type='submit']
${VisitMyDashBoard}                    xpath=//a[@ui-sref='practitioner-page.dashboard']
${Dispensary}                          xpath=//menuitem[@ui-sref='practitioner-page.settings.dispensary']
${SalesTax}                            xpath=//menuitem[@ui-sref='practitioner-page.settings.sales-tax']
${SameAddressRadioButton}              xpath=//form[@id='co-billing-form']/div/ul/li[3]/div[1]/label
${ShopAllProducts}                     xpath=//md-radio-button[@value='FULL']
${ShopMyCustomizedDispensary}          xpath=//md-radio-button[@value='CUSTOM']
${RecommendationOnly}                  xpath=//md-radio-button[@value='NO_DISP']
${InviteOnly}                          xpath=//md-radio-button[@aria-label='Invite Only']
${OpenAcess}                           xpath=//md-radio-button[@aria-label='Open Access']
${DispensarySubmitButton}              xpath=//button[@ng-click='vm.saveChanges()']
${closePopUp}                          xpath=//button[@ng-click='cancel()']
${SalesTaxButton}                      xpath=//section[@id='main-container']/div/section/section/aside/menu/menuitem[6]
${AgreeToWellevate}                    xpath=//label[@for='has_agreed_terms']
${OptOut}                              xpath=//section/div[@class='inline-block']
${OptIn}                               xpath=//section/div[@class='inline-block pr2']
${ResaleCertification}                 xpath=//input[@name='exemption_number']
${SaveChangesButton}                   xpath=//button[@ng-click='vm.submit()']
#${OptInSalesTx}                       xpath=//label[@for='opt-in-checkbox']
${OptInSalesTx}                        xpath=//label[@for='radioOptIn']
${AddAnotherState}                     xpath=//a[@class='btn btn-primary btn-outline']
${TwoDayAir}                           xpath=//label[@for='s_method_dispensary_shipping_2da']
${StandardBusinessDay}                 xpath=//label[@for='s_method_freeshipping_freeshipping']
${UseExistingCard}                     xpath=//ul[@id='saved-cards']/li[1]/label
${UseNewCard}                          xpath=//ul[@id='saved-cards']/li[2]/label
${OrderNo}                             xpath=//div[@id='mainViewOverflow']/div/div[3]/div/div/div/div[2]/p[2]/strong
${Logout}                              xpath=//nav[@id='navbar-wsnyc']/ul[2]/li[4]/ul/li[3]/a
${AgreeToWellevate1}                   xpath=//label[@for='has_agreed_terms']
${SalesTaxForAdditionalStates}         xpath=//section/div[@class='mt2']
${Suggestion}                          xpath=//ul[@class='suggestions']/li
${AddressSuggestionContinueButton}     xpath=//a[@class='btn btn-primary step-continue']
${OrderStatus}                         xpath=//div[@class='page-title']/h1
${ADditionalState}                     xpath=//select[@name='state']
${PractitionerRegistration}            xpath=//h1[@class='text-center']






${Password1}                            xpath=//input[@placeholder='PASSWORD']
${confirmPassword2}                     xpath=//input[@placeholder='CONFIRM PASSWORD']
${AccountImageLogo}                     xpath=//div[@class='circular']
${AccountSettings}                      xpath=(//nav[@id='navbar-wsnyc']//a[@ui-sref='practitioner-page.settings.profile'])[1]
${DispensaryType}                       xpath=//section[@id='main-container']/div/section/section/aside/menu/menuitem[5]
${DispensaryURL}                        xpath=//a[@class='h4 ng-binding']
${RegisterButton}                       xpath=//span[contains(text(),'Register')]
${PatientFirstName}                     name=firstname
${PatientLastName}                      name=lastname
${PatientEmai}                          name=email
${PatientPassword1}                     xpath=//input[@name='password']
${PatientConfirmPassword2}              xpath=//input[@name='passwordConfirm']
${PatientCreateAccount}                 xpath=//button[@type='submit']
${PatientAdress1}                       xpath=//input[@name='address1']
${PatientAddress2}                      xpath=//input[@name='address2']
${PatientCity}                          name=city
${PatientState}                         xpath=//md-select[@name='region']
${PatientStateOption}                   xpath=//md-option[@id='select_option_16']
${ZipCode}                              name=postcode
${CompleteButton}                       xpath=//button[@type='submit']
${Payment_M}                            xpath=//ul[@id='payment_form_cryozonic_stripe']/li[1]/ul/li


${SearchIcon}                           xpath=//nav[@id='navbar-wsnyc']/ul[2]/li[3]/a/i
${SearchIcon1}                          xpath=(//i[@class="fa fa-search fa-2x color-white"])[1]
${ProductSearchPlace}                   xpath=//section[@id='desktop-search']/form/input
${ClickOnProductFirst}                  xpath=(//span[@ng-if='!match.model.header'])[1]
${AddToCartButton}                      xpath=//a[@ng-click='vm.addToCart(vm.quantity)']
${CartIcon}                             xpath=//a[@ng-click='vm.toggleCartMenu($event)']
${CheckoutButton}                       xpath=//div[@class='row product text-center']/a[2]
${ContinueButton}                       xpath=//button[@ng-click='trackCheckoutBilling()']/span
${NextDayAir}                           xpath=//label[@for='s_method_dispensary_shipping_nda']
${ShippingMethodNextStepButton}         xpath=//div[@id='shipping-method-buttons-container']/button
${CardHolderName}                       xpath=//input[@id='cryozonic_stripe_cc_owner']
${CreditCardNumber}                     xpath=//input[@id='cryozonic_stripe_cc_number']
${CVVNo}                                xpath=//input[@id='cryozonic_stripe_cc_cid']
${ExpMonthDropdown}                     xpath=//select[@id='cryozonic_stripe_expiration']
${ExpMonth}                             xpath=//select[@id='cryozonic_stripe_expiration']/option[3]
${ExpYearDropdown}                      xpath=//select[@id='cryozonic_stripe_expiration_yr']
${ExpYear}                              xpath=//select[@id='cryozonic_stripe_expiration_yr']/option[3]
${CardNextButton}                       xpath=//div[@id='payment-buttons-container']/button
${PlaceOrder}                           xpath=//div[@id='review-buttons-container']/button





###### Completeing mandatory information for new Practioner
${D_UserIcon}                             xpath = //div[@class='circular']/img
${D_accountSectionButton}                 xpath = //a[@data-qa-hook='user-menu-account-settings']
${D_prBusinessSettingTab}                 xpath = //menuitem[@ui-sref='practitioner-page.settings.business-settings']
${D_patientProfitType}                    xpath = //*[@aria-label='I want to make a profit']
${D_stripeButton}                         xpath = //a[@class='btn btn-primary btn-flat ng-binding']
${D_SaveChanges}                          xpath = //button[@ng-click='vm.saveChanges()']
${D_stripeAccount}                        xpath = //a[@id='skip-account-app']
${D_profitSlideBarDecrease}               xpath= //*[@class='irs-bar']
${D_profitSlideBarIncrease}               xpath= //span[@class='irs-slider single']


# Patient Login


${PatEmail}                         name=clientName
${PatPass}                          name=password


#####################          Checkout Shop Dispensary  ##########################

${OutOFStockproductLocator}               xpath = //*[@ng-bind-html='vm.bodyText']
${ProductsList}                           xpath = //i[@title='Add item to Cart']
${DashabordShopDisplansary}            xpath = //a[@ui-sref='patient.dispensary']

${PractitionerSearch}                  xpath = //i[@class='fa fa-search fa-2x color-white']
${PrductCode_xpath}                    xpath = //small[@class='product-info-sku ng-binding']