public with sharing class AccountPrimaryContactHandler {
    public Static boolean flag =true;
    public AccountPrimaryContactHandler() {

    }
    public  void accountHandler(Set<id> accIds) {
        List<Contact> conList =[Select id ,name ,Primary_Contact__c,AccountId, Account.Primary_Contact_Name__c from Contact where AccountId in :accIds];
        List<Account> accounstToBeUpdated = new List<Account>();
        List<Contact> contactToBeUpdated = new List<Contact>();
        for(Contact c : conList){
            if(c.Primary_Contact__c && trigger.newMap.containsKey(c.id)){
                accounstToBeUpdated.add(new Account(id = c.AccountId,Primary_Contact_Name__c = c.Name));
            }
            if(!trigger.newMap.containsKey(c.id)){
                contactToBeUpdated.add(new Contact(id = c.id,Primary_Contact__c=false));
            }
        }
        System.debug(contactToBeUpdated);
        System.debug(accounstToBeUpdated);
        flag=false;
        update accounstToBeUpdated;
        update contactToBeUpdated;
    }
}