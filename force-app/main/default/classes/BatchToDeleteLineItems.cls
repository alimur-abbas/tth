global with sharing class BatchToDeleteLineItems implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id ,(select id from Line_Items__r) from Merchandaise__c');
    }
    global void execute(Database.BatchableContext bc, List<Merchandaise__c> scope) {
        List<Line_Item__c> lineItems = new List<Line_Item__c>();
        for(Merchandaise__c m : scope) {
            lineItems.addAll(m.Line_Items__r);
        }
        delete lineItems;
    }
    global void finish(Database.BatchableContext bc) {
        System.debug('Finished');
    }
   
}