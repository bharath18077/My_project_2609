global class batchprogrammingclass implements database.Batchable<sobject>
{
    global database.QueryLocator start(database.BatchableContext bobject)
    {
        string accountrecords = 'select id , name , phone from account';
        return database.getquerylocator(accountrecords);
        
    }
    global void execute(database.batchablecontext bobject , list<sobject> recordstoupdate )
       
    {
        if(!recordstoupdate.isempty())
        {
            list<account> lstaccount = new list<account>();
            for(sobject srecord : recordstoupdate)
            {
                account accrecord = (account) srecord;
                accrecord.phone = '9542816283';
                accrecord.ownership = 'private';
                lstaccount.add(accrecord);
            }
            if(!lstaccount.isempty())
                update lstaccount;
        }
        
    }
    global void finish(database.batchablecontext bobject)
    {
        system.debug('the batch job id is ' + bobject.getJobId() );
        asyncapexjob jobdetails = [select id , status , totaljobitems ,numberoferrors from asyncapexjob where id =: bobject.getJobId() ];
        
    }
    

}