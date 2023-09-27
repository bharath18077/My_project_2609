trigger caseobjectassociations on Case (before insert ,before update) 
{
    if (trigger.isbefore && (trigger.isinsert || trigger.isupdate))
    {
        for(case ldcase : trigger.new)
        {
            if(ldcase.AccountId == null )
             ldcase.accountid.adderror('enter the related account record');
            if(ldcase.contactid == null  )
                ldcase.contactid.adderror('enter the contact record id');
        }
    }

}