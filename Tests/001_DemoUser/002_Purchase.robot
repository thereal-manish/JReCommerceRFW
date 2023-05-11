*** Settings ***
Documentation       This class is to add a product to cart and checkout
Library             SeleniumLibrary
Resource            ../../Resources/commons/commons.resource
Resource            ../../Resources/DemoUser/002_Purchase.resource
Test Setup          Test Setup testcase for user
Test Teardown       logout and close for user

*** Test Cases ***
Add dress into cart
    002_Purchase.go to homepage
    002_Purchase.go to women's card
    002_Purchase.get card titles
    002_Purchase.add items to cart
    002_Purchase.verify the cart
    002_Purchase.proceed checkout
    002_Purchase.fill address
    
change mobile number
    002_Purchase.go to edit profile page
    002_Purchase.update mobile number