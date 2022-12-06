trigger PreventDeleteOnAccount on Account (before delete) {
    Set<Id> accountIds = new Set<Id>();
    System.debug('old Trigger'+trigger.old);
    for(Account acc :Trigger.old){
       accountIds.add(acc.Id);
    }

    List<Account> accList = [SELECT Id,(Select id from Contacts) FROM Account WHERE Id IN :accountIds];
    for(Account acc :accList){
    // //    System.debug(1);
    // //     System.debug(acc.Contacts.size()>3);
    // //    System.debug(acc.Contacts.size());
       if(acc.Contacts.size()>3){
             Account actualRecord = Trigger.oldMap.get(acc.Id);
    //         //add Error can be added to the records in the trigger context
           actualRecord.addError('Cannot delete account with more than 3 contacts');
        }
    }

}