public class examplesoqlclauses 
{
    public static void createnewlead()
    {
        list<lead> newlead = [select id , firstname ,lastname  from lead limit 5  ];
        system.debug(newlead.size());
            for (integer  counter = 0 ;counter< newlead.size();counter++)
        {
            system.debug(newlead.get(counter));
        }
    }
    public static void createnewaccount()
    {
        list<account> acc =[select id ,rating , name , industry , isdeleted , annualrevenue from account  order by annualrevenue limit 10 offset 10 all rows ];
        system.debug(acc.size());
        for(account newaccount:acc)
        {
            system.debug(newaccount);
            
        }
    }
    public static void newcase()
    {
        list<case> ncase = [select id ,  casenumber , status , createddate from case order by createddate desc];
        for(case newcase:ncase)
        {
            system.debug(newcase);
        }
    }
    public static void newlead()
    {
        list<lead> newlead = [select id,firstname,lastname , title , email , phone , fax from lead order by firstname  limit 20 offset 10];
        system.debug(newlead.size());
            for( lead nlead:newlead)
        {
            system.debug(nlead);
        }
    }
    public static void newaccount()
    {
     
        for (account newacc :[select name, id , rating from account])
        {
            system.debug(newacc);
            
        }
    }
     public static void create3account(string[] industryname  )
    {
        list<account> acc =[select id ,rating , name , industry , isdeleted , annualrevenue from account where industry =: industryname all rows];
        for (account newacc:acc)
        {
            system.debug(newacc);
        }
    }
    public static void createnewcaserecord(string newstatus , string newpriority)
    {
        if (newstatus!=null && newpriority !=null)
        {
            list<case> newcase = [select id , origin , status , priority from case where status =:newstatus and priority =:newpriority ];
            system.debug(newcase.size());
            if(! newcase.isempty())
            {
                for (case ncase:newcase)
                {
                    system.debug(ncase);
                }
            }
        }
    }
        
}