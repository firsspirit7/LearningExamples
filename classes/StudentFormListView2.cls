//class for displaying objectlist on page using wrapper class
//Start Main class
public with sharing class StudentFormListView2 {
     //definig properties using in this class
     public Integer rowIndex1{get;set;}       
     public boolean ren2{get;set;}
     //defineing List<wrapper> holding wrapper class properties   
     public List<wrapper> lstwrapper{get;set;}
     //definig wrapper class object
     public wrapper wrapobj;
     //method for Canceling opperation record      
     public PageReference doCancel() 
     {
        //checking the lstsize with rowIndex if satisfies  enters into the if block       
        if(lstwrapper.size()>rowIndex1)
        {
            //assiagn the boolean value to variable
            lstwrapper[rowIndex1].ren2=true;                        
        }                 
       return null;
     }
     //method for saving records
     public PageReference doSave() 
     {
        //condition as Similar to above method
        if(lstwrapper.size()>rowIndex1)
        {
            //Try block which have chances to get error
            try
            {
            update lstwrapper[rowIndex1].stu;
            }
            //Catch block for catchng the error msg
            catch(Exception e)
            {
             system.debug('Hi');
            }
            lstwrapper[rowIndex1].ren2=true;
             
        }     
       
        return null;
    }
    //method for deleting records
    public PageReference doDelete() 
         {         
            if(lstwrapper.size()>rowIndex1)
            {
                //deleting rowindex in lstwrapper
                delete lstwrapper[rowIndex1].stu;
                //deleting record in lstwrapper     
                lstwrapper.remove(rowIndex1);
            }   
            return null;
         }
    //method for editnd records
    public PageReference doEdit() 
    {         
        if(lstwrapper.size()>rowIndex1)
        {
            lstwrapper[rowIndex1].ren2=false;
            
        }
             
        return null;
    }   
    //wrapper class for definig  using properties
    public class wrapper
     {
        public StudentForm__c stu{get;set;}
        public Integer rowIndex {get;set;}        
        public boolean ren2 {get;set;}
     }
    public StudentFormListView2()
    {    
       lstwrapper=new List<wrapper>();
       List<StudentForm__c> stulst = [select id,Name,PhoneNumber__c,Age__c,Qualification__c,DateOfBirth__c,MaritalStatus__c from StudentForm__c];   
       for(Integer i=0;i<stulst.size();i++)
          {                   
              wrapobj = new wrapper();
              wrapobj.stu = stulst[i];
              wrapobj.rowIndex = i;
              wrapobj.ren2=true;
              lstwrapper.add(wrapobj);
          }
            
    }
}