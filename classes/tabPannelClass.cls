public with sharing class tabPannelClass {
   
     /*public pagereference viewUser()
     {
        System.debug('----------------->'+recordId);
        pagereference ref= new pagereference('/'+recordid);
        return ref;
    } */   
    public string recordid{get; set;} 
    public tabPannelClass()
      {
          userss = [select id,name from user];  
          Triggerss = [select id,name,TableEnumOrId from apextrigger]; 
          Pagess = [select id,name from apexpage];  
          RecordTypess = [select id,name from recordtype]; 
          Classess = [select id,name from apexclass]; 
      } 

    public List<User> userss{ get; set; }
    public List<apextrigger> Triggerss { get; set; } 
    public List<apexpage> Pagess { get; set; }
    public List<recordtype> RecordTypess { get; set; }
    public List<apexclass> Classess { get; set; }   

}