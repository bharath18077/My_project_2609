public class accountclass0207 
{
    public static void accrecord ()
    {
        list<account> lstacc = [select id , name , annualrevenue from account ];
        system.debug(lstacc);
        for(account newacc : lstacc)
        {
            if(newacc.annualrevenue > 1252)
            {
               newacc.annualrevenue_2__c = newacc.AnnualRevenue -100;
                system.debug(newacc);
               
            }
        }
        update lstacc;
       
    }
    public static void deleterecords()
    {
       
       
        delete [select id , name from account where name like 'j%' and name like 't%'  ];
        
    }
        

}