public class testapexprogram 
{    public static void newaccount()
    {
    list<account> lstaccount =[select id , name from account where name like: 'text%' limit 50];
    
        delete lstaccount;
    }

}