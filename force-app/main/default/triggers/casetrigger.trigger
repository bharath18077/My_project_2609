trigger casetrigger on Case (before insert , before update) 
{
    if(trigger.isbefore && (trigger.isinsert || trigger.isupdate))
    {
        for(case newcase : trigger.new)
        {
            if(newcase.type == null && newcase.type == '')
             newcase.type.adderror('enter the type');
            else if( newcase.accountId == null)
                newcase.AccountId.adderror('enter the accountid');
            else if(newcase.ContactId == null)
                newcase.ContactId.adderror('enter the contact id');
        }
           
    }

}