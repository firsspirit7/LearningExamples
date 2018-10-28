public class theController1 {
 //String searchText;
 List<Account> accounts=new List<Account>();
 List<Contact> contacts= new List<Contact>();
 List<opportunity> opportunities=new List<opportunity>();
 List<Lead> leads=new List<Lead>();   
   /*public String getSearchText() {
      return searchText;
   }

   public void setSearchText(String s) {
      searchText = s;
   }*/
   public string searchText{get;set;} 

   public List<Lead> getResults() {
      //if(leads!=null && leads.size()>0)
         //ren='true';
      return leads ;
   }
   public List<Account> getAccounts(){
       return accounts;
   }
   public List<Contact> getContacts(){
       return contacts;
   
   }
   public List<Opportunity> getOpportunities(){
   
      return opportunities;
   
   }
   public PageReference doSearch() {
       try{
        if(searchText!=null && searchText!=''){
            List<List<SObject>> searchList = [FIND :searchText+'*' IN All Fields RETURNING Account (id,name,industry), Contact(id,name,email,firstname,lastname),Opportunity(id,name,stagename,closedate),lead(id,name,email,phone)]; 
            system.debug('searchlist===========>'+searchlist);
            accounts = ((List<Account>)searchList[0]);
            contacts = ((List<Contact>)searchList[1]);
            opportunities=((List<Opportunity>)searchList[2]);
            leads=((List<lead>)searchList[3]);   
       }
       
     }
     Catch(Exception e){
     
     
     }
      return null;
     
     
   }

}