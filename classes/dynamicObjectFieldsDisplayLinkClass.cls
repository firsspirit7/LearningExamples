public with sharing class dynamicObjectFieldsDisplayLinkClass 
 {
    string obj; 
    public set<string> Fields{get;set;}
    public dynamicObjectFieldsDisplayLinkClass(){
        Fields = new set<string>();
        obj = apexpages.currentpage().getparameters().get('myobj');    
        map<String, Schema.SObjectType>  m = Schema.getGlobalDescribe();
        SObjectType OrdObj;
        Set<String> fieldnames;
        DescribeSObjectResult objDef1;
        map<String, SObjectField> fieldmap;
        if(m.get(obj)!= null)
         OrdObj = m.get(obj);
        if(OrdObj != null)
           objDef1 = OrdObj.getDescribe();
        if(objDef1 != null)
           fieldmap =  objDef1.fields.getmap();
        if(fieldmap!=null)
           fieldnames = fieldmap.keySet();
           for(string names:fieldnames){
               Fields.add(names);
           }
           system.debug('Fields=======>'+Fields);
           system.debug('sObjName=======>'+Obj);
           system.debug('fieldnames=======>'+fieldnames);
           system.debug('fieldmap=======>'+fieldmap.size()+' +'+fieldmap);
    
    }   
    
 }