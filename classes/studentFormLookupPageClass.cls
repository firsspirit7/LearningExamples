public with sharing class studentFormLookupPageClass
 {    
    public List<College__c> lst{get;set;}
    public List<College__c> getColleges()
     {       
        lst = new List<College__c>();
        List<College__c> lst = [select id,name from College__c];        
        system.debug('==========================>'+lst);
        return lst;
     }
 }