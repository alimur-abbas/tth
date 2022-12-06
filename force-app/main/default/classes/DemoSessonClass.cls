public with sharing class DemoSessonClass {
   @AuraEnabled(cacheable=true)
   public static List<Contact> getContacts(){
        return [select id, Name ,Email from Contact limit 10];
     }
}
