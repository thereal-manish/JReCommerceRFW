*** Settings ***
Library    SeleniumLibrary
Resource    ../../Resources/commons/commons.resource
Resource    ../../Resources/DemoAdmin/001_Setup.resource
Test Setup    test setup for admin
Test Teardown    teardown for admin

*** Test Cases ***
verify all products are present
    001_Setup.verify products are present
    
verify all categories are present
    001_Setup.verify categories
    
experimental
    001_Setup.verify products across all page
