trigger new1003 on Account ( after update) 
{
     if(trigger.isafter && trigger.isupdate)
    {
        list<id> updateaccount = new list<id>();
        for(account newaccount : trigger.new)
        {
            account acc = trigger.oldmap.get(newaccount.id);
            if(acc.email_id__c != newaccount.email_id__c)
            {
               updateaccount.add(acc.id);
                
            }
            
            
        }
        if(!updateaccount.isempty())
        {
            list<contact> lstcon = [select id , lastname , firstname , phone , accountid from contact where
                                   accountid in:updateaccount];
            if(!lstcon.isempty())
            {
                list<contact> updatecontact = new list<contact>();
                for(contact newcon : lstcon)
                {
                account acc1 = trigger.newmap.get(newcon.AccountId);
                
                newcon.Email= acc1.email_id__c;
               
                updatecontact.add(newcon);
                }
                update updatecontact;
            }
            
          
            
        
    }

    }
}