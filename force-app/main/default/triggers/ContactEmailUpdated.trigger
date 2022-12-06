trigger ContactEmailUpdated on Contact (before insert, before update) {
    if(trigger.isBefore && trigger.isInsert) {
        Set<id> ids = new Set<id>();
        for(Contact c : trigger.new) {
            ids.add(c.AccountId);
        }
        Map<Id,String> idAndEmail = new Map<Id,String>();
        for(Account a : [select Id, Email__c,Name from Account where Id in :ids]) {
            idAndEmail.put(a.Id, a.Email__c);
        }
           for(Contact con:Trigger.new){
                
                     con.Email = idAndEmail.get(con.AccountId);
                }
           }
        }
    


//we can also use a Map to store the AccountId and Email__c and then use the map to update the Contact Email 
//instead of using nested loop(This is the Best Pratice Should follow this).