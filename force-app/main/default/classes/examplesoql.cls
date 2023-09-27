public class examplesoql 
{ 
    public static void create2account()
    {
        list<account> acc = [select name ,id ,rating , industry from account];
            if(! acc.isEmpty())
                 {
                       for(integer counter=0;counter<acc.size();counter++)
           					 {
                					system.debug(acc.get(counter).id);
                                 system.debug(acc.get(counter).rating); 
                
            				}
        		}
    }
    
        
    public static void createaccountrecord()
    {
        
        list<account> newaccount = [select id ,name , rating, phone ,fax , annualrevenue from account where annualrevenue > 5000000 ];
        if (! newaccount.isEmpty())
        {
            for(account newacc:newaccount)
            {
            
        system.debug(newacc);
            }
        }
        
    }
    public static void createlead()
    {
        list<string> newindustry = new list<string>{'energy' , 'manufacturing'};
        list<lead> newlead = [select id , firstname , lastname, company,status ,rating , industry from lead where industry in:(newindustry)];
        
        if(lead.id!=null)
        {
            for(lead nlead:newlead)
        {
            system.debug(nlead);
        }
        }
    }
    
    public static void caserecord()
    {
        
            for (case ncase : [select id,casenumber , status , origin , reason from case] )
            {
                system.debug(ncase);
            }
    }
    
    public static void createhrmap()
    {
        list<hiring_manager__c> hrrecords = [select id , name , contact_number__c , designation__c from hiring_manager__c];
         if (! hrrecords.isempty())
         {
             map<id , hiring_manager__c > maphrrecords = new map<id , hiring_manager__c> ();
             for (hiring_manager__c hrrecord:hrrecords)
             {
                 maphrrecords.put(hrrecord.id , hrrecord);
                 system.debug(maphrrecords);
                     }
         }
      
        
    }
     public static void createnewhrmap()
    {
        
             map<id , hiring_manager__c> hrrecord = new map<id , hiring_manager__c>([select id , name , loaction__c , designation__c   from hiring_manager__c]);
        for (hiring_manager__c newrecords:hrrecord.values())
        {
            system.debug(newrecords);
        }
         
      }
    public static void createnewaccountmap()
    {
        map<id , account> newaccount = new map<id , account>([select id  , name , rating , industry from account limit 1]);
        for (account newacc:newaccount.values())
        {
            system.debug(newacc);
        }
    }
    public static void create1newlead()
    {
        list<lead> newlead = [select id,firstname, city from lead where city = 'banglore' order by firstname];
        system.debug(newlead.size());
        if(! newlead.isempty())
        {
            
        
        for(lead nlead:newlead)
        {
            system.debug(nlead);
        }
        }
       
    }
    public static void createnewposition()
    {
        list<position__c> newpos =[select id , name ,location__c, travel_required__c from position__c where location__c  in ( 'mumbai' , 'banglore' , 'hyderabad') ];
        system.debug(newpos.size());
        for(position__c newposition :newpos)
        {
            system.debug(newposition);
        }
        
    }
    public static void createhiringmanager(string[] locationnames)
        
    {
        if (locationnames.size()> 0)
        {
            list<hiring_manager__c> lsthiring = [select id , name  , loaction__c from hiring_manager__c where loaction__c in:locationnames];
            system.debug(lsthiring.size());
            for(hiring_manager__c newhr:lsthiring)
            {
                system.debug(newhr);
            }
        }
    }
     public static void getallcaserecords(string industryname)
     {
      if (industryname!=null && industryname!='')
      {
          map<id , account> mapaccount = new map<id , account>([select id ,name,rating , industry from account
                                                             where industry =: industryname  ]);
          if(! mapaccount.isEmpty())
          {
              list<case> newcase = [select id , casenumber , priority , origin , reason,accountid from case
                                   where accountid in :mapaccount.keyset() ];
              system.debug('number of cases is ' + newcase.size());
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
       public static void getallcaserecords1(string industryname)
     {
      if (industryname!=null && industryname!='')
      {
          map<id , account> mapaccount = new map<id , account>([select id ,name,rating , industry from account
                                                             where industry =: industryname  ]);
          if (! mapaccount.isempty())
         
              {
                  system.debug(mapaccount.size());
                  for (case ncase:[select id , casenumber , priority , origin , reason,accountid from case
                                   where accountid in :mapaccount.keyset() ])
                  {
                      system.debug(ncase);
                      
                  }
              }
          
      }
  }
    public static void searchleadrecord(string startingchar)
    {
        if (startingchar!='null' && startingchar!='')
        {
            startingchar ='%';
            list<lead> lstlead = [select id , firstname ,lastname from lead where lastname like : startingchar];
            for(lead newlead :lstlead)
            {
                system.debug(newlead);
            }
                
        }
    }
}