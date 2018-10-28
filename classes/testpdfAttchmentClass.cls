@isTest
private class testpdfAttchmentClass 
  {
     static testmethod void testpdfAttchmentClass ()
     
        {
            pdfAttchmentClass  pObj = new pdfAttchmentClass();
            pObj.Key = 'Test@Testmail.com';
            pObj.sendpdf();  
            pObj.getGetcontacts();      
        }
  }