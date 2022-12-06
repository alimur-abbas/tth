global with sharing class ScheduleBatchAccount implements System.Schedulable {

     global void execute(SchedulableContext sc) {
        BatchUpdateAccountName batch = new BatchUpdateAccountName();
        Database.executeBatch(batch);
    }
}