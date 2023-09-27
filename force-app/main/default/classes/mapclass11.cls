public class mapclass11 
{ 
    public static void newmap11()
    {
        map<id , position__c> newmap = new map<id , position__c>([select id , name , position_status__c , location__c 
                                                             from position__c]);
        
        
            
        system.debug(newmap.size());
        system.debug(newmap);
        system.debug(newmap.keyset());
        system.debug(newmap.values());
        for(id recordid : newmap.keyset())
        {
            system.debug(newmap.get(recordid).name);
            system.debug('Position Record is..: Id...: '+ recordId + ' --> Record: '+ newmap.Get(recordId));
        }
        
        
        
    }

}