global with sharing class ScheduleToRunBatchOfChildCount implements System.Schedulable {
    global void execute(SchedulableContext sc) {
        BatchToCountTheChild batch = new BatchToCountTheChild();
        Database.executeBatch(batch,5);
    }
}