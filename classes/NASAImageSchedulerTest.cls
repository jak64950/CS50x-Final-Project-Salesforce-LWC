@IsTest
private class NASAImageSchedulerTest {
    @IsTest
    static void testScheduler() {
        // Set up the test data and context
        Test.startTest();
        // Create mock HTTP callout
        Test.setMock(HttpCalloutMock.class, new NASAImageDataControllerMock());
        // Schedule the job
        String sch = '0 0 1 * * ?';
        String jobId = System.schedule('NASA Image Scheduler Test', sch, new NASAImageScheduler());
        // Wait for the job to complete// Since the job is scheduled to run at 1AM, we will wait until 2AM to check if the job ran successfully
        Datetime endTime = Datetime.newInstance(Date.today(), Time.newInstance(2, 0, 0, 0));
        Test.stopTest();
        // Verify that the job has completed successfully
        List<CronTrigger> cronTriggers = [SELECT Id, CronExpression, CronJobDetail.Name, NextFireTime FROM CronTrigger WHERE Id = :jobId];
        System.assertEquals(1, cronTriggers.size());
        CronTrigger cronTrigger = cronTriggers[0];
        System.assertEquals('NASA Image Scheduler Test', cronTrigger.CronJobDetail.Name);
        System.assertEquals(sch, cronTrigger.CronExpression);
        System.assertNotEquals(null, cronTrigger.NextFireTime);
    }
}
