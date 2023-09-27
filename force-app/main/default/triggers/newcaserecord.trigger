trigger newcaserecord on Case (before insert , before update) 
{
    if((trigger.isinsert || trigger.isupdate) && trigger.isbefore)
    {
        for (case newcase : trigger.new)
        {
            if (newcase.AccountId == null)
                newcase.adderror('relate the accoun record');
            if(newcase.ContactId == null)
                newcase.adderror('relate the contact record');
        }
    }
}