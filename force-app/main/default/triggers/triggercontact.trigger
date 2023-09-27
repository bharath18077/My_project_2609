trigger triggercontact on Contact (before insert) 
{
    if(trigger.isbefore && trigger.isinsert)
    {
        for(contact newcon : trigger.new)
        {
            if(newcon.email == null || newcon.email == ' ')
            {
                newcon.adderror('you cannot delete the contact if the email value is not null');
            }
        }
    }

}