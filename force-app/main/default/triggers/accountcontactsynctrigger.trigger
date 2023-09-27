trigger accountcontactsynctrigger on Account (after insert , after update) 
{
    if(trigger.isafter && trigger.isinsert)
    {
        list<contact> latestcontact = new list<contact>();
        for(account accrecord : trigger.new)
        {
            contact newcontact = new contact ();
            newcontact.lastname = accrecord.name;
            newcontact.Phone = accrecord.phone;
            newcontact.AccountId = accrecord.Id;
            newcontact.Email = accrecord.email_id__c;
            latestcontact.add(newcontact);
            
        }
        if(!latestcontact.isempty())
            insert latestcontact;
    }
    if(trigger.isafter && trigger.isupdate)
    { 
        list<id> updateaccount = new list<id>();
        for(account newaccount : trigger.new)
        {
            account acc = trigger.oldmap.get(newaccount.id);
            if(acc.Name != newaccount.name || acc.Phone != newaccount.Phone ||
              acc.email_id__c != newaccount.email_id__c)
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
                newcon.LastName = acc1.name;
                newcon.Email= acc1.email_id__c;
                newcon.Phone = acc1.Phone;
                updatecontact.add(newcon);
                }
                update updatecontact;
            }
            
          
            
        
    }

    }
}