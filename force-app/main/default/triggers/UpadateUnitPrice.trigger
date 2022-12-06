trigger UpadateUnitPrice on Merchandaise__c (After update) {
    List<Line_Item__c> listToBeUpdated = new List<Line_Item__c>();
    set<id> ids = new Set<id>();
    for(Merchandaise__c m : Trigger.new){
        if(m.Quantity__c != Trigger.oldMap.get(m.Id).Quantity__c && m.Quantity__c == 20){
            System.debug(1);
            ids.add(m.Id);
        }
    }
    for(Line_Item__c l : [select Id,  Unit_Price__c from Line_Item__c where Merchandaise__r.id in :ids]){
        System.debug(2);
        if(l.Unit_Price__c != null){
            l.Unit_Price__c = l.Unit_Price__c * 2;
            listToBeUpdated.add(l);
        }
       
    }
   System.debug('listToBeUpdated : '+listToBeUpdated);
    update listToBeUpdated;

}