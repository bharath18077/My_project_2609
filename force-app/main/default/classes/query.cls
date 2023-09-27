public class query {
    public static void insertnewrecord(){
      
        list<account> lstaccount = [select id, name from account where name like 'text10'];
        
        delete lstaccount;
        
    }
    
    
}