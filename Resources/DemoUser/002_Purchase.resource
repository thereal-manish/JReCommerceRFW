***Settings***
Variables    002_Purchase.py
Resource    ../../Resources/commons/commons.resource
Library    Collections
Library    SeleniumLibrary
Library    custompyLibrary.addItems
variables    002_Purchase.py
             
*** Variables ***
@{items_to_add}

*** Keywords ***
go to homepage
    commons.Click Element    ${homepageelement}
    
go to women's card
    commons.Click Element    ${womenscard}
    
get card titles
    # @{expected_cards}=    Create List    
    ${titles_from_page}=    Get WebElements    ${cardtitle}
    @{actual_list}=    Create List    
    
    FOR    ${element}    IN    @{titles_from_page}
        Log    ${element.text}    
        Append To List    ${actual_list}    ${element.text}
    END
    
       
    
add items to cart
    @{items_to_add}=    Create List    The Twisted Heart Pendant
    # ...    The Lyra Pendant
    Set Global Variable    ${items_to_add}    
    Add Items Into Cart    ${items_to_add}
    Wait Until Element Is Not Visible    ${popup}        
    
verify the cart
    commons.Click Element    ${carticon}
    commons.Click Element    ${viewcart}
    # compare items in cart
    
compare items in cart
    ${titles_from_checkout}=    Get WebElements    ${items_in_cart}
    @{items_from_checkout_page}=    Create List    
    
    FOR    ${elements}    IN    @{titles_from_checkout}
        Append To List    ${items_from_checkout_page}    ${elements.text}
    END
    
    Lists Should Be Equal    ${items_from_checkout_page}    ${items_to_add}    
  

proceed checkout
    commons.Click Element    ${checkoutbtn}  
    
fill address
    Select Radio Button    ${address_group}    ${address_value}
    Radio Button Should Be Set To    ${address_group}    ${address_value}
    commons.Input Text    ${firstnamelocator}        ${firstname}
    commons.Input Text    ${lastnamelocator}        ${lastname}
    commons.Input Text    ${address1locator}        ${address1}
    commons.Input Text    ${address2locator}    ${address2}
    commons.Input Text    ${citylocator}    ${city}
    commons.Input Text    ${pincodelocator}    ${pincode}
    Select From List By Label    ${countrylocator}    ${countrydata}    
    Select From List By Label    ${regionlocator}   ${regiondata}
    commons.Click Element    ${paymentaddressbtn}
    commons.Click Element    ${shippingaddresbtn}
    commons.Click Element    ${shippingmethodbtn}
    commons.Click Element    ${terms}
    commons.Click Element    ${cod}
    commons.Click Element    ${paymentmethodbtn}
    commons.Click Element    ${confirmorderbtn}
    # commons.Click Element    ${cardbtn}
    Page Should Contain    ${successtext}    
    
go to edit profile page
    commons.Click Element    ${editprofile}
    Page Should Contain    ${editprofiletext}
    
update mobile number
    commons.Input Text    ${phoneupdatelocator}    ${newphonevalue}
    commons.Click Element    ${continuebtn}
    # Wait Until Element Is Visible    ${successalertupdate}  
    # Page Should Contain Element    ${successalertupdate}         