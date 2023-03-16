@IsTest
private class NASAImageDataControllerTest {
    
    @IsTest
    static void testGetNASAImageData() {        
        Test.startTest();
        // Create mock HTTP callout
        Test.setMock(HttpCalloutMock.class, new NASAImageDataControllerMock());        
        // Call the method with a valid date
        String result = NASAImageDataController.getNASAImageData('2023-02-11');        
        Test.stopTest();        
        // Verify that the method returns the correct JSON response
        System.assertEquals('{"date":"2023-02-11","media_type":"image","explanation":"A beautiful image of the universe.","url":"https://example.com/image.jpg","title":"Universe","copyright":"Copyright"}', result);       
        // Verify that the correct number of records were upserted into the custom object
        List<NASAImage__c> records = [SELECT Id, Date__c, Media_Type__c, Description__c, URL__c, Name, Copyright__c FROM NASAImage__c];
        System.assertEquals(1, records.size());        
        // Verify that the record upserted into the custom object has the correct field values
        NASAImage__c record = records[0];
        System.assertEquals(Date.valueOf('2023-02-11'), record.Date__c);
        System.assertEquals('image', record.Media_Type__c);
        System.assertEquals('A beautiful image of the universe.', record.Description__c);
        System.assertEquals('https://example.com/image.jpg', record.URL__c);
        System.assertEquals('Universe', record.Name);
        System.assertEquals('Copyright', record.Copyright__c);
    }
    
    @IsTest
    static void testGetNASAImageDataWithInvalidDate() {        
        Test.startTest();
        // Create mock HTTP callout
        Test.setMock(HttpCalloutMock.class, new NASAImageDataControllerMockFail());        
        // Call the method with an invalid date
        String result = NASAImageDataController.getNASAImageData('invalid-date');        
        Test.stopTest();        
        // Verify that the method returns null
        System.assertEquals(null, result);
    }
}
