public with sharing class CreateContactFromQuickAction {
    @AuraEnabled
    public static Id createContact(String firstName, String lastName, String email, String phone, String accountId) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
        newContact.Phone = phone;
        newContact.AccountId = accountId;
        System.debug('newContact: ' + newContact);
        insert newContact;
        System.debug('Contact created: ' + newContact.Id);
        return newContact.Id;
    }
}
