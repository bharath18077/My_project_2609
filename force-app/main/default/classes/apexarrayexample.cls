public class apexarrayexample 
{
public void arraymethod()
{
    
    list<string> country =new list<string>{'india','usa','uk','japan'};
    
    system.debug(country);
    country.sort();
    system.debug(country);
    for (integer i=3 ; i>=0;i--)
        system.debug(country[i]);
       
}
    
}