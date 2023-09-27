public class accountcontacttestclass 
{
    public static void accountsclass( string web,string accname ,string firstname,string lastname, string phonenumber , string emailid  )
    {
        account newaccount = new account();
        
        newaccount.name = accname;
        newaccount.Phone = phonenumber;
        newaccount.email_id__c= emailid;
        newaccount.website = web;
        
        
        insert newaccount;
        system.debug(newaccount);
        if(newaccount.id!= null)
          system.debug(newaccount.id);
        
        contact newcontact = new contact();
        newcontact.FirstName = firstname;
        newcontact.lastname = lastname;
        newcontact.Email = newaccount.email_id__c;
        newcontact.Phone = newaccount.Phone;
        newcontact.AccountId = newaccount.Id;
        
        
        insert newcontact;
        if(newcontact.id!= null)
         system.debug(newcontact.id);
        
    }

}