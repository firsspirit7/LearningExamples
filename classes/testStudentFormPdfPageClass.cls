@isTest
private class testStudentFormPdfPageClass
  {  
     static testmethod void teststudentFormPdfPageClass()
   {            
        StudentForm__c objS = new StudentForm__c();
        objS.Name = 'test student';
        objS.MaritalStatus__c = 'None';
        insert objS; 
                      
        apexpages.currentpage().getparameters().put('id',objS.id);            
        studentFormPdfPageClass sfc = new studentFormPdfPageClass();   
        sfc.change();
        sfc.getRen();           
   }
       
        static testmethod void teststudentFormPdfPageClass1()
       {            
            StudentForm__c objS = new StudentForm__c();
            objS.Name = 'test student';
            objS.MaritalStatus__c = 'Married';
            insert objS; 
            
                                  
            apexpages.currentpage().getparameters().put('id',objS.id);            
            studentFormPdfPageClass sfc = new studentFormPdfPageClass();   
            sfc.change();
            sfc.getRen();           
       }
  }