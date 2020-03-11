@IsTest
private class Test_PostMeetingReportGenerator {
    
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
    static void TestPostMeetingReportGenerator()
    {
        Note__c note = [SELECT Id FROM Note__c WHERE Type__c = 'Post Meeting Report' LIMIT 1];

        test.startTest();
        update note;

        test.stopTest();

        Note__c updatedNote = [SELECT Notes__c FROM Note__c WHERE id = :note.Id];
        Boolean containsDevo = updatedNote.Notes__c.contains('Test Content');
        System.assertEquals(true, containsDevo);
    }

}