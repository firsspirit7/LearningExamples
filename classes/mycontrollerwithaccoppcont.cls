public class mycontrollerwithaccoppcont {
        public List<Account> getAccounts(){
            List<Account> lstaccount=[select id,name,industry,type from account];
            return lstaccount;
            
        }
        public List<Contact> getContacts(){
            List<Contact> lstcontact=[select id,name,email,phone from contact];
            return lstcontact;
              
        }
        public List<Opportunity> getOpportunity(){
            List<opportunity> lstopp=[select id,name,stagename,closedate from opportunity];
            return lstopp;
        
        
        }
    
}