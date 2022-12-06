public with sharing class MerchandaiseTriggerHandler {
    public static void sendEmailNotification(List<Merchandaise__c> merchandiseList) {
        List<Messaging.Email> emailList = new List<Messaging.Email>();
        for (Merchandaise__c merchandise : merchandiseList) {
            if(merchandise.Email__c!=null)
            {Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            String[] toAddresses = new String[] { merchandise.Email__c };
            email.setToAddresses(toAddresses);
            email.setSubject('Welcome to the Merchandise Group');
            String body = 'Hi ' + merchandise.Name + ',<br/><br/>' + 'Welcome to the Merchandise Group. We are glad to have you on board. <br/><br/>' + 'Regards,<br/>' + 'Merchandise Team';
           email.setHtmlBody(body);
            email.setSenderDisplayName(merchandise.owner.name);
            emailList.add(email);
            }
        }
        Messaging.sendEmail(emailList);
    }
}