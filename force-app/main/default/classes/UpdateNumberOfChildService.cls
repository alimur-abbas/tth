public with sharing class UpdateNumberOfChildService {
public static void updateNumberOfChild(Set<id> merchIds){
Map<id,Merchandaise__c> merchandises =new Map<id,Merchandaise__c>();
List<Merchandaise__c> merchList =[Select id,(select id from Line_Items__r) from Merchandaise__c where id in :merchIds];

for(Merchandaise__c merch :merchList ){
    merch.Number_of_Childs__c = merch.Line_Items__r.size();
    merchandises.put(merch.id,merch);
}
if(!merchandises.isEmpty()){
    update merchandises.values();
}
}
}