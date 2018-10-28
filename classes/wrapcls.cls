public with sharing class wrapcls {

    public List<wrapper> items { get; set; }

    public class wrapper{
        
        public string name{get; set;}
        public integer sal{get; set;}
        
        public wrapper(string s, integer salary){
            name=s;
            sal=salary;
        }
    
    }
    
    public wrapcls(){
        items  = new List<wrapper>();
        items.add(new wrapper('ShivaPrasad',12000));
        items.add(new wrapper('KiranKumar',13000));
        items.add(new wrapper('SreeRam',16000));
        items.add(new wrapper('Balaji',15000));
    }
    
}