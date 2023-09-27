public class databasehelper 
{
    public static void getallaccountrecords()
    {
        list<account> accrecord = [select id , name , rating , industry from account]; 
        if(! accrecord.isEmpty())
        {
          
                system.debug(accrecord);
            }      
        
    }

}