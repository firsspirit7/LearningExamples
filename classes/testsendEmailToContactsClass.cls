@isTest
private class testsendEmailToContactsClass
  {
     static testmethod void testsendEmailToContactsClass()
     
        {            
            Contact c = new Contact();
            c.LastName = 'Test';
            c.Email = 'Test1@testmail.com';
            insert c;
            sendEmailToContactsClass.wrapercon w = new sendEmailToContactsClass.wrapercon();
            w.isselected = true;                           
            w.email = 'test2@testmail.com';
            sendEmailToContactsClass sObj = new sendEmailToContactsClass ();           
            sObj.sendemail();                 
        }
  }