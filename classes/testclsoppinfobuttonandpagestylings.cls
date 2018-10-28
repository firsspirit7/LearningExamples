/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class testclsoppinfobuttonandpagestylings {

    static testMethod void myUnitTest() {
        Account acc=new Account();
        acc.name='Deepthi home Applainces';
        
        
        acc.type='Prospect';
        acc.industry='Healthcare';
        acc.website='www.deepthi.com';
        acc.phone='9493697742';
        insert acc;
        
        contact cnt=new contact();
        cnt.lastname='deepika.s';
        cnt.email='s.deepika@yahoo.com';
        cnt.LeadSource='Web';
        insert cnt;
            
        opportunity opp=new opportunity();
        opp.accountid=acc.id;
        opp.Name='deepthi home appliances';
        opp.ForecastCategoryName='Pipeline';
        opp.CloseDate=system.today();
        opp.StageName='Prospecting';
        opp.amount=1000;
        insert opp;
        
        opportunitycontactrole oppcrole=new opportunitycontactrole();
        oppcrole.contactid=cnt.id;
        oppcrole.opportunityid=opp.id;
        oppcrole.isprimary=true;
        oppcrole.Role='Decision Maker';
        insert oppcrole;
        
        product2 pro=new product2();
        pro.name='plasma Tvs';
        pro.ProductCode='555';
        pro.IsActive=true;
        insert pro;
        
        List<Pricebook2> lstprice = new List<Pricebook2>();
        lstprice = [select id , IsStandard from Pricebook2 where IsStandard= true];
        
        
        Pricebookentry pbe=new Pricebookentry();
        pbe.product2id=pro.id;
      
        pbe.pricebook2id=lstprice[0].id;
        pbe.isactive=true;
        pbe.UnitPrice =5000;        
        
        insert pbe;
        
        opportunitylineitem opplt=new opportunitylineitem();
        opplt.pricebookentryid=pbe.id;
        opplt.opportunityid=opp.id;
        opplt.TotalPrice=5000; 
      
        opplt.Quantity=12;
        insert opplt;
        
        Apexpages.currentPage().getParameters().put('id',opp.id);
        oppinfobuttonandpagestylings  obj=new oppinfobuttonandpagestylings();
        oppltpopupcls obj1=new oppltpopupcls();
        obj1.saveopplt();
        obj.edit();
        obj.save();
        obj.saveacc();
        obj.newopp();
        
    }
    
}