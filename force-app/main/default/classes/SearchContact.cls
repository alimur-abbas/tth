public with sharing class SearchContact {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(String searchKey) {
        String search = '%' + searchKey + '%';
        return [SELECT Id, Name, Email FROM Contact where Name like :search];
    }
}
