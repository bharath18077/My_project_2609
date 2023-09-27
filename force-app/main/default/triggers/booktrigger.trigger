trigger booktrigger on book__c (before insert ) 
{ 
    bookclass.applydiscount(trigger.new);
}