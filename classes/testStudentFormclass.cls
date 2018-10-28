@isTest
private class testStudentFormclass
  {
    static testmethod void testStudentFormclass()
      { 
          StudentFormclass sfc = new StudentFormclass(); 
          sfc.doSave(); 
          sfc.getItems();         
          sfc.change();            
          sfc.change();
          sfc.getren();        
          sfc.doCancel();
      }
  }