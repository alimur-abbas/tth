public with sharing class AccountContactService {
   public static void updateActiveContacts(Set<Id> accountIds){
    List<Account> accountList = new List<Account>();
    for(AggregateResult ar : [SELECT AccountId, Count(id) FROM Contact 
            WHERE Active__c = true AND AccountId In:accountIds GROUP BY AccountId]){
                String accId = String.valueOf(ar.get('AccountId'));
          
              Account acc = new Account(Id=accId,Active_Contacts__c=(Decimal)ar.get('expr0'));
              accountList.add(acc);
            }
            for(Id iteraterId:accountIds){
                if(!accountList.contains(new Account(Id=iteraterId))){
                    Account acc = new Account(Id=iteraterId,Active_Contacts__c=0);
                    accountList.add(acc);
                }
            }
            update accountList;
   }//Select AccountId,(SELECT Count(Id) FROM Contacts WHERE Active__c = true) FROM Account WHERE Id IN :accountIds
}