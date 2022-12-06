/**
 * @description       : 
 * @author            : Mr. Md Alimur Rehman Abbas
 * @group             : 
 * @last modified on  : 11-15-2022
 * @last modified by  : ChangeMeIn@UserSettingsUnder.SFDoc
**/

trigger UpdateAccountPrimaryName on Contact (after insert,after update) {
    AccountPrimaryContactHandler obj = new AccountPrimaryContactHandler();
   
    if(Trigger.isUpdate&&AccountPrimaryContactHandler.flag ){
       // System.debug(1);
        Set<id> accIds = new Set<id>();
        // List<Contact> contacts = new List<Contact>();
        //       System.debug('trigger.new'+trigger.new);
        for(Contact c : Trigger.new){
            
        
            
            if( c.Primary_Contact__c!=trigger.oldMap.get(c.id).Primary_Contact__c){
               // System.debug(2);
                System.debug('contact on update ac name'+c.Account.Name);
                accIds.add(c.AccountId);
             }

            
        }
        
                obj.accountHandler(accIds);

        // List<Contact> conList =[Select id ,name ,Primary_Contact__c,AccountId, Account.Primary_Contact_Name__c from Contact where AccountId in :accIds];
        // List<Account> accounstToBeUpdated = new List<Account>();
        // List<Contact> contactToBeUpdated = new List<Contact>();
        // System.debug('trigger.newMap'+trigger.newMap);
        // for(Contact c : conList){
        //     if(c.Primary_Contact__c && trigger.newMap.containsKey(c.id)){

        //         System.debug('contact name'+c.Name);

        //         accounstToBeUpdated.add(new Account(id = c.AccountId,Primary_Contact_Name__c = c.Name));
        //        // contactToBeUpdated.add(new Contact(id = c.id,Primary_Contact__c = true));
        //      }
           
        //     if(!trigger.newMap.containsKey(c.id)){
                
        //         System.debug('contact in else name'+c.Name);
        //         contactToBeUpdated.add(new Contact(id = c.id,Primary_Contact__c=false));
        //     }
        // }
        // System.debug(contactToBeUpdated);
        // System.debug(accounstToBeUpdated);
        // isRunning=false;
        // update contactToBeUpdated;
        // update accounstToBeUpdated;
       
       
        }
        
    

    if (trigger.isInsert && AccountPrimaryContactHandler.flag) {
        //Static boolean isRunning = true;
        Set<id> accIds = new Set<id>();
        for(Contact c : Trigger.new ){
            if(c.Primary_Contact__c){
                accIds.add(c.AccountId);
            }
        }
        obj.accountHandler(accIds);
        // List<Contact> conList =[Select id ,name ,Primary_Contact__c,AccountId, Account.Primary_Contact_Name__c from Contact where AccountId in :accIds];
        // List<Account> accounstToBeUpdated = new List<Account>();
        // List<Contact> contactToBeUpdated = new List<Contact>();
        // for(Contact c : conList){
        //     if(c.Primary_Contact__c && trigger.newMap.containsKey(c.id)){
        //         accounstToBeUpdated.add(new Account(id = c.AccountId,Primary_Contact_Name__c = c.Name));
        //     }
        //     if(!trigger.newMap.containsKey(c.id)){
        //         contactToBeUpdated.add(new Contact(id = c.id,Primary_Contact__c=false));
        //     }
        // }
        // System.debug(contactToBeUpdated);
        // System.debug(accounstToBeUpdated);
        // //isRunning=false;
        // update accounstToBeUpdated;
        // update contactToBeUpdated;
       
    }
}