@isTest
private class testAccountEditCloneDeleteClass
  {
     static testmethod void testaccountEditCloneDeleteClass()
     
        {
            accountEditCloneDeleteClass aecdc = new accountEditCloneDeleteClass();
            aecdc.objS.name = 'test';           
            aecdc.doSave();
            aecdc.doDelete();
            aecdc.doCancel();
            aecdc.doClone(); 
            aecdc.doEdit();
            aecdc.doSaveNew();         
        }
  }