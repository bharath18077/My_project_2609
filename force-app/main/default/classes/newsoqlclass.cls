public class newsoqlclass 
{
    public static void user11(string personname)
    {
        List<account> acc = [Select id, name , phone , fax , active__c from account
                           Where name =: personname ];
        system.debug(acc);
       
    }
    public static void newlike(string startingchar)
    {
        startingchar += '%'                   ;
        list<account> accaccount = [select name , id , phone  from account 
                                   where name like : startingchar];
        system.debug(accaccount);
        for(account newacc : accaccount)
        {
            system.debug(newacc);
        }
        
    }
    public static void insoql()
    {
        map< id , account > newmap = new map<id , account>([select id , name , phone from account where industry='energy']);
        system.debug(newmap.size());
        system.debug(newmap);
        
            list<contact> newcon = [select id ,accountid, firstname , lastname , phone from contact
                                    where accountid in:newmap.keyset()];
        for(contact newcon1 : newcon)
        {
           
            system.debug(newcon1);
        }
            }
    

}