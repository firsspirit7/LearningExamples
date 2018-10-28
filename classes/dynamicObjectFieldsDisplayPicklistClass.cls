public with sharing class dynamicObjectFieldsDisplayPicklistClass{

    public Boolean ren { get; set; }
    public String inputValue { get; set; }
    public String selectedfld { get; set; }    
    public List<SelectOption> flds { get; set; }
    public String selectedfields { get; set; }  
    public List<SelectOption> items { get; set; }
    public String selectedObj { get; set; }
    
    public dynamicObjectFieldsDisplayPicklistClass(){
        ren = false;
        List<Schema.sObjecttype> lst= Schema.getGlobalDescribe().values();
        items= new List<SelectOption>();
        flds = new List<selectOption>();
        flds.add(new SelectOption('','--None--'));
        items.add(new SelectOption('','--None--'));        
        for(Schema.sobjecttype s:lst){
         //if(String.valueOf(s).contains('__c'))
            items.add(new SelectOption(string.valueOf(s),String.valueOf(s)));
        }
    }
    
    public void Fields(){        
            if(selectedObj!=null){
                Schema.SObjectType gd = Schema.getGlobalDescribe().get(selectedObj); 
                Schema.DescribeSobjectResult a11=gd.getDescribe();                
                Map<String, Schema.SObjectField> M = a11.fields.getMap();
                flds.clear();
                flds.add(new SelectOption('','--None--'));                
                for(Schema.SObjectField s1:m.values()){
                    system.debug('----'+s1+'\n');
                    system.debug('=============================>'+s1);                    
                    flds.add(new SelectOption(string.valueOf(s1),string.valueOf(s1)));                   
                }
            }
            system.debug('flds======>'+flds);         
    }
   public PageReference fldname() {        
        system.debug('=====================>'+selectedfld);
        inputValue =  selectedfld ;
        ren = true;
        return null;
    }

 }