@isTest
private class testaccOppCntCasInsertPageClass 
  {
     static testmethod void testaccOppCntCasInsertPageClass ()
     
        {
            accOppCntCasInsertPageClass acop = new accOppCntCasInsertPageClass ();                                 
            acop.objA.Name = 'TestAccount';                                  
            Contact objC = new Contact ();
            Opportunity objO = new Opportunity();
            Case objCa = new Case();     
            acop.objC.accountid = acop.objA.id;           
            acop.objO.accountid = acop.objA.id;                       
            acop.objCa.accountid = acop.objA.id;                
            acop.objC.LastName = 'Garugu';
            acop.objC.Email = 'TestMail@mail.com';
            acop.objO.StageName = 'Closed Won';
            acop.objO.CloseDate =  DATE.VALUEOF('2005-11-15');        
            acop.objO.Name = 'Test Name';
            acop.objCa.Status = 'Closed';
            acop.objCa.Origin = 'Email';                     
            acop.doSave();            
             
        }
  }