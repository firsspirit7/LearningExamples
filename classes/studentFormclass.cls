//This class for studentForm 
public with sharing class studentFormclass
 { 
    public boolean getRen() {
        return ren;
    } 
    public boolean ren{get;set;}
    public String gender { get; set; }   
    //Method Display image beside MaritalStatus Field
    public PageReference change()
    {  
    //Comparison MaritalStatus Field wth Null if satisfied change the render property  
    if ( objS.MaritalStatus__c == null)    
    ren = False;
    else
    ren = True;
    
        return null;
    }     
//This is the constructor of studentFormClass
    public StudentForm__c objS{get;set;}
    public studentFormClass()
        {
             objS = new StudentForm__c();
        }
//This is method for Cancel
    public PageReference doCancel()
    {
        return null;
    }

//This is method for save
    public PageReference doSave()
     {       
        insert objS;
        return new pagereference('/apex/StudentFormPdfPage?id='+objs.id);       
     }
    //Adding items into options
     public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('Male','Male')); 
        options.add(new SelectOption('Female','Female')); 
        return options; 
    }


}