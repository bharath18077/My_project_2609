public class dmloperations 
{
    public static void inserthrrecords()
    {
        list<hiring_manager__c> newhrrecords = new list<hiring_manager__c>();
        for (integer counter = 1;counter<=100; counter++)
        {
        hiring_manager__c hrrecords = new hiring_manager__c();
            hrrecords.Name = 'bharath kumar-'+ counter;
            hrrecords.loaction__c = 'hyderabad';
            hrrecords.contact_number__c = '9542816283';
           
            hrrecords.current_ctc__c = 360000;
            hrrecords.email_id__c = 'bharathkumarjonna'+counter+'@gmail.com';
            newhrrecords.add(hrrecords);
            
        }
        if (! newhrrecords.isEmpty())
        {
        insert newhrrecords;
            system.debug(newhrrecords);
        }
    }
    public static void deletehrrecord(string emailid)
    {
        delete[select id , name , email_id__c from hiring_manager__c where email_id__c like :'%' + emailid  + '%'];
        
    }
    public static void deleterecord(string namenew)
    {
        if (namenew != null && namenew !='')
        {
            list<hiring_manager__c> newhr = [select id , name from hiring_manager__c where name like :namenew +'%'];
            delete newhr;
            
            
        }
    }
    public static void undeleterecord()
    {
        list<hiring_manager__c> newhr = [select id , name , isdeleted from hiring_manager__c  where isdeleted = true  all rows];
        system.debug(newhr.size());
        for(hiring_manager__c hrrecords :newhr)
        {
            system.debug(hrrecords);
        }
    }
    public static void updateaccountrecords()
    {
        list<account > newaccount = [select id ,rating,name ,annualrevenue , customerpriority__c , type from account where rating ='hot'];
        if (! newaccount.isempty())
        {
            for (account acc:newaccount)
            {
                acc.annualrevenue = 90000;
                acc.type = 'customer - direct';
                acc.CustomerPriority__c = 'hot';
            }
            update newaccount;
        }
    }
        public static void updateaccountrecord1()
        {
            string[] industries = new string[]{'banking','manufacturing' , 'energy'};
            list<account> newaccount =[select id , name , industry , annualrevenue from account where industry in :industries];
            if(! newaccount.isempty())
            {
                for(account acc:newaccount)
                {
                   switch ON acc.Industry
                   {
                       when 'banking'
                       {
                           acc.AnnualRevenue = 1000;
                       }
                       when 'energy'
                       {
                           acc.AnnualRevenue = 1500;
                       }
                       when 'manufacturing'
                       {
                           acc.AnnualRevenue = 2000;
                       }
                   }
                
                }
                update newaccount ;
               
            }
        }
    public static void deactiveuser(string uname)
    {
        if (uname != null &&uname != '')
        {
            user newuser = [select firstname , lastname , isactive , id ,username from user where 
                            username =:uname and isactive = true];
            if (newuser.id != null)
            {
                newuser.isactive = false;
                
            }
            update newuser ;
            
        }
    }
    public static void transferrecord(string uname , string industryname)
    {
        if (uname != null && industryname != null)
        {
            list<account> newaccount = [select id , name , industry , ownerid from account where industry =: industryname];
            if (!newaccount.isempty())
            {
                user usertotransfer = [select id , firstname , lastname , username ,isactive from user
                                     where username =:uname and isactive =true];
                if (usertotransfer.id!= null)
                {
                    for(account acc :newaccount)
                    {
                        acc.OwnerId = usertotransfer.id;
                    }
                    update newaccount;
                }
       
                
            }
        }
    }
    public static void upsertcaserecords()
    {
        list<case> casetoupsert = new list<case>();
        list<case> lstcases = [select id , casenumber , origin , status , priority from case where status ='new'];
        if (!lstcases.isEmpty())
        {
            for(case csrecord: lstcases)
            {
                csrecord.priority = 'high';
                casetoupsert.add(csrecord);
                
            }
            
        }
        case newcase = new case();
        newcase.status = 'working';
        newcase.Priority = 'high';
        newcase.Reason = 'performance';
        newcase.Type = 'mechanical';
        casetoupsert.add (newcase);
        if (!casetoupsert.isEmpty())
        {
            upsert casetoupsert;
        }
        system.debug('number of rows used is ' + system.limits.getdmlrows());
        system.debug('number of queries used ' + system.limits.getDmlStatements());
        
    }
        
    

}