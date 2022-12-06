public with sharing class GettingAccountInfo {
   @AuraEnabled
   public static List<Contact> getContactInfo() {
      List<Contact> contacts = [SELECT Id,FirstName,LastName,Email,Phone FROM Contact];
      return contacts;
   }
}
