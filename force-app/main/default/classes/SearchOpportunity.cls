public with sharing class SearchOpportunity {
    @AuraEnabled
    public static List<opportunity> getOpps(String amount){
        List<opportunity> opps = [SELECT Id, Name, Amount FROM opportunity WHERE Amount =:Decimal.valueOf(amount)];
        return opps;
    }
}
