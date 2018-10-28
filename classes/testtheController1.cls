@isTest
private class testtheController1 
  {
     static testmethod void testtheController1 ()
     
        {
            theController1  tObj = new theController1 ();
            tObj.searchText = 'Test Name';
            tobj.getAccounts();
            tobj.getContacts();
            tobj.getOpportunities();
            tobj.getResults();
            tObj.doSearch();
                   
        }
    static testmethod void testtheController2 ()
     
        {
            theController1  tObj = new theController1 ();
            tObj.searchText = '';
            tobj.getAccounts();
            tobj.getContacts();
            tobj.getOpportunities();
            tobj.getResults();
            tObj.doSearch();
                   
        }
  }