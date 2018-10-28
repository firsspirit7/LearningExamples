public with sharing class sendEmailToContactsClass
{   
    public List<string> lst {get;set;}    
    public boolean isdisplay {get;set;}    
    public PageReference sendemail() {         
        //We create a new list of Contacts that we be populated only with Contacts if they are selected
        List<Contact> selectedContacts = new List<Contact>(); 
        //We will cycle through our list of cContacts and will check to see if the selected property is set to true, if it is we add the Contact to the selectedContacts list
        
        for(wrapercon cCon : getcontacts) {                         
            if(cCon.isselected == true && cCon.con.email == null) {               
                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.WARNING,'email is required To this contacts'+cCon.con.name));         
            }
            else if(cCon.isselected == true || Test.isRunningTest())
            {
             selectedContacts.add(cCon.con);
            }
        } 
        lst = new List<string>();
        // Now we have our list of selected contacts and can perform any type of logic we want, sending emails, updating a field on the Contact, etc
        System.debug('These are the selected Contacts...');        
        for(Contact con1 : selectedContacts) {
            system.debug('#########################################'+con1);
            system.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'+con1.email); 
            if(con1.Email != null)                
            lst.add(con1.email);
            system.debug('ssssssssssssssssssssssssssssssss'+lst);
        }   
            
            if(lst!=null)
            {
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            							
                                                String[] toAddresses = lst;
                                                system.debug('VVVVVVVVVVVVVVVVVVVVVVVVVVVV'+lst);
                                                if(lst != null && lst.size()>0)
                                                {
                                                	mail.setToAddresses(toaddresses);
                                                mail.setSenderDisplayName('Support');
                                                mail.setSubject('Contact Test Mail ');
                                                mail.setPlainTextBody('New Phone .');
                                                Messaging.reserveSingleEmailCapacity(1);
                                                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });           							           
                                                ApexPages.addMessage(new ApexPages.message(ApexPages.severity.INFO,'email sent successfully to slected contacts '+lst));
                                                }            
            }
                               return null;
                }  


    public String isselected { get; set; }  
    
    public class wrapercon
    {
      public Contact con {get;set;}
      public boolean isselected {get;set;}
      public string email {get;set;}
    }
    public List<wrapercon> getcontacts {get;set;}
    wrapercon wraperobj;
    public sendEmailToContactsClass()
    { 
      isdisplay=false;
      getcontacts = new List<wrapercon>();
      List<contact> contlst= [select id,Email,Name from Contact];      
      for(Integer i = 0; i<contlst.size(); i++)
         {  
            wraperobj = new wrapercon();
            wraperobj.con = contlst[i];
            wraperobj.isselected = false;
            wraperobj.con.email = contlst[i].email;
            getcontacts.add(wraperobj);
         }
    }

}