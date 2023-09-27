public class soslqueryclass 
{
    public static void searchobjects()
    {
        list<list<sobject>>  lstrecords = [find 'test*' in all fields returning 
                                          account(id , name , rating , description ),
                                          contact(id , lastname , phone , description  ),
                                          hiring_manager__c(id , name , loaction__C , email_id__c)];
        
         list<account> lstaccount = (list<account>)lstrecords.get(0);
        list<contact> lstcontact = (list<contact>)lstrecords.get(1);
        list<hiring_manager__c> lsthr = (list<hiring_manager__c>)lstrecords.get(2);
        system.debug(lstrecords.size());
        for(account acc : lstaccount)
        {
            system.debug(acc);
            system.debug('...............');
        }
        for(contact con : lstcontact)
        {
            system.debug(con);
            system.debug('.............');
        }
        for(hiring_manager__c hr :lsthr)
        {
            system.debug(hr);
            system.debug('.............');
        }
            
    }
    
    public static void dynamicsearchrecords(string searchtext)
    {
        string dynamicsosl = 'find '+' \' ' + searchtext +'*' + ' \' ' + 'in all fields returning ' +
           									 'account(id , name , rating , industry),' +
                                         'contact(id , lastname , phone , description),'+
                                         'hiring_manager__c(id , name , email_id__c)';
        list<list<sobject>> lstrecords = search.query(dynamicsosl);
        list<account> lstaccount = (list<account>)lstrecords.get(0);
        list<contact> lstcontact = (list<contact>)lstrecords.get(1);
        list<hiring_manager__c> lsthr = (list<hiring_manager__c>)lstrecords.get(2);
        system.debug(lstrecords.size());
        for(account acc : lstaccount)
        {
            system.debug(acc);
            system.debug('...............');
        }
        for(contact con : lstcontact)
        {
            system.debug(con);
            system.debug('.............');
        }
        for(hiring_manager__c hr :lsthr)
        {
            system.debug(hr);
            system.debug('.............');
        }
            
    
            
                                         
    }

}