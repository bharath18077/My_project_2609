public class createleadrecord 
{
	public   static void createldrecord(string city ,string fname,string lname , decimal amount ,string com) 
    {
        lead ldrecord = new lead();
        ldrecord.City = city;
        ldrecord.FirstName = fname;
        ldrecord.LastName = lname;
        ldrecord.AnnualRevenue = amount;
        ldrecord.Company = com;
        insert ldrecord ;
        if (ldrecord.id != null)
            system.debug('the id is '+ ldrecord.id);
        	
    }
}