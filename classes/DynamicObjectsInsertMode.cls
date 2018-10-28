public with sharing class DynamicObjectsInsertMode {

    public Boolean isdisplay { get; set; }
    public DynamicObjectsInsertMode()
    {  
       isdisplay = false;
    }
    public PageReference go() 
    {        
         Schema.SObjectType gd;
         Schema.DescribeSobjectResult a11;             
         if(objName!=null)
           {  
              Map<String, Schema.SObjectType> obj = Schema.getGlobalDescribe();
              if(!obj.containsKey(objName))             
                 ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING,'So Please Enter Valid Object Name'));            
              else
              {
                 gd = Schema.getGlobalDescribe().get(objName); 
                 a11=gd.getDescribe();
              }
             
           }         
        pagereference pg;
        if(a11 != null)
        {
        if(a11.isCreateable() && a11.isAccessible() && a11.isDeprecatedAndHidden()==false && a11.isQueryable() && a11.isSearchable())
        pg=new Pagereference('/'+a11.getKeyPrefix()+'/e?');
        else
        ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING,'This Object is Not Creatable Name::  '+objName+ ',  So Please Enter Another Object'));        
        }
        return pg;
        
    }
    public String objName { get; set; }
    
}