trigger accountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {

    if(trigger.isBefore && trigger.isUpdate){
        accountHandler.updateAccounts(trigger.new, trigger.oldMap);
        accountHandler.validateIndustry(trigger.new);
    }
    
}