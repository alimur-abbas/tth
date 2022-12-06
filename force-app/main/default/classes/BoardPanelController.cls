public with sharing class BoardPanelController {
   @AuraEnabled
   public static void addResult(String mode,String result) {
      Word_Shuffle__c gameResult = new Word_Shuffle__c(Mode__c=mode,Result__c=result);
      insert gameResult;
      
    
   }
}