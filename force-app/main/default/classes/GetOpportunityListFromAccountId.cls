public without sharing class GetOpportunityListFromAccountId {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOppList(Id accountId) {
        List<Opportunity> opportunityList = [SELECT Id, Name FROM Opportunity WHERE AccountId = :accountId];
        System.debug('opportunityList: ' + opportunityList);
        return opportunityList;
    }
}
