trigger SampleObjectStatusTrigger on SampleObject__c (before insert, before update) {
    if(trigger.isBefore && trigger.isInsert){
        SampleObject.sampleData(trigger.new);
    }
}