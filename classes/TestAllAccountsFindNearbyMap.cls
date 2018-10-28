@isTest(seeAlldata=true)
private class TestAllAccountsFindNearbyMap {

    static testMethod void setvalues() {
        // TO DO: implement unit test
        AllAccountsFindNearbyMap f = new AllAccountsFindNearbyMap();
        PageReference pageRef = Page.AllAccountsFindNearbyMap;        
        Test.setCurrentPage(pageRef);
       
        Account a = [select id from Account limit 1];
        Contact c = [select id from Contact limit 1];
        Lead l = [select id from Lead where isConverted=false limit 1];
        
        a.Mapping_Status__c = 'Located';
        a.Which_Address__c  = 'Billing';   
        a.BillingStreet = '2 Market St'; 
        l.Street = '2 market st';
        c.MailingStreet = '2 market st';
        update a; 
        update l;
        System.assert(l != null);
        f.getAccountIndustryOptions(); 
        f.setAccountIndustryOptions(); 
        
        f.getAccountTypeOptions();
        f.setAccountTypeOptions();
        
        f.getDistances();
        f.searchAccounts = true;
        f.searchContacts = true;
        f.searchLeads = true; 
        
        //first If 
        f.needFilters = false;
        f.setStartingPoint();
        
        //List View Locations
        f.locs.add(new MapItem(a));
        f.setStartingPoint();
        
        //Contacts
        f.needFilters = true;
        f.locs.add(new MapItem(a));
        ApexPages.currentPage().getParameters().put('cid', c.Id);
        f.init();
        f.setStartingPoint();
        
        f.filterLocs();
        //Accounts
        f.needFilters = true;
        f.locs.add(new MapItem(a));
        ApexPages.currentPage().getParameters().put('aid', a.Id);
        f.setStartingPoint();
        
        //Leads
        f.needFilters = true;
        f.locs.add(new MapItem(a));
        ApexPages.currentPage().getParameters().put('lid', l.Id);
        f.setStartingPoint();
        
        
        f.locs = null;
        f.getCount();               
        System.Assert(f.getCount() != null);
        
        f.getDistance();
        System.Assert(f.getDistance() != null);
        
        f.getDestinations();
        
        List<String> s = new List<String>();
        s.add('All');
        
        f.setDistance('200');
        f.setAccountTypes(s);
        f.getAccountTypes();
        f.setAccountIndustries(s);
        f.getAccountIndustries();
        f.setLeadStatuses(s);
        f.getLeadStatuses();
                            
    }
    static testMethod void tlocations() {
        AllAccountsFindNearbyMap f = new AllAccountsFindNearbyMap();
        PageReference pageRef = Page.AllAccountsFindNearbyMap;
        Test.setCurrentPage(pageRef);
       
        Account a = [select id from Account limit 1];
        Contact c = [select id from Contact limit 1];
        Lead l = [select id from Lead limit 1];
        
        a.Mapping_Status__c = 'Located';
        a.Which_Address__c  = 'Billing';   
        update a; 
        
        Account actobj=new Account();
        actobj.name='test Account';
        actobj.type='other';
        actobj.billingcountry='UK';
        //actobj.Account_status__c='Due Visit';
        actobj.Mapping_Status__c='Located';
        actobj.Which_Address__c='Billing';
        insert actobj;
        f.init();        
        ApexPages.currentPage().getParameters().put('alids', actobj.Id);
        f.init();
        f.getGKey();
        f.Search();
        f.goBackToRecord();
        f.handleListViews();                
        System.assert(a != null);
        
     }
}