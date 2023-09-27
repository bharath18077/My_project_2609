trigger test2503 on Account (after update ) 
{
    if(trigger.isafter && trigger.isupdate)
    {
        list<contact> lstcontact = new list<contact>();
        for(account newacc : trigger.new)
        {
            account oldaccount  = trigger.oldmap.get(newacc.id);
            if(newacc.industry != oldaccount.industry)
            {
              
            
            list<contact> newcontact = [select id , lastname , firstname , phone from contact where accountid=: newacc.id];
            for(contact newcon : newcontact)
            {
                newcon.firstname = newacc.name;
                newcon.phone = newacc.phone ;
                lstcontact.add(newcon);
                
            }
            }
        }
        update lstcontact;
    }

}