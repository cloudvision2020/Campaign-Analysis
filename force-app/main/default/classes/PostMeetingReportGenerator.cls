public with sharing class PostMeetingReportGenerator {
    
    @future(callout=true)
    public static void generatePostMeetingReports(List<id> noteIds) {
        List<Note__c> notes = [SELECT Id, Notes__c FROM Note__c WHERE Id = :noteIds ];

        for(Note__c note : notes) {
            
            Pagereference postMeetingReport = new Pagereference('/apex/PostMeetingReportController');
            postMeetingReport.getParameters().put('id', note.Id);
            note.Notes__c = Test.isRunningTest() ? 'Test Content' : postMeetingReport.getContent().toString();
        }
        ProcessorControl.inFutureContext = true;

        update notes;
    }

}