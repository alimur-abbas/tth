public with sharing class UpdateNumberOfChildHandler {
public static void afterInsertHandler(List<Line_Item__c> lineItems){
Set<id> merchIds = new Set<id>();
        for(Line_Item__c lineItem :lineItems){
            if(lineItem.Merchandaise__c != null){           
                merchIds.add(lineItem.Merchandaise__c);
            }
        }
        UpdateNumberOfChildService.updateNumberOfChild(merchIds);
        
}
public static void afterUpdateHandler(List<Line_Item__c> lineItems,Map<id,Line_Item__c> oldLineItems){
Set<id> merchIds = new Set<id>();
        for(Line_Item__c lineItem :lineItems){
            if(lineItem.Merchandaise__c != null && lineItem.Merchandaise__c != oldLineItems.get(lineItem.id).Merchandaise__c){             
                merchIds.add(lineItem.Merchandaise__c);
                merchIds.add(oldLineItems.get(lineItem.id).Merchandaise__c);
             }
 
        }
        UpdateNumberOfChildService.updateNumberOfChild(merchIds);
        
}
public static void afterDeleteHandler(List<Line_Item__c> lineItems){
Set<id> merchIds = new Set<id>();
        for(Line_Item__c lineItem :lineItems){
            if(lineItem.Merchandaise__c != null){
                merchIds.add(lineItem.Merchandaise__c);
            }
        }
        UpdateNumberOfChildService.updateNumberOfChild(merchIds);
        
}
}