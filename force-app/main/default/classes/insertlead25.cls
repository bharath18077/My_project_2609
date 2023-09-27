public class insertlead25 
{ 
    public static void insertleadrecords25()
    {
        list<lead> lstlead = new list<lead>();
        for (integer i=1 ; i<=50 ; i++)
        {
            lead ldrecord = new lead();
            ldrecord.lastName = 'bharath' + i;
            ldrecord.Status = 'open not-converted' ; 
            if( i != 45)
              ldrecord.company = 'amb';
            
             lstlead.add(ldrecord);
            
             
       }
        if(!lstlead.isempty())
        {
            database.saveresult[] results  = database.insert(lstlead , false);
            for(database.SaveResult newresult : results)
            {
                if(newresult.issuccess())
                {
                    system.debug('record inserted succesfully and record id is ' + newresult.getid());
                }
                else
                {
                    database.error[] errors = newresult.geterrors();
                    for(database.error newError : errors)
                    {
                        system.debug(newerror.getmessage());
                        system.debug(newerror.getfields());
                        system.debug(newerror.getstatuscode());
                    }
                }
            }
        }
        
    }
    public static void deletelead()
    {
        delete [select id , lastname from lead where lastname like 'bharath%'];
        
           }

}