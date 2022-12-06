global with sharing class ScheduleToDeleteLineItems implements System.Schedulable {
    global void execute(SchedulableContext sc) {
        BatchToDeleteLineItems batch = new BatchToDeleteLineItems();
        Database.executeBatch(batch);
    }
}