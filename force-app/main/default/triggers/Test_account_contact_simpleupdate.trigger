trigger Test_account_contact_simpleupdate on Account (after update) 
{
    list<contact> mcontacts = new list<contact>();
    for(account newaccount : trigger.new)
    {
        list<contact> newcontact = [select id , lastname ,firstname , accountid from contact where accountid =: newaccount.Id ];
        
        for(contact lstcontact: newcontact)
            {
                lstcontact.lastname = newaccount.name;
                lstcontact.phone = newaccount.phone;
                lstcontact.fax = newaccount.fax;
                mcontacts.add(lstcontact);
                
            }
        
        
        
    }
    update mcontacts;

}