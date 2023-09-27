public class databasehelper12 
{
    public static void fetchcontact(string[] empnames)
    {
        if(empnames.size() > 0)
      
        {
            
        list<contact> lstcontacts = [select id , lastname , fax , phone from contact 
                                    where lastname in : empnames];
        system.debug('Number of contacts fetched are'+ lstcontacts.size());
        for(contact newcon : lstcontacts)
        {
            system.debug(newcon);
        }
        }
        
    }

}