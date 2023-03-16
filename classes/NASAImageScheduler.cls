public class NASAImageScheduler implements Schedulable {
    public void execute(SchedulableContext sc) {
        NASAImageSchedulerHelper.createNASAImageCustomObject();
    }
}
