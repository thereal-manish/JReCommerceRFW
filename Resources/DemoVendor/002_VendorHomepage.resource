***Settings***
Library    SeleniumLibrary
Resource    ../commons/commons.resource
Variables    002_VendorHomepage.py
Library    Collections

***Keywords***
verify the other vendors are present
    commons.Click Element    ${allvendors}
    compare all the vendors
    SeleniumLibrary.Go Back
    
compare all the vendors
    @{vendors}=          Create List      Rajshree Jewellers      Steven Green      Tyler Sanders      Eileen Cole      Jennifer Olson      Craig Vasquez      Cristina Black      Hannah Garcia
    ${titlesfrompage}=    Get WebElements    ${vendorstitle}
    @{actualtitles}=    Create List    
    FOR    ${element}    IN    @{titlesfrompage}
        Log    ${element.text}    
        Append To List    ${actualtitles}    ${element.text}
    END
    
    # Lists Should Be Equal    ${actualtitles}    ${vendors}    
    
go to products
    Mouse Over    ${catalog}
    commons.Click Element    ${products}
    
add product
    go to products
    commons.Click Element    ${addproduct}
    commons.Input Text    ${productnamelocator}    ${productname}
    commons.Input Text    ${metatextloactor}    ${metatitle}
    commons.Click Element    ${datalocator}
    commons.Input Text    ${modellocator}    ${model}
    commons.Click Element    ${links}
    commons.Click Element    ${attribute}
    commons.Click Element    ${option}
    commons.Click Element    ${recurring}
    commons.Click Element    ${discount}
    commons.Click Element    ${special}
    commons.Click Element    ${image}
    commons.Click Element    ${reward}
    commons.Click Element    ${seo}
    commons.Click Element    ${design}
    Select From List By Label    ${designdropdown}    ${ddvalue}
    commons.Click Element    ${save}
    Set Selenium Implicit Wait    2s
    Element Should Be Visible    ${success}    
    
update product
    go to products
    commons.click element    ${edit}
    commons.Click Element    ${datalocator}
    # commons.Click Element    ${inputpricelocator}
    Clear Element Text    ${inputpricelocator}
    commons.Input Text    ${inputpricelocator}    ${inputprice}
    commons.Click Element    ${save}
    Element Should Be Visible    ${success}   
    
delete product 
    go to products
    commons.Click Element    ${checkbox}
    Checkbox Should Be Selected    ${checkbox}
    commons.Click Element    ${delete}
    Handle Alert    ACCEPT
    Page Should Contain Element    ${success}    