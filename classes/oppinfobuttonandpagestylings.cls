/*
Author:Deepthi.Settipalli

*/





public with sharing class oppinfobuttonandpagestylings {

    public PageReference edit() {
        rendering=true;
        return null;
    }
    public pagereference save(){
        update opp;
         rendering=false;
        return null;
    }
     public pagereference saveacc(){
        system.debug('acc--->'+acc);
        update acc;
        rendering=false;
        return null;
    }
   public pagereference newopp(){
        pagereference pg=new pagereference('/006/e');
        return pg;
    }
    
    public boolean displayPopup {get; set;}
    public opportunitylineitem opplt{get;set;}
    public opportunity opp{get;set;}
    public string currentpageid{get;set;}
    public string accountid{get;set;}
    public boolean rendering{get;set;}
    public Account acc{get;set;}
    public List<opportunitycontactrole> lstoppcr{get;set;}
    set<id> oppids=new set<id>();
    set<id> accids=new set<id>();
    public oppinfobuttonandpagestylings(){
        opp=new opportunity();
        acc=new Account();
        rendering=false;
        currentpageid=Apexpages.currentPage().getParameters().get('id');
        opp=[select id,accountid,name,StageName,CloseDate,Amount,Ownerid,Account.name,Account.type,Account.industry,Account.website,Account.Phone from opportunity where id=:currentpageid limit 1];
        acc=[select name,type,industry,website,phone from account where id=:opp.accountid];
        lstoppcr=[select Role, OpportunityId, Contact.LeadSource, Contact.Email, Contact.LastName, ContactId From OpportunityContactRole where OpportunityId=:opp.id];
        system.debug('Contact Roles--->'+lstoppcr);
        
    }
}