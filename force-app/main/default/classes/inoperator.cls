public class inoperator 
{ public static void usein()
{
    list<hiring_manager__c> newhr = [select id , name, loaction__c from hiring_manager__c where loaction__c in ( 'hyderabad' , 'chennai' , 'banglore')];
    
    system.debug(newhr);
    
}

}