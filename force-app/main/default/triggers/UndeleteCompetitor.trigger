trigger UndeleteCompetitor on Competitor__c (after undelete) {
    Set<id> comIds = new Set<id>();
    for(Competitor__c c : Trigger.new) {
        comIds.add(c.Id);
    }
    List<Competitor__c> coms= [select Id, Undeleted_Record__c from Competitor__c where Id in :comIds];
    for (Competitor__c com : coms) {
        if (com.Undeleted_Record__c != null) {
            com.Undeleted_Record__c = true;
           
        }
        
    }
    Update coms;

}