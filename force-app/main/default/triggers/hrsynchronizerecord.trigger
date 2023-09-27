trigger hrsynchronizerecord on hiring_manager__c (after insert , after update ) 
{ 
    if(trigger.isafter &&  trigger.isinsert) 
    {
        list<recruiter__c> newrecruiter = new list<recruiter__c>();
        for(hiring_manager__c newhr : trigger.new)
        {
            recruiter__c newrec = new recruiter__c();
            newrec.Name = newhr.Name;
              newrec.email_id__c = newhr.email_id__c;
              newrec.hiring_manager__c = newhr.Id ;
            newrec.contact_number__c = newhr.contact_number__c;
            newrec.location__c = newhr.loaction__c;
            newrec.current_ctc__c = newhr.current_ctc__c;
            newrecruiter.add(newrec);
        }
        if(! newrecruiter.isempty())
            insert newrecruiter;
    }
    
    if(trigger.isafter && trigger.isupdate)
    {
        list<id> updatedhrrecordid = new list<id>();
        for(hiring_manager__c hrrecord : trigger.new)
        {
            hiring_manager__c oldrecords = trigger.oldmap.get(hrrecord.id);
            if(oldrecords.name != hrrecord.name || oldrecords.contact_number__c != hrrecord.contact_number__c || 
              oldrecords.current_ctc__c != hrrecord.current_ctc__c || oldrecords.email_id__c != hrrecord.email_id__c)
            {
                updatedhrrecordid.add(hrrecord.Id);
            }
            
        }
        if(!updatedhrrecordid.isempty())
        {
            list<recruiter__c> lstrecruiters = [select id , name , location__c, email_id__c,hiring_manager__c , contact_number__c, current_ctc__C 
                                               from recruiter__c where hiring_manager__C in : updatedhrrecordid];
            if(!lstrecruiters.isempty())
            {
                list<recruiter__c> newrec = new list<recruiter__C>();
                for(recruiter__c recrecord : lstrecruiters)
                {
                    hiring_manager__c hrrecord = trigger.newmap.get(recrecord.hiring_manager__c);
                    recrecord.contact_number__c = hrrecord.contact_number__c;
                    recrecord.current_ctc__c = hrrecord.current_ctc__c;
                    recrecord.email_id__c = hrrecord.email_id__c;
                    recrecord.name = hrrecord.name;
                    newrec.add(recrecord);
                    
                }
                update newrec;
            }
        }
    }
}