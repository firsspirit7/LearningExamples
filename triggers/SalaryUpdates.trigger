trigger SalaryUpdates on Opportunity (after insert,after update,after delete) {      
        
        /* 
        
          Task Description : Field updating when on trigger events like insert,update,delete occurs.
          create a salary  and total salary custom fields on opportunity objects.
          And create a self relationship(lookup relationship) custom field like parent opportunity on opportunity.
          Create one parent record on opportunity with out entering data in salary and total salary field.
          After in that record related list clik on New opportunity button and then enter the data into that record with out entering data in total salary field.
          and also create a another record record. finally we found 2 child records in that parent record.
          When we insering new child records, then  updating the total salary field with salary in 1st child record and 2nd child record.
          When we updating the salary in child record , then automatically update the total salary in parent record.
          When we Deleting the any one child record , then automatically update the total salary in parent record.
                                  
         */
        Set<id> sopp = new Set<id>();
        Map<id,Decimal> Mopp = new Map<id,Decimal>();
        if(Trigger.isInsert){ 
        System.debug('======================>Entering for Insert');              
        for(Opportunity opp:Trigger.new){
            if(opp.Parent_Opportunity__c != null){                      
                sopp.add(opp.Parent_Opportunity__c);                
            }
        }
        for(Opportunity opp1: [select id,Total_Salary__c from Opportunity where Id In : sopp]){         
                Mopp.put(opp1.id,opp1.Total_Salary__c);
        }
        for(Opportunity opp2 : Trigger.new){            
            if(opp2.Parent_Opportunity__c != null){                             
                if(mopp.get(Opp2.Parent_Opportunity__c) == null){
                    mopp.put(opp2.Parent_Opportunity__c,opp2.Salary__c);
                }
                else{                                                                                                   
                    Mopp.put(opp2.Parent_Opportunity__c,mopp.get(opp2.Parent_Opportunity__c) + opp2.Salary__c);
                }
            }
        }
        for(Opportunity opp3: [select id,Total_Salary__c from Opportunity where Id In : sopp]){
            opp3.Total_Salary__c = mopp.get(opp3.id);
            update opp3;
        }
        }        
        if(Trigger.isUpdate){        
        
        for(Opportunity opp:Trigger.new){         
            if(opp.Parent_Opportunity__c != null){
                sopp.add(opp.Parent_Opportunity__c);
            }          
         }
        For(Opportunity opp1 : [select id,Total_Salary__c from Opportunity where Id In : sopp]){
                Mopp.put(Opp1.id,opp1.Total_Salary__c);
        }  
             
        For(Opportunity opp2 : Trigger.new){
               Integer i = 0;       
            
               if(opp2.Parent_Opportunity__c != null){
                    if(mopp.get(Opp2.Parent_Opportunity__c) != null){
                             if(trigger.old[i].Salary__c != Trigger.New[i].Salary__c)                    
                       Mopp.put(Opp2.Parent_Opportunity__c,mopp.get(opp2.Parent_Opportunity__c)- trigger.old[i].Salary__c + Trigger.New[i].Salary__c);             
                       }
               }
                  
        }
        for(Opportunity opp3: [select id,Total_Salary__c from Opportunity where Id In : sopp]){
            opp3.Total_Salary__c = mopp.get(opp3.id);
            update opp3;
        }                   
   } 
   
    if(Trigger.isdelete){        
        
        for(Opportunity opp:Trigger.old) {       
            if(opp.Parent_Opportunity__c != null){
                sopp.add(opp.Parent_Opportunity__c);
            }          
         }
        For(Opportunity opp1 : [select id,Total_Salary__c from Opportunity where Id In : sopp]){
                Mopp.put(Opp1.id,opp1.Total_Salary__c);
        }        
        For(Opportunity opp2 : Trigger.old){
               Integer i = 0;                    
               if(opp2.Parent_Opportunity__c != null){
                    if(mopp.get(Opp2.Parent_Opportunity__c) != null){                                                
                       Mopp.put(Opp2.Parent_Opportunity__c,mopp.get(opp2.Parent_Opportunity__c) - trigger.old[i].Salary__c);             
               }
              }    
        }
        for(Opportunity opp3: [select id,Total_Salary__c from Opportunity where Id In : sopp]){
            opp3.Total_Salary__c = mopp.get(opp3.id);
            update opp3;
        }                   
   } 
        
}