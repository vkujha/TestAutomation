*** Settings ***
Documentation       Main, framework configuration file. Contains all include external libraries. Contains all framework configuration variables
###### External Libraries #######
Library             Selenium2Library
Library             String
Library             OperatingSystem
Library             Collections
Library             HttpLibrary.HTTP

###### Additional Variables Sources ######
Resource            http_codes.robot
Resource            locators.robot


*** Variables ***
###### Framework Configuration Variables ######
${test_env}                     QA
${browser}                      CHROME
${browser_window_width}         1920
${browser_window_height}        1080
${implicit_wait_sec}            5
${explicit_wait_sec}            10
${explicit_wait_5_sec}          5

###### Portal Variables ######
# URLs:

${well_portal_auth}         emerson:2016EmersonHTTP!%40%23
${well_portal_url}          https://${test_env}.emersonecologics.com/


