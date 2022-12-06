trigger UpdateNumberOfChild on Line_Item__c (after insert,after update, after delete) {
switch on Trigger.OperationType {
when AFTER_INSERT {
    UpdateNumberOfChildHandler.afterInsertHandler(Trigger.new);
}
when AFTER_UPDATE {
    UpdateNumberOfChildHandler.afterUpdateHandler(Trigger.new, Trigger.oldMap);
}
when AFTER_DELETE {
    UpdateNumberOfChildHandler.afterDeleteHandler(Trigger.old);
    
}      
}
}