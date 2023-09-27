trigger deletehiringmanager on hiring_manager__c (before delete) 
{ 
    if(trigger.isbefore && trigger.isdelete)
    {
        for(hiring_manager__c delhr : trigger.new)
        {
            if(delhr.current_ctc__c != null )
                delhr.current_ctc__c.adderror('record cannot be deleted');
        }
    }

}