public class AccountsHelper 
{
    public void CreateAccountRecord()
    {
        Account acc = new account();
        
            acc.Name = 'bharath ';
        	acc.AnnualRevenue = 200000;
        	acc.Rating = 'hot';
        	acc.BillingCountry = 'India';
        	acc.type = 'instalation partner';
        	acc.BillingCity = 'hyderabad';
        	acc.Industry = 'manufacturing';
        	acc.Active__c = 'yes';
        
        insert acc;
         
        if (acc.id != null)
            system.debug ('the account record id is ...' + acc.id);
    }

}