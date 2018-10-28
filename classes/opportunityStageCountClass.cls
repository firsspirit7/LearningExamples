public with sharing class opportunityStageCountClass 
 {
    public class oppWrap
    {
      public string Sname{get;set;}
      public integer cnt{get;set;}
    }
    public List<oppWrap> count{get;set;}    
    oppWrap oppobj;
    public opportunityStageCountClass ()
     {
        count = new List<oppWrap>();             
        List<AggregateResult> lst = [SELECT StageName sn, COUNT(Name) cnt FROM Opportunity GROUP BY ROLLUP(StageName)];
        for(AggregateResult ar : lst)
        {            
          oppobj = new oppWrap();                      
          oppobj.Sname = string.valueOf(ar.get('sn'));
          oppobj.cnt = integer.valueOf(ar.get('cnt'));
          count.add(oppobj);
        }        
    }
 }