@isTest
private class testopportunityStageCountClass 
  {
     static testmethod void testopportunityStageCountClass ()
     
        {            
            Opportunity o = new Opportunity ();
            o.Name = 'Test Opportunity ';
            o.CloseDate = Date.ValueOf('2012-05-05');
            o.StageName  = 'Prospecting';
            insert o;                                    
            opportunityStageCountClass  oScunt = new opportunityStageCountClass ();
                     
        }
  }