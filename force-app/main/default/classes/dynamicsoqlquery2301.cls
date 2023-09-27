public class dynamicsoqlquery2301 
{ 
   public static void leadsquery(string searchtext)
   {
     
       string leadquery = 'select id , firstname ,lastname , email , phone from lead ';
           if(pattern.matches('[a-zA-Z0-9._-]+@[a-zA-Z]+.[a-zA-Z]{2,4}', searchtext))
              {
                  system.debug('the given string is email id');
                  leadquery += 'where email =: searchtext';
              }
            else
              {
                  system.debug('the given value is string');
                  searchtext += '%';
                  leadquery += 'where lastname like : searchtext';
              }
       list<lead> lstlead = database.query(leadquery);
       system.debug('number of lead records is ' + lstlead.size());
       for(lead newlead : lstlead)
       {
           system.debug(newlead);
       }
       
       
   }
    public static void leadsquery1(string searchtext)
   {
     
       string leadquery1 = 'select id , firstname ,lastname , email , phone from lead ';
           if(searchtext != null)
              {
                  system.debug('the given string is name');
                  searchtext += '%';
                  leadquery1 += 'where lastname =: searchtext';
              }
            else
              {
                  system.debug('the given value is  not a string');
                  
              }
       list<lead> lstlead1 = database.query(leadquery1);
       system.debug('number of lead records is ' + lstlead1.size());
       for(lead newlead1 : lstlead1)
       {
           system.debug(newlead1);
       }
       
       
   }
    
    
    
    
  

}