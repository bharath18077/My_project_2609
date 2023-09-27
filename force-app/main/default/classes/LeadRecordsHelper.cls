public class LeadRecordsHelper 
{
    public void createnewlead()
    {
        lead ldrecord = new lead();
        	ldrecord.FirstName = 'bharath ';
        	ldrecord.LastName = 'kumar';
        	ldrecord.City = 'hyderabad';
            ldrecord.AnnualRevenue = 1200000;
        	ldrecord.Company = 'global data';
        	ldrecord.status = 'working contated';
        	ldrecord.rating = 'hot';
        
        insert ldrecord;
        
        if(ldrecord.id != null)
            system.debug('he lead record id is ...' + ldrecord.id);
    }

}