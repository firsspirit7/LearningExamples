public with sharing class opportunitiesStylesClass {   
    public List<Opportunity> lstopp = new List<Opportunity>();
    public List<Opportunity> getGetOpp() {
        lstopp = [select id,Name,StageName,CloseDate from Opportunity];
        return lstopp;
    }   
}