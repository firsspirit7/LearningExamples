public class Accountsavecls1{

    public Account actobj{get;set;}
    public string filename123{get;set;}
    public blob filebody123{get;set;}
        
    public Accountsavecls1(){
        actobj=new Account();
    }
    

    public pagereference save123(){
        insert actobj;
        //return new pagereference('/'+actobj.id);
        Attachment attobj=new Attachment();
        attobj.name=filename123;
        attobj.body=filebody123;
        attobj.parentid=actobj.id;
        insert attobj;              
        
        pagereference pg=new pagereference('/'+actobj.id);
        return pg;
    }

}