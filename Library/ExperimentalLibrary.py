from robot.libraries.BuiltIn import BuiltIn
from test.test_optparse import DurationOption
from logging import exception

class iteratePage:
    ROBOT_LIBRARY_SCOPE='TEST CASE'
    
    @property
    def selLib(self):
        return BuiltIn().get_library_instance("SeleniumLibrary")
    
    # @keyword
    # def iterate_through_values(self,productsFromAdminPanel,value):
    #     i = 0
    #     for text in productsFromAdminPanel:
    #         try:
    #             productFromPage = self.selLib.get_text("//td[normalize-space()='"+ productsFromAdminPanel[i] +"']")
    #         except:
    #             print(exception)
    #
    #         if text == productFromPage:
    #             self.selLib.click_element("//input[@value='"+value[i]+"']")
    #         else:
    #             self.selLib.click_element("//a[normalize-space()='>']")
    #         i = i + 1
            
    def iterate_through_values(self,productsFromAdminPanel,value):
        i = 0
        for text in productsFromAdminPanel:
            try:
                productFromPage = self.selLib.get_text("//td[normalize-space()='"+ productsFromAdminPanel[i] +"']")
                if text == productFromPage:
                    self.selLib.click_element("//input[@value='"+value[i]+"']")
                
            except:
                self.selLib.click_element("//a[normalize-space()='>']")
                productFromPage = self.selLib.get_text("//td[normalize-space()='"+ productsFromAdminPanel[i] +"']")
                if text == productFromPage:
                    self.selLib.click_element("//input[@value='"+value[i]+"']")
            
            i = i + 1