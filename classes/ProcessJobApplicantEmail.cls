global class ProcessJobApplicantEmail implements Messaging.InboundEmailHandler {
    
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email,
    Messaging.InboundEnvelope envelope) {
        list<contact> cntlst=[select email from contact where email=:email.fromAddress];
    
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();
        if(cntlst.size()>0){
            for(Contact ct:cntlst){
                    if (email.textAttachments != null && email.textAttachments.size() > 0) {
                        for (integer i = 0 ; i < email.textAttachments.size() ; i++) {
        Attachment attachment = new Attachment();
        // attach to the  created contact record with the same email
        attachment.ParentId = ct.Id;
        attachment.Name = email.textAttachments[i].filename;
        attachment.Body = blob.valueOf(email.textAttachments[i].body);
        insert attachment;
        }
        }
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
        for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
        Attachment attachment = new Attachment();
        // attach to the  created contact record with the same email
        attachment.ParentId = ct.Id;
        attachment.Name = email.binaryAttachments[i].filename;
        attachment.Body = email.binaryAttachments[i].body;
        insert attachment;
        }
        }
          Case objcase=new Case();
          objcase.contactid=ct.id;
          objcase.subject=email.subject;
          objcase.description=email.plainTextBody;
          objcase.status='New';
          objcase.origin='Email';
          objcase.SuppliedEmail=envelope.fromAddress;
          insert objcase;
          
        }
        }
    else{
        Contact contact = new Contact();
        contact.FirstName = email.fromname.substring(0,email.fromname.indexOf(' '));
        contact.LastName = email.fromname.substring(email.fromname.indexOf(' '));
        contact.Email = envelope.fromAddress;
        insert contact;
        Case objcase1=new Case();
          objcase1.contactid=contact.id;
          objcase1.subject=email.subject;
          objcase1.description=email.plainTextBody;
          objcase1.status='New';
          objcase1.origin='Email';
          objcase1.SuppliedEmail=envelope.fromAddress;
          insert objcase1;
        System.debug('====> Created contact '+contact.Id);
 
        if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
        for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
        Attachment attachment = new Attachment();
        // attach to the newly created contact record
        attachment.ParentId = contact.Id;
        attachment.Name = email.binaryAttachments[i].filename;
        attachment.Body = email.binaryAttachments[i].body;
        insert attachment;
        }
        }
        if (email.textAttachments != null && email.textAttachments.size() > 0) {
        for (integer i = 0 ; i < email.textAttachments.size() ; i++) {
        Attachment attachment = new Attachment();
        // attach to the newly created contact record
        attachment.ParentId = contact.Id;
        attachment.Name = email.textAttachments[i].filename;
        attachment.Body = blob.valueOf(email.textAttachments[i].body);
        insert attachment;
        }
        }
        }
        return result;
 
     }
 
}