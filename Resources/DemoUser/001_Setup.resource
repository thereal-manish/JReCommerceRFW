*** Settings ***
Library    SeleniumLibrary
Variables    001_Setup.py
Resource    ../commons/commons.resource

*** Keywords ***   
select registration page
    commons.Click Element    ${registration}
    
enter generated details in signup form
    Radio Button Should Be Set To    customer_group_id    1
    commons.Input Text    ${firstnamelocator}    ${firstname}
    commons.Input Text    ${lastnamelocator}    ${lastname}
    commons.Input Text    ${emaillocator}    ${email}
    commons.Input Text    ${phonelocator}    ${phone}
    commons.Input Text    ${passwordlocator}    ${password}
    commons.Input Text    ${password2locator}    ${password}
    Radio Button Should Be Set To    newsletter    0
    commons.Input Text    //input[@id='input-captcha']    8b90bb
    commons.Click Element    ${terms}
    commons.Click Element    ${continuebtn}
    Wait Until Page Contains Element    ${logoutelement}   
    # Page Should Contain    Congratulations! Your new account has been successfully created!
    
teardown
    logout and close for user
    
verify alert
    commons.Input Text    ${emaillocator}    ${email}
    commons.Input Text    ${passwordlocator}    ${passwordInvalid}
    commons.Click Element    ${custloginbtn}
    Page Should Contain Element    ${danger} 
    