@isTest
private class testDynamicObjectsInsertMode 
  {
     static testmethod void testDynamicObjectsInsertMode ()
     
        {
            DynamicObjectsInsertMode  dObjI = new DynamicObjectsInsertMode ();
            dObjI.objName = 'Account';
            dObjI .go();  
               
        }
  }