@isTest
public class SampleObjectTest {
    @isTest
    static void testSampleObjectStatusTrigger() {
        // Create test data
        List<SampleObject__c> sampData = new List<SampleObject__c>();
        SampleObject__c sample1 = new SampleObject__c();
        sample1.Email__c = 'test1@example.com';
        sampData.add(sample1);
        
        SampleObject__c sample2 = new SampleObject__c();
        sampData.add(sample2);
        
        // Insert the test records
        insert sampData;
        
        // Verify that the Object_Status__c field is updated correctly
        sample1 = [SELECT Object_Status__c FROM SampleObject__c WHERE Id = :sample1.Id];
        System.assertEquals('Completed', sample1.Object_Status__c, 'Object_Status__c should be set to "Completed"');
        
        sample2 = [SELECT Object_Status__c FROM SampleObject__c WHERE Id = :sample2.Id];
        System.assertEquals(null, sample2.Object_Status__c, 'Object_Status__c should be null');
    }    
}