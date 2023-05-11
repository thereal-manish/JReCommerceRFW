*** Settings ***
Documentation    This module tests the demo vendor module
Resource    ../../Resources/commons/commons.resource
Resource    ../../Resources/DemoVendor/001_Setup.resource

*** Test Cases ***
Registration of vendor
    commons.setup the browser
    001_Setup.go to vendor login/signup page
    Select Window    NEW
    001_Setup.Select registration page
    commons.generate new data with faker library
    001_Setup.enter generated details in signup form
    001_Setup.verify the vendor is registered