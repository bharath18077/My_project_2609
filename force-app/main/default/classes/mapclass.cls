public class mapclass 
{ 
    Public static void newmap()
    {
        map<string , string > fruitsmap = new map<string,string>();
        fruitsmap.put('yellow', 'banana');
        fruitsmap.put('red', 'banana'); 
        fruitsmap.put('black', 'banana');
         fruitsmap.put('black', 'apple');
        
         map<string , string > fruitsmap2 = new map<string,string>();
        fruitsmap2.put('green', 'banana');
        fruitsmap2.put('orange', 'banana'); 
        fruitsmap2.put('pink', 'banana');
        system.debug(fruitsmap.size());
        fruitsmap.putall(fruitsmap2);
         system.debug(fruitsmap.size());
        system.debug('Collection Elements are...: '+ fruitsMap);
        system.debug(fruitsmap.isempty());
        system.debug(fruitsmap.get('yellow'));
        system.debug(fruitsmap.containskey('green'));
        system.debug(fruitsmap.remove('red'));
        system.debug('Collection Elements are...: '+ fruitsMap);
        system.debug(fruitsMap.keyset());
        system.debug(fruitsMap.values());
        system.debug(fruitsMap.equals(fruitsMap2));
        fruitsmap.clear();
        system.debug(fruitsmap.size());
    }

}