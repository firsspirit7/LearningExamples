public class fromJSON{
    public Integer size;    //1
    public Integer totalSize;   //1
    public boolean done;
    public cls_queryLocator queryLocator;
    public String entityTypeName;   //ValidationFormula
    public cls_records[] records;
    class cls_queryLocator {
    }
    class cls_records {
        public cls_attributes attributes;
        public String FullName; //Account.Phone
        public cls_Metadata Metadata;
    }
    class cls_attributes {
        public String type; //ValidationRule
        public String url;  ///services/data/v30.0/tooling/sobjects/ValidationRule/03d90000000cbj3AAA
    }
    class cls_Metadata {
        public cls_description description;
        public String errorConditionFormula;    //LEN(Phone)<10
        public cls_errorDisplayField errorDisplayField;
        public String errorMessage; //Phone number should not be less than 10 characters.
        public cls_urls urls;
        public boolean active;
    }
    class cls_description {
    }
    class cls_errorDisplayField {
    }
    class cls_urls {
    }
    public static fromJSON parse(String json){
        return (fromJSON) System.JSON.deserialize(json, fromJSON.class);
    }

   
}