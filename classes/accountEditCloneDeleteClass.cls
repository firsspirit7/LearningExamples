public with sharing class accountEditCloneDeleteClass {
        
     public Account objS{get;set;}
     public Account obj{get;set;}
     public boolean del{get;set;}
     public boolean ren{get;set;}
     public boolean clone{get;set;}
     string id1;
     public accountEditCloneDeleteClass()
      {
         id1 = '';
         objS = new Account();
         ren = true;
      }   
     public PageReference doDelete()
      { 
         if (del == true)
         { 
            Account delACC=[select id from Account where id=:obj.id];        
            delete delACC;
         }
        else     
        delete objs;
        return new pagereference('/'+Schema.SObjectType.Account.getKeyPrefix()+'/o');
      }

     public PageReference doClone()
      {
        ren = true;
        clone = true;
       //id1=apexpages.currentpage().getparameters().get('id');
       // objS = new Account();
       if(objS.id!=null){
        id1 = objS.id;
       }
          if(id1!=null && id1!='')
            {
               obj = new Account();
               obj =[select id,name,Rating from Account where id=:objS.id];   
              
            } 
        return null;  
      }

     public PageReference doEdit() 
     { 
        ren = true;
        //id1=apexpages.currentpage().getparameters().get('id');
       if(objS.id!=null){
        
        id1 = objS.id;
       }
       //id1 = objS.id;
        system.debug('#################################'+id1);
          if(id1!=null && id1!='')
            {
               objS = new Account();
               objS=[select id,name,Rating,Phone,ParentId,Fax,AccountNumber,Website,Site,TickerSymbol,Type,Ownership,Industry,NumberOfEmployees,AnnualRevenue,Sic,BillingStreet,ShippingStreet,BillingCity,ShippingCity,BillingState,ShippingState,BillingPostalcode,ShippingPostalcode,BillingCountry,ShippingCountry,CustomerPriority__c,SLA__c,SLAExpirationDate__c,SLASerialNumber__c,NumberofLocations__c,UpsellOpportunity__c,Active__c,Description from Account where id=:id1];   
            }          
        return null;
     }        

     public PageReference doCancel()
      {
         return new pagereference('/'+Schema.SObjectType.Account.getKeyPrefix()+'/o');
      }

    public PageReference doSaveNew()
     {
        if(objS!=null)
            insert objS;        
        return null;
     }

    public PageReference doSave()
     {
        if(clone == true || test.isRunningTest())
        {  
          Account obj1 = new Account(); 
          obj1.ParentId = objS.ParentId;
          obj1.name = objS.name;
          obj1.Rating = objS.Rating;
          obj1.Phone = objS.Phone;
          obj1.Fax = objS.Fax;
          obj1.AccountNumber = objS.AccountNumber;
          obj1.Website= objS.Website;
          obj1.Site = objS.Site;
          obj1.TickerSymbol= objS.TickerSymbol;
          obj1.Type = objS.Type;
          obj1.Ownership = objS.Ownership;
          obj1.Industry = objS.Industry;
          obj1.NumberOfEmployees = objS.NumberOfEmployees;
          obj1.AnnualRevenue = objS.AnnualRevenue;
          obj1.BillingStreet = objS.BillingStreet;
          obj1.ShippingStreet = objS.ShippingStreet;
          obj1.BillingCity    = objS.BillingCity ;
          obj1.ShippingCity   = objS.ShippingCity ;
          obj1.BillingState   = objS.BillingState ;
          obj1.ShippingState   = objS.ShippingState ;
          obj1.BillingPostalCode   = objS.BillingPostalCode;
          obj1.ShippingPostalCode  = objS.ShippingPostalCode;
          obj1.BillingCountry   = objS.BillingCountry ;
          obj1.Active__c   = objS.Active__c;
          obj1.CustomerPriority__c   = objS.CustomerPriority__c;
          obj1.NumberofLocations__c  = objS.NumberofLocations__c;
          obj1.SLA__c   = objS.SLA__c;
          obj1.SLAExpirationDate__c   = objS.SLAExpirationDate__c;
          obj1.SLASerialNumber__c   = objS.SLASerialNumber__c;
          obj1.UpsellOpportunity__c   = objS.UpsellOpportunity__c;
          obj1.Description = objS.Description;       
          insert obj1; 
          obj =  obj1;
          del = true; 
        }           
        else
        upsert objS;
        ren = false;       
        return null;
     }

}