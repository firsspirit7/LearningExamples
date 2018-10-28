@isTest
private class testdynamicObjectFieldsDisplayLinkClass2
  {
     static testmethod void testm1()
     
        {
            dynamicObjectFieldsDisplayLinkClass2 dObjFl = new dynamicObjectFieldsDisplayLinkClass2 (); 
            apexpages.currentpage().getparameters().put('myobj','Account');          
            dobjFl.getFields();                     
                                
        }
  }