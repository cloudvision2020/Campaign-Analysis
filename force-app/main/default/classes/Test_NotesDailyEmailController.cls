@IsTest
private class Test_NotesDailyEmailController {
    @testSetup static void setup() {
        
        insert new Account(Name = 'TestAccount');

        Account aTestAccount = [SELECT Id From Account LIMIT 1];

        List<Note__c> testNotes = new List<Note__c>();
        for(Integer i=0;i<25;i++) {
            testNotes.add(new Note__c(
            Notes__c = 'Test Data'+i,
            Subject__c = 'Note',
            Type__c = 'Note',
            Date__c = Date.today(),
            Account__c = aTestAccount.id
            ));
        }
        insert testNotes;  

        Time midnightTime = Time.newInstance(0, 0, 0, 0);
        DateTime lastCreatedDate = DateTime.newInstance(Date.today(), midnightTime);

        for(Note__c note: testNotes) {
            Test.setCreatedDate(note.id, lastCreatedDate);
        }      
    }

    @isTest
    static void TestGetNotes()
    {
        Note__c note = [SELECT CreatedDate FROM Note__c LIMIT 1];

        System.Debug(note.CreatedDate);
        Test.startTest();
        NotesDailyEmailController cont = new NotesDailyEmailController();
        List<Note__c> notes = cont.getNotes();
        Test.stopTest();

        System.assertEquals(25, notes.size());

    }
}