trigger acttrigger on Account(after insert){   

    /*Account actobj=trigger.new[0];//trigger.new[0] holds newly inserted record
    actobj.type='Customer Channel';*/
    //List<Account> lstacc=trigger.new;//here trigger.new is a list which can hold collection newly inserted records
   //normal for loop
    /*for(integer i=0;i<lstacc.size();i++){
        lstacc[i].type='Customer channel';

    }   */
    //Enhanced for loop
   /* for(Account actobj:lstacc){
        actobj.type='Customer Channel';
    }*/
    List<Account> lstaccount=new List<Account>();
    for(Account actobj:trigger.new){
        Account acc=new Account(id=actobj.id);
        acc.type='Customer Channel';    
        lstaccount.add(acc);
    }
    if(lstaccount!=null && lstaccount.size()>0)
            update lstaccount;
}