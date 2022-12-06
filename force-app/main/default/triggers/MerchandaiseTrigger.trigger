trigger MerchandaiseTrigger on Merchandaise__c (after insert) {
    MerchandaiseTriggerHandler.sendEmailNotification(Trigger.new);
    Set<Id> merchandaiseIds = new Set<Id>();
    for(Merchandaise__c merch : Trigger.new) {
        merchandaiseIds.add(merch.Id);
    }
    if(merchandaiseIds.size() > 0) {
       Database.executeBatch(new MerchandaiseTriggerBatch(merchandaiseIds));
    }
}