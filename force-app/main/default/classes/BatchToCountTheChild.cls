global with sharing class BatchToCountTheChild implements Database.Batchable<SObject> {
    
        global Database.QueryLocator start(Database.BatchableContext bc) {
    
            return Database.getQueryLocator('SELECT Id, Name, Number_of_Childs__c,(SELECT Id, Name FROM Contacts) FROM Account');
    
        }
    
        global void execute(Database.BatchableContext bc, List<Account> scope) {
    
            for (Account s : scope) {
    
                s.Number_of_Childs__c = s.Contacts.size();
    
                System.debug('Parent: ' + s.Name + ' has ' + s.Number_of_Childs__c + ' children');
    
            }
            update scope;
    
        }
    
        global void finish(Database.BatchableContext bc) {
            System.debug('Finished');
    
        }
    
    
}