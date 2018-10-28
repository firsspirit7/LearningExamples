trigger accountconttrigger on Account (before insert,after insert,after update,before delete) {
       if(trigger.isinsert && trigger.isAfter){
            List<Contact> lstcontact=new List<Contact>();
            for(Account actobj:trigger.new){
                Contact cont=new Contact();
                cont.lastname=actobj.name;
                cont.accountid=actobj.id;
                lstcontact.add(cont);
            }
            if(lstcontact!=null && lstcontact.size()>0)
                    insert lstcontact;
       }
       if(trigger.isInsert && trigger.isBefore){
               for(Account actobj:trigger.new){
                       actobj.type='Customer Channel';              
               }         
       }
       if(trigger.isUpdate && trigger.isAfter){
               List<Opportunity> lstopp=new List<Opportunity>();
               for(Account actobj:trigger.new){
                   Opportunity oppobj=new Opportunity();
                   oppobj.name=actobj.name;
                   oppobj.accountid=actobj.id;
                   oppobj.closedate=System.today();
                   oppobj.stagename='Prospect';
                   lstopp.add(oppobj);              
               }   
               if(lstopp!=null && lstopp.size()>0)
                       insert lstopp;   
       }
       if(trigger.isdelete && trigger.isBefore){
               List<Case> lstcase=new List<Case>();
               for(Account actobj:trigger.old){
                   Case csobj=new Case();
                   csobj.status='New';
                   csobj.origin='Email';
                   csobj.description='An account is deleted with Name:'+actobj.name;
                   lstcase.add(csobj);
               }
               if(lstcase!=null && lstcase.size()>0)
                       insert lstcase;     
       
       }
}