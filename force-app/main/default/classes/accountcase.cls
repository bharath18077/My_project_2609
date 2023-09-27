public class accountcase 
{
    public static void createaccountrecord()
    {
        try{
        list<Account> lstaccount = new list<Account>();
        for(integer i=0 ; i<=9 ;i++)
        {
            Account acc = new Account();
            acc.name = 'ruth'+i;
            acc.Rating = 'hot';
            acc.phone = '+919542826283';
           
            acc.AnnualRevenue = 12527;
            lstaccount.add(acc);
            
            
            
        }
        insert lstaccount;
      list<Contact> conlist= new list <Contact>();
      for(Account ac: lstaccount)
      {
          for(integer j=0; j<=2; j++)
          {
              Contact con = new Contact();
           	 ID idx = ac.id;
              System.debug(idx);
              con.AccountId=idx;
              con.LastName='Bharath';
            
              conlist.add(con);
          }
         
          
      }
             insert conlist;
        }
        catch(Exception e)
        {
            System.debug('Exception due to--->: '+e.getCause());
        }
        
    }
    

}