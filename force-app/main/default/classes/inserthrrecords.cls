public class inserthrrecords 
{ 
    public static void insertrecords()
    {
        list<hiring_manager__c> lstcombinedhr = new list<hiring_manager__c>();
        for(integer i=1 ; i<=100 ; i++)
        {
            hiring_manager__c newhr = new hiring_manager__c();
            newhr.Name = 'name';
            newhr.current_ctc__c = 12527;
            newhr.email_id__c = 'bharath@gmail.com';
            newhr.contact_number__c = '9542816283';
            
            
           
            lstcombinedhr.add(newhr);
            
            
        }
        
        if(!lstcombinedhr.isempty())
            insert lstcombinedhr ;
    }
    public static void deletehrrecords()
    {
        list<hiring_manager__c> newhr = [select id , name from hiring_manager__c where name = 'name'];
        if(!newhr.isempty())
        {
            delete newhr;
        }
    }
    public static void undeletehrrecords()
    {
        undelete[select id , name , isdeleted from hiring_manager__c where name = 'name'  and isdeleted = true all rows];
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}