public with sharing class GameResultController {
    @AuraEnabled
    public static List<Word_Shuffle__c> getGameResults() {
        id id = UserInfo.getUserId();
        List<Word_Shuffle__c> gameResults = [SELECT Name,Mode__c,CreatedDate,Result__c FROM Word_Shuffle__c 
        WHERE CreatedById = :id ORDER BY CreatedDate DESC ];
        return gameResults;
    }
}