*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Variables    commons.py

*** Variables ***
${firstname}      
${lastname}       
${email}                
${phone}            
${password}
    
${displayname}  
${description}  
${productname} 
${metatitle}   
${model}

*** Keywords ***
setup the browser
    ${options} =     Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()        sys, selenium.webdriver
    # Call Method    ${options}    add_argument    headless
    Call Method    ${options}    add_argument    --disable-blink-features\=AutomationControlled
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_experimental_option    useAutomationExtension    ${False}
    ${excludeSwitches}=    Create List    enable-automation
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${excludeSwitches}
    Call Method    ${options}    add_argument    --start-maximized
    # Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --profile-directory\=Default
    
    # Call Method    ${options}    add_argument    --disable-web-security

    Create Webdriver    Chrome    chrome_options=${options} 
    go to    ${url}
    # BuiltIn.No Operation
      
generate new data with faker library
    ${displayname}      FakerLibrary.Name Nonbinary
    ${firstname}        FakerLibrary.First Name
    ${lastname}         FakerLibrary.Last Name
    ${email}            FakerLibrary.Email    
    ${phone}            FakerLibrary.Phone Number
    ${password}         FakerLibrary.Password    
    ${description}      FakerLibrary.Text  
    ${productname}      FakerLibrary.Random Letters  
    ${metatitle}        FakerLibrary.Paragraph    
    ${model}            FakerLibrary.Random Digit Not Null      

    set global variable    ${description}
    Set Global Variable    ${displayname}    
    Set Global Variable    ${firstname}    
    Set Global Variable    ${lastname}    
    Set Global Variable    ${email}    
    Set Global Variable    ${phone}    
    Set Global Variable    ${password}    
    Set Global Variable    ${productname}    
    Set Global Variable    ${metatitle}   
    Set Global Variable    ${model}     
     
    
Go to customer login/signup page of demo application
    commons.Click Element    ${customerlogin}
    
Test Setup testcase for user
    setup the browser
    Go to customer login/signup page of demo application
    Select Window    NEW
    commons.Input Text    ${emaillocator}    ${email_manual}      
    commons.Input Text    ${passwordlocator}    ${password_manual}  
    commons.Click Element    ${loginbtn}
    Wait Until Page Contains Element    ${logoutelement}    

logout and close for user
    commons.Click Element    ${logoutlogo}
    commons.Click Element    ${logoutbtn}
    Delete All Cookies
    Close All Browsers

Go to vendor login/signup page
    commons.Click Element    ${vendorlogin}
    
Test setup for vendor
    setup the browser
    Go to vendor login/signup page
    select window    NEW
    commons.Input Text    ${emaillocator}     ${email_vendor_manual}
    commons.Input Text    ${passwordlocator}    ${password_vendor_manual}
    commons.Click Element    ${loginbtn}
    
test teardown for vendor
    commons.Click Element    ${vendorlogout}
    Set Selenium Implicit Wait    2s 
    Page Should Contain    ${vendorlogouttxt}    
    Close All Browsers  

Click Element
    [Arguments]    ${locator}
    Wait until element is visible    ${locator}
    Set Selenium Implicit Wait    5s
    Scroll Element Into View    ${locator}
    SeleniumLibrary.Click Element    ${locator}
    

Input Text
    [Arguments]    ${locator}    ${data}
    Wait until element is visible    ${locator}
    Scroll Element Into View    ${locator}
    SeleniumLibrary.Input Text    ${locator}    ${data}   