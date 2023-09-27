trigger deleterelatedposition on hiring_manager__c (before delete) 
{
   if(trigger.isbefore && trigger.isdelete)
   {
       list<position__c> newpos = [select id , 	country_name__c , 	location__c , hiring_manager__c from position__c 
                                   where hiring_manager__c in: trigger.oldmap.keyset()];
       if(!newpos.isempty())
       {
           for(position__c pos : newpos)
           {
                   
           }
           delete newpos;
       }
   }
}