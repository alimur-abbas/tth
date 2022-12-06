trigger ContactUpdateTrigger on Contact (After insert,After update,After delete ,After undelete) 
{
    switch on Trigger.OperationType {
      when AFTER_INSERT{
        ContactTriggerHandler.afterInsertHandler(Trigger.new);
          }
          when AFTER_UPDATE{
            ContactTriggerHandler.afterUpdateHandler(Trigger.new, Trigger.oldMap);
          }
          when AFTER_DELETE{
            ContactTriggerHandler.afterDeleteHandler(Trigger.old);
          }
          when AFTER_UNDELETE{
            ContactTriggerHandler.afterUndeleteHandler(Trigger.new);
          }
         
        }
        }