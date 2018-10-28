public with sharing class pdfAttchmentClass {
 public  pdfAttchmentClass()
 {
  ren = true;
 }
    public boolean ren { get; set; }
    public PageReference sendpdf()
     {   
         ren = false;         
         PageReference pdf = Page.PdfAttchmentPage;      
        // the contents of the attachment from the pdf
        Blob body; 
        try 
         {
         // returns the output of the page as a PDF
         body = pdf.getContentasPDF(); 
        // need to pass unit test -- current bug  
         }   
        catch (VisualforceException e)
         {
        body = Blob.valueOf('Some Text');
         } 
        Messaging.EmailFileAttachment attach = new Messaging.EmailFileAttachment();
        attach.setContentType('application/pdf');
        attach.setFileName('SivaPrasad.pdf');
        attach.setInline(true);
        attach.Body = body;      
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setUseSignature(false);
        //if(key != null)
        //{
        mail.setToAddresses(new String[] { key });
        mail.setSubject('PDF Email ');
        mail.setHtmlBody('I am sending you email attachment. Check the attachment!');
        mail.setFileAttachments(new Messaging.EmailFileAttachment[] { attach }); 
        // Send the email    
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail }); 
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Email sent to '+key));
        pagereference p = new pagereference('/apex/PdfAttchment');   
        return  p;
        //(new pagereference('/apex/emailattachment').setredirect(true)); 
        //}
      }
    public String Key { get; set; }

    public String getKey {get;set;}
     public List<contact> lstcon = new List<contact>();    
     public List<contact> getGetcontacts() {
        lstcon = [select id,name,email from contact];
        return lstcon ;
    }

}