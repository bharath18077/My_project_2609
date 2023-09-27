public class delete_records 
{
    public static void deleteaccountrecords()
    {
        list<account> lstaccount = [select id , name from account where name like  : 'text%' limit 90 ];
        if(!lstaccount.isempty())
        {        
            delete lstaccount;}
    }

}