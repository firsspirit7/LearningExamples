<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>HappyBirthday</fullName>
        <description>HappyBirthday</description>
        <protected>false</protected>
        <recipients>
            <recipient>training@training.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Test</template>
    </alerts>
    <fieldUpdates>
        <fullName>Account_Status_Update</fullName>
        <field>Account_Status__c</field>
        <literalValue>Dont Visit</literalValue>
        <name>Account_Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>AccountWorkflow</fullName>
        <actions>
            <name>HappyBirthday</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Account_Status_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>And(ISPICKVAL(Type,&apos;Other&apos;))</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Test Workflow</fullName>
        <active>true</active>
        <criteriaItems>
            <field>Account.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
