public class insertaccountrecords 
{
 	public static void accountrecords()
    {
     list<account> lstaccount = new list<account>();
    for(integer counter = 1 ; counter<=3000 ; counter ++)
    {
        account newaccount = new account(); 
        newaccount.name = 'bharath';
        newaccount.phone = '9542816283';
        newaccount.rating = 'hot';
        lstaccount.add(newaccount);
    }
    
    if(!lstaccount.isempty())
        insert lstaccount;
    }
        
}