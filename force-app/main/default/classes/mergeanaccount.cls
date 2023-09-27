public class mergeanaccount
{
    public static void newmerge()
    {
    account acc1 = [select id , name , rating from account where name = 'my account'];
    account acc2 = [select id , name , rating from account where name = 'share record to'];
    account acc3 = [select id , name , rating from account where name = 'bharath'];
    if(acc1.id != null && acc2.id != null && acc3.id != null )
    {
       merge acc1 acc2  ;
    }
    }
     
}