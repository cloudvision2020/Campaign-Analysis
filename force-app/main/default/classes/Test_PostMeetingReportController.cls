@IsTest
private class Test_PostMeetingReportController {
    @testSetup static void setup() {
        
        insert new Account(Name = 'TestAccount');

        Account aTestAccount = [SELECT Id From Account LIMIT 1];

        List<Note__c> testNotes = new List<Note__c>();
        for(Integer i=0;i<25;i++) {
            testNotes.add(new Note__c(
            Notes__c = 'Test Data'+i,
            Subject__c = 'Note',
            Type__c = 'Post Meeting Report',
            Date__c = Date.today(),
            Account__c = aTestAccount.id
            ));
        }
        insert testNotes;        
    }

    @isTest
    static void TestGetAccount()
    {
        Note__c note = [SELECT Id FROM Note__c LIMIT 1];
        
        Test.startTest();
        PostMeetingReportController cont = new PostMeetingReportController();
        cont.noteId = note.id;
        Account account = cont.getAccount();
        Test.stopTest();

        System.assertNotEquals(null, account);

    }

    @isTest
    static void TestGetNote()
    {
        Note__c note = [SELECT Id FROM Note__c LIMIT 1];
        
        Test.startTest();
        PostMeetingReportController cont = new PostMeetingReportController();
        cont.noteId = note.id;
        Note__c controllerNote = cont.getNote();
        Test.stopTest();

        System.assertNotEquals(null, controllerNote);
    }
}