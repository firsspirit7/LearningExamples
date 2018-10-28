@isTest(seeAlldata=true)
private class TestFindNearbyMap {

    static testMethod void tGetSets() {
        FindNearbyMap f = new FindNearbyMap();
        PageReference pageRef = Page.FindNearbyMap;        
        Test.setCurrentPage(pageRef);
       
        Account a = [select id from Account limit 1];
        Contact c = [select id from Contact limit 1];
        Lead l = [select id from Lead where isConverted=false limit 1];
         Account actobj=new Account();
        actobj.name='test Account';
        actobj.type='other';
        actobj.billingcountry='UK';
        //actobj.Account_status__c='Due Visit';
        actobj.Mapping_Status__c='Located';
        actobj.Which_Address__c='Billing';
        actobj.Lon__c=81;
        actobj.Lat__c=16;
        insert actobj;
        actobj.Which_Address__c='Billing'; 
        actobj.Mapping_Status__c='Located';
        update actobj;      
        Contact contobj=new Contact();
        contobj.lastname='balaji';
        contobj.lon__c=81;
        contobj.Lat__c=16;
        contobj.Mapping_Status__c='Located';
        insert contobj;
        Lead leadobj=new Lead();
        leadobj.lastname='baji';
        leadobj.company='Test Company';
        leadobj.status='Open-Not Contacted';
        leadobj.Lon__c=81;
        leadobj.Postcode__c='nw1 8by';
        leadobj.Address_Line_1__c='31 hawley street';
        leadobj.Town__c='london';
        leadobj.Lat__c=16;
        insert leadobj;
        update actobj;
        update leadobj;
        a.Mapping_Status__c = 'Located';
        a.Which_Address__c  = 'Billing';   
        a.BillingStreet = '2 Market St'; 
        l.Street = '2 market st';
        c.MailingStreet = '2 market st';
        update a; 
        update l;
        System.assert(leadobj != null);
        f.getAccountIndustryOptions(); 
        f.setAccountIndustryOptions(); 
        
        f.getAccountTypeOptions();
        f.setAccountTypeOptions();
        
        f.getDistances();
        f.getLeadStatusOptions();



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
        ApexPages.currentPage().getParameters().put('cid', contobj.Id);
        f.init();
        f.setStartingPoint();
        
        f.filterLocs();
        //Accounts
        f.needFilters = true;
        f.locs.add(new MapItem(a));
        ApexPages.currentPage().getParameters().put('aid', actobj.Id);
        f.setStartingPoint();
        
        //Leads
        f.needFilters = true;
        f.locs.add(new MapItem(a));
        ApexPages.currentPage().getParameters().put('lid', leadobj.Id);
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
        
        MapUtility.getSingleLeadToPlot(null);
        MapUtility.getSingleContactToPlot(null,false);
        MapUtility.getSingleAccountToPlot(null);
        MapUtility.getNearbyAccounts(new mapItem(contobj),12.0);
        MapUtility.getAccuracy();
        MapUtility.DetermineStatus('200','');
        MapUtility.getBoundingCondition(new mapItem(contobj),12.0);
                            
    }   
    
     static testMethod void tlocations() {
        FindNearbyMap f = new FindNearbyMap();
        PageReference pageRef = Page.FindNearbyMap;
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
        actobj.Lon__c=81;
        actobj.Lat__c=16;
        insert actobj;
        actobj.Which_Address__c='Billing'; 
        actobj.Mapping_Status__c='Located';
        update actobj;      
        Contact contobj=new Contact();
        contobj.lastname='balaji';
        contobj.lon__c=81;
        contobj.Lat__c=16;
        contobj.Mapping_Status__c='Located';
        insert contobj;
        Lead leadobj=new Lead();
        leadobj.lastname='baji';
        leadobj.company='Test Company';
        leadobj.status='Open-Not Contacted';
        leadobj.Lon__c=81;
        leadobj.Lat__c=16;
        leadobj.Postcode__c='nw1 8by';
        leadobj.Address_Line_1__c='31 hawley street';
        leadobj.Town__c='london';
        insert leadobj;
        f.init();
        
        ApexPages.currentPage().getParameters().put('llids',leadobj.Id);
        ApexPages.currentPage().getParameters().put('clids', contobj.Id);
        ApexPages.currentPage().getParameters().put('alids', actobj.Id);
        f.init();
        f.handleListViews();
        System.assert(a != null);
        
     }
    
}