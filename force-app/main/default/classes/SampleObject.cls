public class SampleObject {
    public static void sampleData(List<SampleObject__c> sampData){
        for(SampleObject__c sam :sampData){
            if(sam.Email__c != NULL){
                sam.Object_Status__c = 'Completed';
            }
        }
    }
}