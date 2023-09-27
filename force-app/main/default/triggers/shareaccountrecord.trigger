trigger shareaccountrecord on Account (after insert , after update) 
{
    if(trigger.isafter &&( trigger.isinsert || trigger.isupdate))
    {
        list<accountshare> newaccshare = new list<accountshare>();
        for(account newaccount : trigger.new)
        {
            if(newaccount.Active__c == 'yes' && newaccount.share_record_to__c != null)
            {
               
                accountshare newshare = new accountshare();
                 if(newaccount.AnnualRevenue >= 50000)
                {
                    newshare.AccountId = newaccount.id;
                    newshare.userorgroupid = newaccount.share_record_to__c;
                    newshare.CaseAccessLevel = 'edit';
                    newshare.OpportunityAccessLevel = 'edit';
                    newshare.RowCause = 'manual';
                    newshare.AccountAccessLevel = 'edit';
                }
                else
                {
                    newshare.accountid = newaccount.id;
                    newshare.userorgroupid = newaccount.share_record_to__c;
                    newshare.accountaccesslevel = 'edit';
                    newshare.caseaccesslevel = 'read';
                    newshare.opportunityaccesslevel = 'read';
                    newshare.rowcause = 'manual';
                    
                }
                newaccshare.add(newshare);
               }
        }
        if(!newaccshare.isempty())
        insert newaccshare ;
    }

}