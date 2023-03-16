public class NASAImageSchedulerHelper {
    @future(callout=true)
    public static void createNASAImageCustomObject() {
        // Convert today's date to required format
        Date today = Date.today();
        String year = String.valueOf(today.year());
        String month = String.valueOf(today.month());
        String day = String.valueOf(today.day());
        // Not necessary, but add 0 for number 1,2,3...
        if (day.length() < 2) {
            day = '0' + day;
        }
        if (month.length() < 2) {
            month = '0' + month;
        }
        String s = year + '-' + month + '-' + day;
        NASAImageDataController.getNASAImageData(s);
    }
}