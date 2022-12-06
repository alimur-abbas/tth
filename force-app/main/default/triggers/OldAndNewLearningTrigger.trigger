/**
 * @description       : 
 * @author            : Mr Md Alimur Rehman Abbas
 * @group             : 
 * @last modified on  : 11-15-2022
 * @last modified by  : Mr Md Alimur Rehman Abbas
**/

trigger OldAndNewLearningTrigger on Contact (before update, after update, before insert, after insert) 
{
    if (Trigger.isBefore) {
        System.debug('********Trigger values***********');
        System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
    }
    
    if (Trigger.isAfter) {
        System.debug('********Trigger values***********');    
        System.debug('***SFDC: Trigger.old is: ' + Trigger.old);
        System.debug('***SFDC: Trigger.new is: ' + Trigger.new);
        
    }
}