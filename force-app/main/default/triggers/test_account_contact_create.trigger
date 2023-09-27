trigger test_account_contact_create on Account (after insert , after update ) 
{
    if(trigger.isinsert && trigger.isafter){
    list<contact> lstcontact = new list<contact>();
    for(account newaccount : trigger.new)
    {
        contact newcontact = new contact();
        newcontact.lastname = newaccount.name;
        newcontact.phone = newaccount.phone;
        newcontact.fax = newaccount.fax;
        newcontact.accountid = newaccount.id;
        lstcontact.add(newcontact);
        
    }
    
    if(!lstcontact.isEmpty())
        insert lstcontact;
    }
    if(trigger.isafter && trigger.isupdate)
    {
        list<id> updateaccount = new list<id>();
        for(account naccount : trigger.new)
        {
            account oldaccount = trigger.oldmap.get(naccount.Id);
            if(oldaccount.Name != naccount.Name || oldaccount.Phone != naccount.Phone||oldaccount.Fax!=naccount.fax)
            {
                updateaccount.add(naccount.id);
                
            }
            if(!updateaccount.isempty())
            {
                list<contact> lstcont = [select id , lastname , firstname ,accountid from contact where accountid in:updateaccount];
                if(!lstcont.isempty())
                {
                    list<contact> contactrec = new list<contact>();
                    for(contact newcontact :lstcont)
                    {
                        account lstaccount = trigger.newmap.get(newcontact.AccountId);
                        newcontact.lastname = lstaccount.name ;
                         newcontact.phone = lstaccount.phone ;
                         newcontact.fax = lstaccount.fax ;
                        contactrec.add(newcontact);
                    }
                    update contactrec;
                        
                }
            }
        }
        
    }
    
    
}