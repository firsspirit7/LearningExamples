<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Set_Status_to_Won</fullName>
        <field>Status__c</field>
        <literalValue>Lost</literalValue>
        <name>Set Status to &apos;Won&apos;</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Status_Won</fullName>
        <field>Status__c</field>
        <literalValue>Won</literalValue>
        <name>Update Status Won</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Set Status to %27Lost%27</fullName>
        <actions>
            <name>Set_Status_to_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Challenge_Participant__c.Place__c</field>
            <operation>notEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Challenge_Participant__c.Place__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Updates the status to &apos;Lost&apos; if place is not 1 or blank</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set Status to %27Won%27</fullName>
        <actions>
            <name>Update_Status_Won</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Challenge_Participant__c.Place__c</field>
            <operation>equals</operation>
            <value>1</value>
        </criteriaItems>
        <description>Updates the status to &apos;Won&apos; if place is 1</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
