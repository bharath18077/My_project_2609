public class data11 
{
 public static void get11()
 {
     map<id ,position__c> newmap = new  map<id,position__c>([select id , name  from 
                                                     position__c]);
     system.debug(newmap.size());
     if(!newmap.isempty())
     {
       for(position__c newpos :newmap.values()) 
       {
           system.debug('positions recors is :'+ newpos);
       }
     }
 }
}