trigger DeletingOpportunity on Opportunity (before delete) {
    Set<id> oppIds = new Set<id>();
    for(Opportunity opp:Trigger.old){
        oppIds.add(opp.Id);
    }
    List<Competitor__c> comList = [Select Id,Opportunity__c from Competitor__c where Opportunity__c in :oppIds];
    delete comList;
     
}