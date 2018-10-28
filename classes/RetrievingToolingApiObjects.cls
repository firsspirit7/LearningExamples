public without sharing class RetrievingToolingApiObjects {
	public static String queryValidationRules(String objectName){
		String salesforceHost = System.Url.getSalesforceBaseURL().toExternalForm();
		String containerID='Account';
		String url =  salesforceHost + '/services/data/v30.0/tooling/query/?q=Select+fullname+,metadata+,ValidationName+,Id+,LastModifiedDate+,TableEnumOrId+from+ValidationRule+where+TableEnumOrId=\'' + objectName +  '\'';
		HttpRequest req = new HttpRequest();		
		req.setMethod('GET');
		req.setEndpoint(url);
		req.setHeader('Content-type', 'application/json');
		req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
		Http http = new Http();		
		HTTPResponse res = http.send(req);
		System.debug(res.getBody());
		return res.getBody();
	}
	public static String queryWorkflowRules(String objectName){
		String salesforceHost = System.Url.getSalesforceBaseURL().toExternalForm();
		String containerID='Account';
		String url =  salesforceHost + '/services/data/v30.0/tooling/query/?q=Select+fullname+,metadata+,NamespacePrefix+,Id+,Name+,TableEnumOrId+from+WorkflowRule+where+TableEnumOrId=\'' + objectName +  '\'';
		HttpRequest req = new HttpRequest();		
		req.setMethod('GET');
		req.setEndpoint(url);
		req.setHeader('Content-type', 'application/json');
		req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
		Http http = new Http();		
		HTTPResponse res = http.send(req);
		System.debug(res.getBody());
		return res.getBody();
	}
	public static String queryFieldUpdates(String objectName){
		String salesforceHost = System.Url.getSalesforceBaseURL().toExternalForm();
		String containerID='Account';
		String url =  salesforceHost + '/services/data/v30.0/tooling/query/?q=Select+Id+,Name+,LookupValueId+,Metadata+,SourceTableEnumOrId+from+WorkflowFieldUpdate+where+SourceTableEnumOrId=\'' + objectName +  '\'';
		HttpRequest req = new HttpRequest();		
		req.setMethod('GET');
		req.setEndpoint(url);
		req.setHeader('Content-type', 'application/json');
		req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
		Http http = new Http();		
		HTTPResponse res = http.send(req);
		System.debug('Response:'+res.getBody());
		return res.getBody();
	}
	public static String queryEmailAlerts(String objectName){
		String salesforceHost = System.Url.getSalesforceBaseURL().toExternalForm();
		String containerID='Account';
		String url =  salesforceHost + '/services/data/v30.0/tooling/query/?q=Select+Id+,SenderType+,TemplateId+,CcEmails+,DeveloperName+from+WorkflowAlert+where+EntityDefinitionId=\'' + objectName +  '\'';
		HttpRequest req = new HttpRequest();		
		req.setMethod('GET');
		req.setEndpoint(url);
		req.setHeader('Content-type', 'application/json');
		req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
		Http http = new Http();		
		HTTPResponse res = http.send(req);
		System.debug(res.getBody());
		return res.getBody();
	}
	public static String queryTasks(String objectName){
		String salesforceHost = System.Url.getSalesforceBaseURL().toExternalForm();
		String containerID='Account';
		String url =  salesforceHost + '/services/data/v30.0/tooling/query/?q=Select+fullname+,metadata+,EntityDefinitionId+,Id+,Priority+,Status+,Subject+from+WorkflowTask+where+EntityDefinitionId=\'' + objectName +  '\'';
		HttpRequest req = new HttpRequest();		
		req.setMethod('GET');
		req.setEndpoint(url);
		req.setHeader('Content-type', 'application/json');
		req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
		Http http = new Http();		
		HTTPResponse res = http.send(req);
		System.debug(res.getBody());
		return res.getBody();
	}
	public static String queryOutboundMessages(String objectName){
		String salesforceHost = System.Url.getSalesforceBaseURL().toExternalForm();
		String containerID='Account';
		String url =  salesforceHost + '/services/data/v30.0/tooling/query/?q=Select+fullname+,metadata+,EntityDefinitionId+,Id+,NamespacePrefix+,IntegrationUserId+,Name+,ApiVersion+from+WorkflowOutboundMessage+where+EntityDefinitionId=\'' + objectName +  '\'';
		HttpRequest req = new HttpRequest();		
		req.setMethod('GET');
		req.setEndpoint(url);
		req.setHeader('Content-type', 'application/json');
		req.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionId());
		Http http = new Http();		
		HTTPResponse res = http.send(req);
		System.debug(res.getBody());
		return res.getBody();
	}
	
}