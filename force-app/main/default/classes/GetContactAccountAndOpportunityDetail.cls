public with sharing class GetContactAccountAndOpportunityDetail {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList( Id id){
        List<Contact> conList= [Select id , Name from contact where AccountId =:id];
        System.debug('conList'+conList);
        return conList;

    }
}
