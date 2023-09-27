public class newdmlexample 
{
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
        newcase.Subject = 'my phone is not working';
        newcase.Description = 'my phone is unable to connect to neardby wifi';
        casetoupsert.add (newcase);
        
        if (!casetoupsert.isEmpty())
        {
            upsert casetoupsert;
        }
        system.debug('number of rows used is ' + system.limits.getdmlrows());
        system.debug('number of queries used ' + system.limits.getDmlStatements());
        
    }
    public static void mergerecords()
    {
        account acc1 = [select id , name , rating , industry from account where name = 'Dickenson plc'];
        account acc2 = [select id , name , rating , industry from account where name = 'manual sharing test account' ];
        
 
        merge acc1 acc2 ;
      
    }
    public static void getaccountsrecordwithrelatedrecords (string accountrecordname)
    {
        if(accountrecordname !=null && accountrecordname!='')
        {
           list<account> lstaccounts  = [select id ,name,rating , annualrevenue,phone ,fax,
            (select id,firstname ,lastname,email,title,phone from contacts),
            (select id , name , amount , stagename, closedate from opportunities),
            (select id , casenumber , status , priority,subject from cases)
           from account where name =: accountrecordname];
            system.debug('number of accounts returned'+ lstaccounts.size());
            if(!lstaccounts.isempty())
            {
                for (account accrecord : lstaccounts)
                {
                  system.debug('account name is  ' + accrecord.name); 
                    system.debug('account rating is  ' + accrecord.rating);  
                    system.debug('account annualrevenue is  ' + accrecord.annualrevenue);  
                    system.debug('account phone is  ' + accrecord.phone);  
                    system.debug('account fax is  ' + accrecord.fax);
                    system.debug('.......................................');
                    system.debug('number of releted contacts'+ accrecord.contacts.size());
                       for(contact con : accrecord.contacts)
                       {
                           system.debug('contact record is '+ con);
                       }
                    system.debug('.......................................');
                    system.debug('number of related opportunities'+ accrecord.opportunities.size());
                        for(opportunity opt: accrecord.opportunities)
                        {
                            system.debug('opportunity records are'+ opt);
                        }
                    system.debug('.......................................');
                    system.debug('number of related cases'+ accrecord.cases.size());
                        for(case csrecords: accrecord.cases)
                        {
                            system.debug('opportunity records are'+ csrecords);
                        }
                }
            }
            system.debug('number of soql queries used'+system.Limits.getqueries());
        }
        
            
    }
    public static void getchildrelatedrecords(string hrname)
    {
        if(hrname != null && hrname != '')
        {
            list<hiring_manager__c> hrrecord = [select id ,name ,current_ctc__c , email_id__c , contact_number__c,designation__c , 
                                                (select id , name , location__c , position_status__c , open_date__c  from positions__r)
                                               from hiring_manager__c 
                                               where name =: hrname ];
            system.debug('number of hr records'+hrrecord.size());
            if (!hrrecord.isempty())
            {
                for(hiring_manager__c newhr:hrrecord)
                {
                    system.debug('the hr records are'+newhr);
                    system.debug('.............................');
                    system.debug('related position records size is'+newhr.positions__r.size());
                    for(position__c pos : newhr.positions__r)
                    {
                       system.debug('the postion records are '+pos); 
                    }
                    
                }
                
            }
            system.debug('number of queries used is '+ system.limits.getQueries());
        }
    }
    public static void getcaserecord(string caserecordnumber)
    {
        if(caserecordnumber != null && caserecordnumber != '')
        {
            List<case> lstcases = [select id , casenumber , origin , priority , status , reason , subject ,
                                   contact.firstname ,contact.lastname ,contact.email ,
                                   contact.account.name , contact.account.rating ,contact.account.active__c,
                                   contact.account.owner.firstname , contact.account.owner.lastname , 
                                   contact.account.owner.profile.name ,
                                   contact.account.owner.profile.userlicense.name
                                  from case where casenumber =: caserecordnumber];
            system.debug('number of case records is '+ lstcases.size());
           
            if(!lstcases.isempty())
            {
                for(case csrecord : lstcases)
                {
                    system.debug('the case number is '+ csrecord.casenumber);
                    system.debug('the case id is '+ csrecord.id);
                    system.debug('the case status is '+ csrecord.status);
                    system.debug('the case priority is '+ csrecord.priority);
                    system.debug('the case reason is '+ csrecord.reason);
                    system.debug('the case subject is '+ csrecord.subject);
                     system.debug('the contact record name  is '+ csrecord.contact.firstname + ''+ csrecord.contact.lastname);
                    system.debug('the contact email is '+ csrecord.contact.email);
                        
                   
                    system.debug('the account record name is '+ csrecord.contact.account.name);
                    system.debug('account record rating'+ csrecord.contact.account.rating);
                    system.debug('account owner is '+ csrecord.contact.account.owner.firstname + ' ' + csrecord.contact.account.owner.lastname );
                    system.debug('account related profile is'+ csrecord.contact.account.owner.profile.name);
                    system.debug('account related owner liscense is ' +csrecord.contact.account.owner.profile.userlicense.name );
                    
                    
                    
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
        

}