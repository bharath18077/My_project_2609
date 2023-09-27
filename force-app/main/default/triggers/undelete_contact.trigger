trigger undelete_contact on Account (before delete) 
{
    
    for(account newaccount : trigger.old)
    {
        list<contact> lstcontact =[select id , firstname , lastname ,accountid from contact where accountid =: newaccount.id ];
        for(contact newcontact : lstcontact)
        {
            newcontact.accountid = null;
        }
        update lstcontact;
    }

}