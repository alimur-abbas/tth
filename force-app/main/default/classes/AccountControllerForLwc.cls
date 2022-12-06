public with sharing class AccountControllerForLwc {
    @AuraEnabled(cacheable=true)
    public static List<Account> accInfo(){
        List<Account> accList = [SELECT Id, Name, Phone, Website, Type, Industry, NumberOfEmployees, AnnualRevenue, BillingCity, BillingState, BillingCountry, BillingPostalCode, BillingStreet FROM Account limit 10];
        return accList;
    }
}
