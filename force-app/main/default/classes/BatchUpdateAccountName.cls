global with sharing class BatchUpdateAccountName implements Database.Batchable <SObject>{

    global  Database.QueryLocator start(Database.BatchableContext bc) {
        String query ='SELECT Id, Name FROM Account';
       return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        for(Account a : scope){
            a.Name = 'Absyz'+a.Name;
        }
        update scope;
    }
    global void finish(Database.BatchableContext bc) {
        System.debug('Batch completed');
    }
}