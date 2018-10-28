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
private class TestJsonCtrl {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
    }
    static testMethod void testParseWorkflowRule() {
		String json=		'{'+
		'    "size": 1,'+
		'    "totalSize": 1,'+
		'    "done": true,'+
		'    "queryLocator": null,'+
		'    "entityTypeName": "WorkflowRule",'+
		'    "records": ['+
		'        {'+
		'            "attributes": {'+
		'                "type": "WorkflowRule",'+
		'                "url": "/services/data/v30.0/tooling/sobjects/WorkflowRule/01Q90000000og6IEAQ"'+
		'            },'+
		'            "FullName": "Account.AccountWorkflow",'+
		'            "Metadata": {'+
		'                "actions": ['+
		'                    {'+
		'                        "name": "Account_Status_Update",'+
		'                        "type": "FieldUpdate"'+
		'                    }'+
		'                ],'+
		'                "booleanFilter": null,'+
		'                "criteriaItems": [],'+
		'                "formula": "true",'+
		'                "urls": null,'+
		'                "workflowTimeTriggers": [],'+
		'                "active": true,'+
		'                "description": null,'+
		'                "triggerType": "onCreateOnly"'+
		'            },'+
		'            "NamespacePrefix": null,'+
		'            "Id": "01Q90000000og6IEAQ",'+
		'            "Name": "AccountWorkflow",'+
		'            "TableEnumOrId": "Account"'+
		'        }'+
		'    ]'+
		'}';
		
	}
}