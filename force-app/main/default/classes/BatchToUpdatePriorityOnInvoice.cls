global with sharing class BatchToUpdatePriorityOnInvoice implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, Priority__c FROM Invoice__c ');
    }
    global void execute(Database.BatchableContext bc, List<Invoice__c> scope) {
        List<Invoice__c> invoices = new List<Invoice__c>();
        for (Invoice__c s : scope) {
            if(s.Invoice_Total__c<=10000){
                s.Priority__c = 'Low';
            }
            else if(s.Invoice_Total__c>10000 && s.Invoice_Total__c<=50000){
                s.Priority__c = 'Medium';
            }
            else if(s.Invoice_Total__c>50000){
                s.Priority__c = 'High';
            }
            invoices.add(s);
            
        }
        update invoices;
    }
    global void finish(Database.BatchableContext bc) {
        System.debug('Batch job completed');
    }

}