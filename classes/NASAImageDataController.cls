// Apex class to retrieve NASA image data and store in Salesforce
public with sharing class NASAImageDataController {
    // Make accessible as remote controller in Lightning Components, cacheable=false to allow for DML statement
    @AuraEnabled(cacheable=false)
    // User inputs a specified date to pull picture
    public static String getNASAImageData(String picDate) {
        // Create request to grab images
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        // NASA API endpoint for image, url saved in named credentials so using callout and adding user inputted date
        String endpoint = 'callout:NASA_Daily_Image?api_key=O66AOpd9kKbclKSiBFVPofzO233rz3uGf2MbHhNf&date=' + picDate;
        req.setEndpoint(endpoint);
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        // Continue if successful response
        if (res.getStatusCode() == 200) {
            // Deserialize JSON
            Map<String, Object> response = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            List<NASAImage__c> image = new List<NASAImage__c>();
            // Insert image data into custom object
            for (String key : response.keySet()) {
                if (key == 'date') {
                    // Convert Date to required format
                    Date image_date = Date.valueOf((String) response.get(key));
                    image.add(new NASAImage__c(
                        Date__c = image_date,
                        Media_Type__c = (String) response.get('media_type'),
                        Description__c = (String) response.get('explanation'),
                        URL__c = (String) response.get('url'),
                        Name = (String) response.get('title'),
                        Copyright__c = (String) response.get('copyright')
                    ));
                }
            }
            // DML statement
            upsert image Name;
            // Return json body;
            return res.getBody();
        }
        // Return null if http request fails
        return null;
    }
}