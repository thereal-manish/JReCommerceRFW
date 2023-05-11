***Settings***
Resource    ../commons/commons.resource
Variables    001_Setup.py

*** Keywords ***
go to vendor login/signup page
    commons.Click Element    ${vendorpage}
    
Select registration page
    commons.Click Element    ${registration}
    
enter generated details in signup form
    commons.Input Text    ${displaynamelocator}    ${displayname}
    commons.Input Text    ${firstnamelocator}    ${firstname}
    commons.Input Text    ${lastnamelocator}    ${lastname}
    commons.Input Text    ${emaillocatorvendor}    ${email}
    commons.Input Text    ${phonelocator}        ${phone}
    commons.Input Text    ${address1locator}    ${address1}
    commons.Input Text    ${citylocator}        ${city}
    Select From List By Label    ${countrylocator}   ${country} 
    Select From List By Label    ${zonelocator}    ${zone}
    commons.Input Text    ${postcodelocator}    ${postcode}
    commons.Input Text    ${passwordlocatorvendor}        ${password}
    commons.Input Text    ${password2locatorvendor}    ${password}
    commons.Input Text    ${storenamelocator}    ${displayname}
    commons.Input Text    ${descriptionlocator}    ${description} 
    commons.Input Text    ${paypal}    ${email}
    commons.Click Element    ${terms}   
    commons.Click Element    ${submitbtn}
    
verify the vendor is registered
    Wait Until Page Contains    Congratulations! Your new Vendor has been successfully created!
    Page Should Contain    Congratulations! Your new Vendor has been successfully created!           