trigger accounttrigger27 on Account (before delete) 
{
    if(trigger.isbefore && trigger.isdelete)
    {
        for(account acc : trigger.new)
        {
            if(acc.active__c == 'yes')
             acc.adderror('you cannot delete the record');
            
        }
    }

}