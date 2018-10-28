public  class Indicatingfieldsonclassesandtriggers {
    public List<ApexClass> lstapexclasses{get;set;}
    public List<ApexTrigger> lstapextrigger{get;set;}
    public List<ValidationRulecls> lstvalidationRule{get;set;}
    public List<SelectOption> lstselectOption{get;set;}
    public List<SelectOption> lstselectfields{get;set;}
    public List<WorkflowRulecls> lstWflowrules{get;set;}
    public String selectedObject{get;set;}
    public String fieldName{get;set;}
    public Indicatingfieldsonclassesandtriggers(){
        lstapexclasses=new List<ApexClass>();
        lstapextrigger=new List<ApexTrigger>();
        lstselectOption=new List<SelectOption>();
        lstselectfields=new List<SelectOption>();
        lstvalidationRule = new List<ValidationRulecls>();
        lstWflowrules = new List<WorkflowRulecls>();
        lstselectOption.add(new SelectOption('','--None--'));
        lstselectfields.add(new SelectOption('','--None--'));
        //preparing objects
        List<String> lst=new List<String>(Schema.getGlobalDescribe().keyset());
        lst.sort();
        for(String sobjectName:lst){
            lstselectOption.add(new SelectOption(sobjectName,sobjectName));
        }
    }
    public void Fieldslst(){
        lstselectfields.clear();
        lstapexclasses.clear();
        lstapextrigger.clear();
        lstvalidationRule.clear();
        lstselectfields.add(new SelectOption('','--None--'));
        if(selectedObject!=null && selectedObject!=''){
            for(Schema.SObjectField sfield:Schema.getGlobalDescribe().get(selectedObject).getDescribe().fields.getMap().values()){
                schema.describefieldresult dfield =sfield.getDescribe();  
                lstselectfields.add(new SelectOption(dfield.getName(),dfield.getName()));
            }
        }
        lstselectfields.sort();
    }
    public void Findfield(){
        lstapexclasses.clear();
        lstapextrigger.clear();
        lstvalidationRule.clear();
        lstWflowrules.clear();
      if(fieldName!=null && selectedObject!=null && fieldName!='' && selectedObject!=''){
        for(ApexClass apexclassobj:[select id,name,body from ApexClass]){
           if(apexclassobj.body.containsignorecase(fieldName) && apexclassobj.body.containsignorecase(selectedObject) 
           && apexclassobj.Name!='Indicatingfieldsonclassesandtriggers' && apexclassobj.Name!='ValidationRuleJsonParsercls' && 
           apexclassobj.Name!='RetrievingToolingApiObjects'){
                    lstapexclasses.add(apexclassobj);
           }
        }
        for(ApexTrigger apextrigobj:[select id,name,body from ApexTrigger]){
            if(apextrigobj.body.containsignorecase(fieldName) && apextrigobj.body.containsignorecase(selectedObject))
                    lstapextrigger.add(apextrigobj);
            
        }
        //Getting validation rule
         String jsonString = '';
         jsonString=String.valueOf(RetrievingToolingApiObjects.queryValidationRules(selectedObject));
         if(jsonString!=''){
         		ValidationRuleJsonParsercls  validationJsonObj=(ValidationRuleJsonParsercls)JSON.deserialize(jsonString,ValidationRuleJsonParsercls.class);
         		if(validationJsonObj.records!=null && validationJsonObj.records.size()>0){
         			for(ValidationRuleJsonParsercls.Recordscls validationObj:validationJsonObj.records){
         				 ValidationRuleJsonParsercls.MetaDatacls metadataObj= validationObj.Metadata;
         				  if(metadataObj.errorConditionFormula.containsIgnoreCase(fieldName)){
				             Indicatingfieldsonclassesandtriggers.ValidationRulecls validationruleObj= new Indicatingfieldsonclassesandtriggers.ValidationRulecls();
				             validationruleObj.validationRuleId = validationObj.id;
				              validationruleObj.validationName = validationObj.validationName;
				              validationruleObj.errorConditionFormula =metadataObj.errorConditionFormula;
				              validationruleObj.isActive = metadataObj.active;
				              lstvalidationRule.add(validationruleObj);
				             /*System.debug('FullName:'+validationObj.FullName);
				             System.debug('Id:'+validationObj.Id);
				             System.debug('LastModifiedDate:'+validationObj.LastModifiedDate);
				             System.debug('Metadata:'+validationObj.Metadata);
				             System.debug('TableEnumOrId:'+validationObj.TableEnumOrId); 
				             ValidationRuleJsonParsercls.MetaDatacls metadataObj= validationObj.Metadata;
				             System.debug('Active:'+metadataObj.active);
				             System.debug('errorConditionFormula:'+metadataObj.errorConditionFormula);
				             System.debug('errorDisplayField:'+metadataObj.errorDisplayField);
				             System.debug('urls:'+metadataObj.urls);*/
         				  }
					}
         			
         		}
         }
         //end of getting validation rule
         String jsonWflowRuleString='';
         jsonWflowRuleString = string.valueOf(RetrievingToolingApiObjects.queryWorkflowRules(selectedObject));
       	 System.debug('jsonWflowRuleString::'+jsonWflowRuleString);
       	 if(jsonWflowRuleString!=''){
       	 		workflowruleJsonParsercls wfjsonParserobj = (workflowruleJsonParsercls)JSON.deserialize(jsonWflowRuleString,workflowruleJsonParsercls.class);
       	 		if(wfjsonParserobj.records!=null && wfjsonParserobj.records.size()>0){
       	 				for(workflowruleJsonParsercls.cls_records workflowObj:wfjsonParserobj.records){
       	 					System.debug('wfjsonParserobj.records--->'+wfjsonParserobj.records);
       	 					System.debug('workflowObj.Metadata.formula-->'+workflowObj.Metadata.formula +'@@@:'+fieldName);
       	 					System.debug('criteria Items:0-->'+workflowObj.Metadata.criteriaItems);
       	 					workflowruleJsonParsercls.cls_Metadata metadataObj = new workflowruleJsonParsercls.cls_Metadata();
       	 					metadataObj = workflowObj.Metadata;
       	 					System.debug('workflowObj.Metadata-->:'+workflowObj.Metadata);
       	 					System.debug('formula-->:'+metadataObj.formula);
       	 					System.debug('criteriaItems-->:'+metadataObj.criteriaItems);
       	 					if(workflowObj.Metadata.formula!=null && workflowObj.Metadata.formula.containsIgnoreCase(fieldName)){
       	 						System.debug('If Enteringg.....');
	       	 					WorkflowRulecls wflowObj = new WorkflowRulecls();
	       	 					wflowObj.formulacondition = workflowObj.Metadata.formula;
	       	 					wflowObj.wflowName = workflowObj.Name;
	       	 					wflowObj.wflowId = workflowObj.Id;
	       	 					
	       	 					lstWflowrules.add(wflowObj);	
       	 					}
       	 					if(metadataObj.criteriaItems!=null && metadataObj.criteriaItems.size()>0){
       	 							for(workflowruleJsonParsercls.cls_criteriaItems criteriaItemObj:metadataObj.criteriaItems){
       	 									if(criteriaItemObj.field!=null && criteriaItemObj.field!='' 
       	 											&& criteriaItemObj.field.containsIgnoreCase(fieldName)){
       	 												WorkflowRulecls wflowObj = new WorkflowRulecls();
							       	 					wflowObj.formulacondition = String.valueOf(criteriaItemObj);
							       	 					wflowObj.wflowName = workflowObj.Name;
							       	 					wflowObj.wflowId = workflowObj.Id;
							       	 					lstWflowrules.add(wflowObj);
       	 									}
       	 							}
       	 					}
       	 				}
       	 		}
       	 		
       	 		/*if(wfjsonParserobj.records!=null && wfjsonParserobj.records.size()>0){
       	 				for(workflowruleJsonParsercls.cls_records workflowObj:wfjsonParserobj.records){
       	 					System.debug('workflowObj.Metadata.formula'+workflowObj.Metadata.formula +'@@@:'+fieldName);
       	 					if(workflowObj.Metadata.formula.containsIgnoreCase(fieldName)){
	       	 					WorkflowRulecls wflowObj = new WorkflowRulecls();
	       	 					wflowObj.formulacondition = workflowObj.Metadata.formula;
	       	 					wflowObj.wflowName = workflowObj.Name;
	       	 					wflowObj.wflowId = workflowObj.Id;
	       	 					
	       	 					lstWflowrules.add(wflowObj);	
       	 					}
       	 				}
       	 		}*/
       	 		System.debug('lstWflowrules:@@:'+lstWflowrules);
       	 }
      }
    }
    public class ValidationRulecls{
    		public Id validationRuleId{get;set;}
    		public String validationName{get;set;}
    		public String errorConditionFormula{get;set;}
    		public boolean isActive{get;set;}
    }
    public class  WorkflowRulecls{
    	public Id wflowId{get;set;}
    	public String wflowName{get;set;}
    	public String formulacondition{get;set;}
    	public boolean isActive{get;set;}
    	public String criterias{get;set;}
    }
}