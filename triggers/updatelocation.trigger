trigger updatelocation on StudenteTable__c (before insert,after insert,before update,after update) {
       //List<StudenteTable__c> lststudents=new List<StudenteTable__c>();
        //for(StudenteTable__c  stuobj:trigger.new){
           // StudenteTable__c studobj1=new StudenteTable__c(id=stuobj.id,location__c='Hyderabad');
            //lststudents.add(studobj1);
            //stuobj.location__c='Hyderabad';
        
        //}
       // if(lststudents!=null && lststudents.size()>0)
                //update lststudents;
             StudenteTable__c  stuobj=trigger.new[0];
          
                   stuobj.name=stuobj.name+system.today();
         
          
          
          if(trigger.isinsert && trigger.isbefore){
          
          
          }
          
          if(trigger.isinsert && trigger.isafter){
          
          
          }
          
          if(trigger.isupdate && trigger.isbefore){
          
          
          }
          
}