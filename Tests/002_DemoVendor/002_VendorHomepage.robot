***Settings***
Resource    ../../Resources/commons/commons.resource
Resource    ../../Resources/DemoVendor/002_VendorHomepage.resource
Test Setup    Test setup for vendor
Test Teardown    test teardown for vendor

*** Test Cases ***
Verify all other vendors
    verify the other vendors are present
    
add products from vendor profile
    add product
    
update product after adding
    update product
    
delete product after updating
    delete product
    
