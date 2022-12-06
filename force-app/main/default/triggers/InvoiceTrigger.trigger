trigger InvoiceTrigger on Invoice__c (before insert,before delete) {
    if(trigger.isInsert){
        for(Invoice__c inv :trigger.new){
            
            inv.Name__c=inv.Name__c+'Absyz';
        }
    }
    if(trigger.isDelete && trigger.isBefore){
        for(Invoice__c inv :trigger.old){
            // System.debug(trigger.old);
            if(inv.Status__c=='Closed'){
                inv.addError('Sorry you can\'t delete a Closed Invoice Record');
            }
        }
        
    }
    
    
}