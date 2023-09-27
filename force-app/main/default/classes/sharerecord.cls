public class sharerecord 
{ 
    public static void shareaccountrecord(string accountname)
       
    {
        if(accountname != null && accountname != '')
        {
            list<account > lstaccaccount = [select id , name , rating , annualrevenue , share_record_to__c from account where name =: accountname];
            if(!lstaccaccount.isempty())
            {
                list<accountshare> accountshare = new list<accountshare>();
                for(account accshare : lstaccaccount)
                {
                    if(accshare.share_record_to__c != null)
                    {
                        accountshare newshare = new accountshare();
                        newshare.accountid = accshare.id ; 
                        newshare.UserOrGroupId = accshare.share_record_to__c;
                        newshare.RowCause = 'manual';
                        if(accshare.annualrevenue >100000)
                          newshare.AccountAccessLevel = 'all';
                        else
                            newshare.AccountAccessLevel = 'read';
                        newshare.OpportunityAccessLevel = 'edit';
                        newshare.CaseAccessLevel = 'read';
                        accountshare.add(newshare);
                        
                            

                       
                    }
                }
                insert accountshare;
            }
                
        }
    }

}