public with sharing class AccountInfoController {
    @AuraEnabled
    public static List<Account> getAccountInfo(){
       List<Account> acc = [SELECT Id, Name, Phone, AnnualRevenue, Website , Type, Rating, Show_Account__c  FROM Account ORDER BY LastModifiedDate desc LIMIT 10];
       return acc;
    }
}