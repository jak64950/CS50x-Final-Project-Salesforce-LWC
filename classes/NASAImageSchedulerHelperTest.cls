@isTest
private class NASAImageSchedulerHelperTest {
    @isTest
    static void testCreateNASAImageCustomObject() {
        Test.startTest();
        // Create mock HTTP callout
        Test.setMock(HttpCalloutMock.class, new NASAImageDataControllerMock());        
        // Call the future method
        NASAImageSchedulerHelper.createNASAImageCustomObject();        
        Test.stopTest();
        // Verify that the correct number of records were upserted into the custom object
        List<NASAImage__c> records = [SELECT Id FROM NASAImage__c];
        System.assertEquals(1, records.size());
    }
}