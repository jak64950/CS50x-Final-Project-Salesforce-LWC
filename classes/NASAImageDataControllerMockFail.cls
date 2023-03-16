@isTest
public class NASAImageDataControllerMockFail implements HttpCalloutMock {
    // Implementing HttpCalloutMock interface
    public HTTPResponse respond(HTTPRequest req) {
        // Create a new http response to return
        HttpResponse res = new HttpResponse();
        // Set status code to success
        res.setStatusCode(500);
        // Set response body to sample JSON data
        res.setBody('');
        return res;
    }
}
