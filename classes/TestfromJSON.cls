@isTest
private class TestfromJSON{
 static testMethod void testParse() {
        String json=        '{'+
        '    "size": 1,'+
        '    "totalSize": 1,'+
        '    "done": true,'+
        '    "queryLocator": null,'+
        '    "entityTypeName": "ValidationFormula",'+
        '    "records": ['+
        '        {'+
        '            "attributes": {'+
        '                "type": "ValidationRule",'+
        '                "url": "/services/data/v30.0/tooling/sobjects/ValidationRule/03d90000000cbj3AAA"'+
        '            },'+
        '            "FullName": "Account.Phone",'+
        '            "Metadata": {'+
        '                "description": null,'+
        '                "errorConditionFormula": "LEN(Phone)<10",'+
        '                "errorDisplayField": null,'+
        '                "errorMessage": "Phone number should not be less than 10 characters.",'+
        '                "urls": null,'+
        '                "active": true'+
        '            }'+
        '        }'+
        '    ]'+
        '}';
        fromJSON obj = fromJSON.parse(json);
        System.assert(obj != null);
    }


}