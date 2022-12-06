trigger BatchTrigger on Batch__c (before insert) {
// List<Batch__c> batches = new List<Batch__c>();
Map<String,id> accountMap = new Map<String,id>();
//list<String> companyName =new List<String>();
// System.debug(Trigger.newMap);before insert we can't use Trigger.newMap as we don't have id.
Set<String> companyNames = new Set<String>();
for(Batch__c batch : Trigger.new){
    companyNames.add(batch.Company_Name__c);
}
for(Account acc : [select Name from Account Where Name in :companyNames]){
    accountMap.put(acc.Name,acc.Id);
    
}
// for (Batch__c batch : Trigger.new) {
//     companyName.add(batch.Company_Name__c);
// }
for (Batch__c batch : Trigger.new) {
    batch.Account__c = accountMap.get(batch.Company_Name__c);
}

}