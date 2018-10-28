public with sharing class accOppCntCasInsertPageClass {

    public Account objA{get;set;}
    public Contact objC{get;set;}
    public Opportunity objO{get;set;}
    public Case objCa{get;set;}
    public accOppCntCasInsertPageClass ()
      {
        objA = new Account(); 
        objC = new Contact();
        objO = new Opportunity();
        objCa = new Case();
      }   
    public PageReference doSave()
     {
        Account objA1 = new Account();
        Contact objC1 = new Contact ();
        Opportunity objO1 = new Opportunity();
        Case objCa1 = new Case();       
        insert ObjA;
        objC1.accountid = objA.id;
        objO1.accountid = objA.id;                       
        objCa1.accountid = objA.id;                
        objC1.LastName = objC.LastName;
        objC1.Email = objC.Email;
        objO1.StageName = objO.StageName;
        objO1.CloseDate =  objO.CloseDate;        
        objO1.Name = objO.Name;
        objCa1.Status = objCa.Status;
        objCa1.Origin = objCa.Origin;
        insert ObjC1;
        insert ObjCa1;
        insert ObjO1;
        return (new PageReference('/apex/AccOppCntCasInsertPage').setredirect(true)) ;
        
     }

}