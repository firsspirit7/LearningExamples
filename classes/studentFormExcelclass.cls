//this class for Displaying data in PageBlockTable
public with sharing class studentFormExcelclass
{
    //this is method for performing action when clicking the button
    public PageReference excel() {
        //This statement states that page is redirecting to excel sheet
        return new pagereference('/apex/StudentFormExcelSheet');
    }   
     //This list hold the all the StudentForm__c data 
     public List<StudentForm__c> lstS = new List<StudentForm__c>();
     //This method for getting all StudentForm__c data into the List
     public List<StudentForm__c> getGetRecords()
      {
        lstS = [select id,name,PhoneNumber__c,Qualification__c,Age__c,DateOfBirth__c,MaritalStatus__c,Gender__c,Skills__c from StudentForm__c];
        return lstS;
      }

}