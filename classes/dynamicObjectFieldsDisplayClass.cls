public with sharing class dynamicObjectFieldsDisplayClass {

    public List<Schema.sObjecttype> getObjects()
     {
        List<Schema.sObjecttype> lst= Schema.getGlobalDescribe().values();
        return lst;
     }  
}