@istest
private class test_SalaryUpdates {
static testmethod void test_SalaryUpdates()
{
opportunity opp = new opportunity();
opp.name = 'testkiran';
opp.StageName = 'teststage';
opp.closedate =system.today();
insert opp;

opportunity opp2 = new opportunity();
opp2.Parent_Opportunity__c = opp.id;
opp2.name = 'testkiran';
opp2.StageName = 'teststage';
opp2.closedate = system.today();
opp2.salary__c = 123 ;
insert opp2;
update opp2;
delete opp2;
opportunity opp3 = new opportunity();
//opp2.Parent_Opportunity__c = opp.id;
opp3.name = 'testkiran';
opp3.StageName = 'teststage';
opp3.closedate = system.today();
opp3.salary__c = 123 ;
insert opp3;
update opp3;
delete opp3;
}


}