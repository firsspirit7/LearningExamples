@isTest
private class tdynamicObjectFieldsDisplayPicklistClass
  {
     static testmethod void testdynamicObjectFieldsDisplayPicklistClass()
     
        {
            dynamicObjectFieldsDisplayPicklistClass dObj = new dynamicObjectFieldsDisplayPicklistClass();
            dObj.selectedObj = 'Account';
            dObj.selectedfld = 'Name';
            dObj.Fields();
            dObj.fldname();
        }
  }