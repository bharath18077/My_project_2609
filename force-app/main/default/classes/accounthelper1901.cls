public class accounthelper1901 
{
 public static void   createaccountrecord1901()
 {
     lead acc = new lead();
     acc.lastname = 'bharath1901';
     acc.company = 'mycomp';
     acc.LeadSource = 'open - notcontacted';
     insert acc;
     if(acc.id != null)
         system.debug(acc.id);
 }
}