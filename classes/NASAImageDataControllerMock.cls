@isTest
public class NASAImageDataControllerMock implements HttpCalloutMock {
    // Implementing HttpCalloutMock interface
    public HTTPResponse respond(HTTPRequest req) {
        // Create a new http response to return
        HttpResponse res = new HttpResponse();
        // Set status code to success
        res.setStatusCode(200);
        // Set response body to sample JSON data
        res.setBody('{"date":"2023-02-11","media_type":"image","explanation":"A beautiful image of the universe.","url":"https://example.com/image.jpg","title":"Universe","copyright":"Copyright"}');
        return res;
    }
}
