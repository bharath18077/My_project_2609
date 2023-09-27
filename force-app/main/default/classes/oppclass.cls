public class oppclass 
{ 
    public static void oppupdate()
    {
        list<opportunity> lstops = [select id , amount , accountid, account.rating, 
             account.phone, account.annualrevenue from opportunity where accountid != null];
        
        List<Opportunity> oppsList = New List<Opportunity>();
        for ( opportunity  abc : lstops){
            
            abc.amount = abc.account.AnnualRevenue;
           
            
        	oppsList.add(abc);
            
        }
        update oppsList; 
        
        
 /*       map<id , account> accmap =  new map<id , account>([select id , name from account]);
        if(!lstops.isempty())
        {
            list<opportunity> oppoe =new list<opportunity>();
            for(opportunity newopp : lstops)
            {
                account 
                    = accmap.get(newopp.AccountId);
                newopp.Amount = acc.annualrevenue;
                oppoe.add(newopp);
            }
            update oppoe;
        }
        
*/    }

}