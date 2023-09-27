trigger accountcontact0207 on Account ( after update) 
{
    if(trigger.isafter && trigger.isupdate)
    {
        set<id> newid = new set<id>();
        for(account acc : trigger.new)
        {
            
           account accold = trigger.oldmap.get(acc.id);
            if(acc.BillingStreet != accold.BillingStreet )
            {
                newid.add(acc.id);
            }
            
        }
        list<account> accountswithcon = [select id , name , billingstreet , billingcity ,billingcountry  , (select id , lastname from contacts ) 
                                         from account where ID IN: newid];
        list<contact> lstcon = new list<contact>();
        for(account accnt : accountswithcon)
        {
            list<contact> conlist = accnt.contacts;
            for(contact newcon : conlist)
            {
                newcon.mailingstreet = accnt.billingstreet;
                newcon.mailingcity = accnt.billingcity;
                newcon.mailingcountry = accnt.billingcountry;
                lstcon.add(newcon);
                
            }
            
        }
        update lstcon;
    }
    

}