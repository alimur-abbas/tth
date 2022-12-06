public with sharing class ContactTriggerHandler {
    public  static void afterInsertHandler(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        for(Contact con : newContacts){
          if(con.AccountId != null){
            accountIds.add(con.AccountId);
          }
        }
            // List<AggregatedResult> query = [SELECT AccountId, Count(id) FROM Contact 
            //         WHERE Active__c = true AND AccountId=:con.AccountId GROUP BY AccountId];
            AccountContactService.updateActiveContacts(accountIds);
    }
        
    
    public  static void afterUpdateHandler(List<Contact> newContacts, Map<id,Contact> oldContacts) {
        Set<Id> accountIds = new Set<Id>();
       
        for(Contact con : newContacts){
          if(con.AccountId != null && con.Active__c != oldContacts.get(con.Id).Active__c){
            accountIds.add(con.AccountId);
          }
          else if(con.AccountId!=oldContacts.get(con.Id).AccountId){
            accountIds.add(con.AccountId);
            accountIds.add(oldContacts.get(con.Id).AccountId);
          }
        }
            // List<AggregatedResult> query = [SELECT AccountId, Count(id) FROM Contact 
            //         WHERE Active__c = true AND AccountId=:con.AccountId GROUP BY AccountId];
            AccountContactService.updateActiveContacts(accountIds);
    }
    public static void afterDeleteHandler(List<Contact> oldContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        for(Contact con : oldContacts){
          if(con.AccountId != null){
            accountIds.add(con.AccountId);
          }
        }
            // List<AggregatedResult> query = [SELECT AccountId, Count(id) FROM Contact 
            //         WHERE Active__c = true AND AccountId=:con.AccountId GROUP BY AccountId];
            AccountContactService.updateActiveContacts(accountIds);
    }
    public static void afterUndeleteHandler(List<Contact> newContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        for(Contact con : newContacts){
          if(con.AccountId != null){
            accountIds.add(con.AccountId);
          }
        }
            // List<AggregatedResult> query = [SELECT AccountId, Count(id) FROM Contact 
            //         WHERE Active__c = true AND AccountId=:con.AccountId GROUP BY AccountId];
            AccountContactService.updateActiveContacts(accountIds);
    }
            
    }