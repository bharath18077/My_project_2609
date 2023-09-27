public class bookclass 
{ 
    public static void applydiscount(list<book__C> newdiscount)
    {
        for(book__c newbook : newdiscount)
        {
            if(newbook.unit_price__c >= 10000)
            {
                	newbook.selling_price__c= newbook.unit_price__c *(0.8) ;
            }
            else if (newbook.unit_price__c >= 20000)
            {
                newbook.selling_price__c= newbook.unit_price__c * (0.6) ;
            }
                
        }
    }
        

}