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
private class Testonaccountsavecls {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        Account actobj1=new Account();
        actobj1.name='balaji';
        actobj1.type='Other';
        actobj1.industry='Engineering';
        Accountsavecls1 accsaveobj=new Accountsavecls1();
        accsaveobj.actobj=actobj1; 
        accsaveobj.filename123='Test';
        accsaveobj.filebody123=Blob.valueof('Hi this is balaji');
        accsaveobj.save123();      
    }
}