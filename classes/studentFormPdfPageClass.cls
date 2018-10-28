//This is class for Displayng PDF page to user
public with sharing class studentFormPdfPageClass
{
    public boolean ren;
    public boolean getRen() {
        return ren;
    }
    public void change()
    {  
    //Comparison MaritalStatus Field wth Null if satisfied change the render property  
    if ( objS.MaritalStatus__c == 'None')      
    ren = False;
    else
    ren = True;
    system.debug('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$'+ objS.MaritalStatus__c); 
    
        
    }     
//Declaring properties 
    public StudentForm__c objS{get;set;}    
    string id1;
//Constructor For Displaying data    
    public studentFormPdfPageClass() 
    
    {
//Getting id from page 
     id1=apexpages.currentpage().getparameters().get('id');
//Checking the id 
     if(id1!=null)
      {
      objS = new StudentForm__c();
      objS=[select id,Name,Location__c,Age__c,DateOfBirth__c,Gender__c,MaritalStatus__c,PhoneNumber__c,Qualification__c,Skills__c,CollegeName__c from StudentForm__c where id=:id1];   
      }
//Checking for displaying image on page
      if ( objS.MaritalStatus__c == '')      
         ren = False;
         else
         ren = True;    
    }
 
}