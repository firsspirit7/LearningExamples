@isTest
private class testInsertDynamicSobjectController
  {
     static testmethod void testInsertDynamicSobjectController()
     
        {
            InsertDynamicSobjectController Iobj = new InsertDynamicSobjectController();
            Iobj.ObjectName = 'Account';
            Iobj.RecordName = 'Test Name';
            Iobj.Save();                   
        }
    static testmethod void testInsertDynamicSobjectController2()
     
        {
            InsertDynamicSobjectController Iobj = new InsertDynamicSobjectController();
            Iobj.ObjectName = '';
            Iobj.RecordName = '';
            Iobj.Save();                   
        }
    
  }