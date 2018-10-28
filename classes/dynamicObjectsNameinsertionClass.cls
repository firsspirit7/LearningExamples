public with sharing class dynamicObjectsNameinsertionClass
 {

    public PageReference doSave()
    {         
      map<String, Schema.SObjectType> sobj = Schema.getGlobalDescribe();
      SObjectType sac = sobj .get(selectedObj); 
      Sobject s = sac.newSObject();
      s.put('Name',name);
      insert s;
      return null; 

    }
    public String name { get; set; }
    public List<SelectOption> items { get; set; }
    public String selectedObj { get; set; }
    public  dynamicObjectsNameinsertionClass()
    {
        List<Schema.sObjecttype> lst= Schema.getGlobalDescribe().values();
        items= new List<SelectOption>();
        items.add(new SelectOption('','--None--'));
        for(Schema.sobjecttype s:lst)
        {
        //if(String.valueOf(s).contains('__c'))
            items.add(new SelectOption(string.valueOf(s),String.valueOf(s)));
        }
    }

}