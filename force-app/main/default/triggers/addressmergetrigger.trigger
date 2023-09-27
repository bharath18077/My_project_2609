trigger addressmergetrigger on Account (after insert , after update) 
{
    for(account newaccount : trigger.new)
    {
        if(newaccount.address_are_same__c == true)
        {
            newaccount.billingstate = newaccount.shippingstate;
            newaccount.billingcity = newaccount.shippingcity;
            newaccount.billingstreet = newaccount.shippingstreet;
            newaccount.billingcountry = newaccount.shippingcountry;
            
            update newaccount;
            
        }
    }
    
    

}