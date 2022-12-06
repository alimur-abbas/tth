public with sharing class MerchandaiseTriggerBatch implements Database.Batchable<SObject> {
Set<Id> merchandaiseList = new Set<Id>();
public MerchandaiseTriggerBatch(Set<id> merchandaiseList) {
    this.merchandaiseList = merchandaiseList;
}
public Database.QueryLocator start(Database.BatchableContext bc) {
    return Database.getQueryLocator('SELECT Id, Name, Price__c, Email__c FROM Merchandaise__c WHERE id IN :merchandaiseList');

}
public void execute(Database.BatchableContext bc, List<Merchandaise__c> scope) {
    for(Merchandaise__c m : scope) {
    Messaging.SingleEmailMessage email=new Messaging.SingleEmailMessage();
    email.setToAddresses(new string[] {m.Email__c});
    email.setSubject('Welcome Mail');
    email.setPlainTextBody('Welcome Your Contact Is Created Successfully In Salesforce');
    Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
    }
    }
public void finish(Database.BatchableContext bc) {
    System.debug('Email Sent Successfully');
}
}