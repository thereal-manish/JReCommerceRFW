# from robot.api.deco import library,keyword
from robot.libraries.BuiltIn import BuiltIn
from test.test_optparse import DurationOption
from _ast import Try

# from SeleniumLibrary import SeleniumLibrary


# @library
class addItems:
    ROBOT_LIBRARY_SCOPE='TEST CASE'
    
    @property
    def selLib(self):
        return BuiltIn().get_library_instance("SeleniumLibrary")
    

    
    # @keyword
    def add_items_into_cart(self, productsList):
        i = 1
        productTitles=self.selLib.get_webelements("css:.protitle")
        for productTitle in productTitles:
            if productTitle.text in productsList:
                self.selLib.click_element("xpath=(//span[contains(text(),'add to cart')])["+ str(i) +"]")
                # self.selLib.wait_until_page_contains("success!!")
                # self.selLib.page_should_contain("success!!")
                try:
                    self.selLib.click_element("css:.close")
                except:
                    print('Already clicked')
                
            i = i + 1
         
class compareItems:
    ROBOT_LIBRARY_SCOPE='TEST CASE'
    
    @property
    def selLib(self):
        return BuiltIn().get_library_instance("SeleniumLibrary")
    
    def compare_items_in_admin_panel(self,productsFromAdminPanel):
        j = 0
        for title in productsFromAdminPanel:
            self.selLib.scroll_element_into_view("//td[normalize-space()='"+productsFromAdminPanel[j]+"']")
            self.selLib.page_should_contain_element("//td[normalize-space()='"+productsFromAdminPanel[j]+"']")
            j = j + 1
            
class compareItemsText:
    ROBOT_LIBRARY_SCOPE='TEST CASE'
    
    @property
    def selLib(self):
        return BuiltIn().get_library_instance("SeleniumLibrary")
    
    def compare_items_in_admin_panel_text(self,productsFromAdminPanel):
        j = 0
        for title in productsFromAdminPanel:
            self.selLib.page_should_contain(""+productsFromAdminPanel[j]+"")
            j = j + 1