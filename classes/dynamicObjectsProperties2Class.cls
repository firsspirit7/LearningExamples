public with sharing class dynamicObjectsProperties2Class
 {
    public class dynamicinfo
     {
       public string gname{get;set;}
       public string glabel{get;set;}
       public string gkeypix{get;set;}
       public boolean gcre{get;set;}
       public boolean gdel{get;set;}
       public boolean gaccs{get;set;}
       public boolean gcust{get;set;}
       public Schema.Sobjecttype gSobj{get;set;}
     }
    public List<dynamicinfo> lstobjinfo{get;set;}
    dynamicinfo dobj;
    public dynamicObjectsProperties2Class()
     {
        Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();  
        List<Schema.SObjectType>  gd1 = Schema.getGlobalDescribe().values(); 
        Schema.DescribeSobjectResult a11; 
        lstobjinfo = new List<dynamicinfo>();
        for (SObjectType So : gd1)  
        {            
            dobj = new dynamicinfo();
            a11= So.getDescribe();
            dobj.gname = a11.getName();
            if( a11.getKeyPrefix() != null)
            dobj.gkeypix = a11.getKeyPrefix();                       
            else
            dobj.gkeypix = 'Null'; 
            dobj.glabel= a11.getLabel();
            dobj.gaccs = a11.isAccessible();
            dobj.gcre = a11.isCreateable();
            dobj.gdel = a11.isDeletable();
            dobj.gcust = a11.isCustom();
            dobj.gSobj = a11.getSObjectType();
            lstobjinfo.add(dobj);            
           
        }                
     }
 }