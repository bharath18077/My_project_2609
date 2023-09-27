public class mapexampleclass 
{
    public void mapprocedure()
    {
    map<string,string> fruitmap = new map<string,string>();
fruitmap.put('red','apple');
system.debug(fruitmap);
map<string,string> fruitsmap = new map<string,string>();
fruitsmap.put('yellow','banana');
fruitsmap.put('orange','orange');
fruitsmap.put('green','grapes');
fruitsmap.put('black','grapes');
system.debug(fruitsmap);
fruitmap.putall(fruitsmap);
system.debug(fruitmap);
system.debug(fruitmap.size());
fruitmap.remove('yellow');
system.debug(fruitmap);
if (fruitmap.isempty())
    system.debug('empty');
else
    system.debug('not empty');
system.debug(fruitmap.get('red'));
if (fruitmap.containskey('yellow'))
    system.debug('contains the element');
else 
    system.debug('does not contain the element');
set<string> newcollectionset = fruitmap.keyset();
system.debug(newcollectionset);
list<string> newcollectionlist = fruitmap.values();
system.debug(newcollectionlist);
map<string,string> newfruitmap = fruitmap.clone();
system.debug(newfruitmap);
if (fruitmap.equals(newfruitmap))
    system.debug('both are equal');
else
    system.debug('not equal');
fruitmap.clear();
system.debug(fruitmap);
    }



}