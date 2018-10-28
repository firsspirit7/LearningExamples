// Author       :   P.Sruthi
   // Date          :   sep- 13- 2012
   // Description   :   Designed a SignIn Page for a student to signup and create a account and performed all the javascript validations 
                       //for the signup page and the user is enter the perfect login credentials then he can see the company website completely 





public with sharing class Loginstudentinfowithpassword {
           public string username {get;set;}// we are holding the values login screen input values so that we can query in the future
           public string password {get;set;}// we are holding the values login screen input values so that we can query based on the records in the database
           List<StudentInformation__c> lststud {get;set;}// we are using a list of student records so that  we have to have to query based on input login screen values 
           
           public  boolean rendering{get;set;}
           
           public StudentInformation__c std {get;set;}// to insert the  data from the signup page to the student information database 
           
           
           
           
           public Loginstudentinfowithpassword()
           {
                 
            std = new StudentInformation__c();// we  are allocating the memory in the constructor so that we can use it anywhere in the class
            lststud = new List<StudentInformation__c>();// we  are allocating the memory in the constructor so that we can use it anywhere in the class
            rendering =false;  
              
           }
           
   // login page method signup button        
        
        public pagereference signuppage()// a method that is called when we click signup button in Login page
        {
            pagereference pg = new pagereference('/apex/Signuppagestudentinfodata');// we are using this method and we are redirecting it to the signuppage using page reference method 
              pg.setRedirect(true);
            return pg;
        
        }
  // inserting the student records into the database submit button click      
        
        public pagereference studentrecord()
        {
        
        try
        {
            insert std ;// all the student data will be inserted into the database if there are no exceptions like duplicate username ,student name is reqiured field
            
           return pgcancel();// after it has inserted we have to return to the login page so  that we are calling the method that is actually written for pg cancel
            
         }
         
            catch( exception ex) //if we get any exception during the insertion of the data in the database that exception is displayed in the page using apexpagemessages
            {
             ex.getMessage();// actually we are geting that msg and we are adding to the apex pages 
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.Error,ex.getMessage()));// to add the message the apex pages and then it is used inapex page messages tag in  the page 
             return null;
            }       
        
        }
  // page cancel 
        public pagereference pgcancel()//  a page reference method  that is called in the signup page inorder to redirect to the 
        {
           system.debug('===============>');
           pagereference pg = new pagereference ('https://c.ap1.visual.force.com/apex/Loginpage');// we are passing the link  to the page reference method 
           return pg;
        
        }
        
  // for signin page       
        public pagereference pgsignin()// we have taken the pagereference method because we have to redirect to a page if the list contains the value
        {  
               system.debug('=========>'+username);
            
           
        
         lststud = [Select id, UserName__c, ReTypePassword1__c From StudentInformation__c where UserName__c = :username and ReTypePassword1__c =:password ];// we are checkng whether list contains any value when it checks with the username , password in the login screen 
                    
          
                       
            
             system.debug('==========>'+lststud);
            
             pagereference pg = new pagereference('https://c.ap1.visual.force.com/apex/signinpage');
            
              pg.setRedirect(true);
             if(lststud!= null && lststud.size()>0)// if the list contains a value then it should redirect to the home page 
             {
              system.debug('=============>');
               
                  return pg;// it returns to the exact page 
             }          
                          
          
       else// if the database doesnot contain the username and password in the database the we are displaying custom message on to the page 
       {
       
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR, 'Invalid UserName or password');// adding a custom message to the page 
       ApexPages.addmessage(myMsg);

       
         return null;
         
         
       }
            
            
            
        }
        
      public void pgdetails ()
      {
        system.debug('==============>'+rendering);
       
          rendering = true ;
      }  
        
       public void pgabout ()
      {
        system.debug('==============>'+rendering);
       
          rendering = false ;
      }  
        
        
          
        

}