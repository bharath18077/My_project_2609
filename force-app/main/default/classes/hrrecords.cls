public class hrrecords 
{
    public static void deletehrs()
    {
       list<hiring_manager__c> newhr = [select  name from hiring_manager__c ];
      system.debug(newhr.size());
            set<hiring_manager__c> uniquehr = new set<hiring_manager__c>(newhr);
        system.debug(uniquehr.size());
        for(hiring_manager__c unique :uniquehr)
        {
            system.debug(unique);
        }
        
        
        
        
    }
    

}