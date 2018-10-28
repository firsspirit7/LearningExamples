trigger acttrigger1 on Account(before insert,after insert){

    if(trigger.isinsert && trigger.isafter){
        List<Contact> lstcont=new List<Contact>();
    
        for(Account actobj:trigger.new){
            Contact contobj=new Contact();
            contobj.lastname=actobj.name;
            contobj.accountid=actobj.id;        
            lstcont.add(contobj);
        }
        if(lstcont!=null && lstcont.size()>0)
            insert lstcont;
    }
        if(trigger.isinsert && trigger.isbefore){
            for(Account actobj:trigger.new){
            actobj.industry='Engineering';
    
            }

        }


}