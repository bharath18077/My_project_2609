public class newopportunityclass 
{
    public static void newclass()
    {
        list<opportunity> newop = [select id ,amount , accountid from opportunity where accountid!=null];
    }

}