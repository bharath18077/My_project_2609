public class databasehelper2001 
{ 
    public static void getallleadrecords2001()
    {
        list<lead> lstlead = [select id ,firstname , lastname , company , title , status from lead];
        system.debug(lstlead.size());
        for(integer i=0 ; i< lstlead.size();i++)
        {
            system.debug('the lead record is' + lstlead.get(i));
        }
    }
    public static void addition()
    {
        integer a=10 ,b=20 , sum;
        sum=a+b;
        system.debug(sum);
    }
    
    public static void newhrrecord()
    {
        list<hiring_manager__c> lstnewhr = [select id , name , designation__c from hiring_manager__c];
        map<id ,hiring_manager__c> maphrrecords = new map<id , hiring_manager__c>();
        for(integer i=0 ; i< lstnewhr.size(); i++)
        {
            hiring_manager__c hrRecord = lstnewhr.Get(i);
            maphrrecords.put(hrRecord.id , hrRecord);
            System.debug(maphrrecords.Get(hrRecord.Id));
        }
    }
     public static void newaccconrecord()
     {
         list<account> lstcon = [select id , name , (select id , lastname from contacts) from  account];
         for(account newcon : lstcon)
         {
         system.debug(newcon);
             system.debug('.......................');
             for(contact newcon1 : newcon.contacts)
             {
                 system.debug(newcon1);
             }
         }
     }
    
    public static void newmaprecord2301(string industryname)
       
    {
        if(industryname !=null && industryname != '')
        {
            map<id , account> newmap = new map<id , account>( [select id , name ,industry , rating  from account where industry =: industryname ]);
            system.debug(newmap);
            list<case> newcase = [select id , casenumber , origin , reason , subject, accountid from case where accountid in : newmap.keyset()];
           
            
            for(case newcase1 : newcase)
            {
                system.debug (newcase1);
            }
                   }
    }

}