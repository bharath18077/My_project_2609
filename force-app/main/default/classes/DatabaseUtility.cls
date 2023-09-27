public class DatabaseUtility
{
Public static void GetUserRecords()
{
for(User u : [Select id, firstname, lastname, email,username, profile.name, isactive
                    from user])
{
system.debug('User Record is...: '+ u);
}
}
}