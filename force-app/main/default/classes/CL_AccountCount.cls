public class CL_AccountCount {
    public static void createContact(){
    
    Account acc = new Account(Name='Ruth',Phone='1234567898032');
    insert acc;
        Contact con = new Contact(LastName='Arundhati',AccountId=acc.id);
        insert con;
        
    }

}