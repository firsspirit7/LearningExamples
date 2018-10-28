public without sharing class ValidationRuleJsonParsercls {
	public Integer size;	//2
	public Integer totalSize;	//2
	public boolean done;
	public QueryLocatorcls queryLocator;
	public String entityTypeName;	//ValidationFormula
	public Recordscls[] records;
	public class QueryLocatorcls {
	}
	public class Recordscls {
		public AttributesCls attributes;
		public String FullName;	//Account.Accountstatus
		public MetaDatacls Metadata;
		public String ValidationName;	//Accountstatus
		public String Id;	//03d90000000cd1dAAA
		public String LastModifiedDate;	//2015-01-25T02:42:42.000+0000
		public String TableEnumOrId;	//Account
	}
	public class AttributesCls {
		public String type;	//ValidationRule
		public String url;	///services/data/v30.0/tooling/sobjects/ValidationRule/03d90000000cd1dAAA
	}
	public class MetaDatacls {
		public Descriptioncls description;
		public String errorConditionFormula;	//AND(Text(Type)='Other', Text(Account_Status__c)='Visit')
		public ErrorDisplayFieldcls errorDisplayField;
		public String errorMessage;	//Account status should not be Visit
		public Urlscls urls;
		public boolean active;
	}
	public class Descriptioncls {
	}
	public class ErrorDisplayFieldcls {
	}
	public class Urlscls{
	}
}