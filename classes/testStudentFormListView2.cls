@isTest
private class testStudentFormListView2
  {
    static testmethod void testStudentFormListView2()
      {        
        StudentForm__c sObj = new StudentForm__c ();
        sobj.Name = 'Test Name';
        sObj.PhoneNumber__c = '0000000000'; 
        insert sObj;  
        StudentFormListView2.wrapper w = new StudentFormListView2.wrapper();
        List<StudentFormListView2.wrapper> wlist = new List<StudentFormListView2.wrapper>();
        StudentFormListView2 sflv = new StudentFormListView2();
        w.stu = sObj;
        w.rowIndex = 1;
        w.ren2=true;
        wlist.add(w); 
        sflv.doCancel();                 
        sflv.doEdit();
        sflv.doDelete();       
        sflv.doSave();      
        
      }
  }