public with sharing class oppltpopupcls {
    public opportunitylineitem opplt{get;set;}
    public string oppid{get;set;}
    public List<OpportunityLineItem> lstopplitem{get;set;}
    public oppltpopupcls(){
        opplt=new opportunitylineitem();
        lstopplitem=new List<OpportunityLineItem>();
        oppid=Apexpages.currentPage().getParameters().get('id');
        lstopplitem=[Select UnitPrice, Quantity, PricebookEntry.ProductCode, PricebookEntry.Name, PricebookEntryId, ListPrice From OpportunityLineItem where opportunityid=:oppid];
 
    }
    public pagereference saveopplt(){
     if(lstopplitem!=null && lstopplitem.size()>0)
            update lstopplitem;
        return new pagereference('/apex/oppltpopuppage?id='+oppid).setredirect(true);
    }
    
}