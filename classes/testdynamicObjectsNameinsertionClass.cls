@isTest
private class testdynamicObjectsNameinsertionClass
  {
     static testmethod void testdynamicObjectsNameinsertionClass()
     
        {            
            dynamicObjectsNameinsertionClass dObjN= new dynamicObjectsNameinsertionClass();    
            dobjN.selectedObj = 'Account';
            dobjN.name = 'Test Name';            
            dObjN.doSave();       
        }
  }