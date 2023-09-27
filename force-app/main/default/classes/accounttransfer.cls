public class accounttransfer 
{
    public static void accountstotransfer(string industryname , string username)
    {
        
        list<account> newaccount = [select id , name , industry , ownerid from account where industry =: industryname];
        if(!newaccount.isempty())
        {
            user newuser = [select id , lastname , firstname , username from user where username =: username and isactive = true];
            if(newuser.id != null)
            {
                for(account acc : newaccount)
                {
                       acc.ownerId = newuser.Id;
                }
            }
            update newuser ;
        }
        
    }

}