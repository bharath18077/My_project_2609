public class deactivate 
{
    public static void usertodeactivate()
    {
        list<user> lstnewuser = [select id , firstname , lastname , username , isactive  from user where username like 'user%' and isactive = false];
        system.debug(lstnewuser);
        if(! lstnewuser.isempty())
        {
            for(user newuser : lstnewuser)
            {
            list<User> usersToUpdate = new list<User>();
            newuser.isactive = true;
            usersToUpdate.Add(newUser);
            }
            update (lstnewuser);
        }
    }
	
}