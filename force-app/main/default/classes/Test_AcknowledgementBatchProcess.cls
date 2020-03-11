@IsTest
private class Test_AcknowledgementBatchProcess {
    
    @TestSetup
    static void buildData(){
        List<Account> accounts = new List<Account> {
                new Account(name = 'Salesforce.com'),
                new Account(name = 'Google.com'), 
                new Account(name = 'Microsoft.com')
            };

        insert accounts;

        List<Acknowledgement_Letter__c> acknowledgementLetters = new List<Acknowledgement_Letter__c> {
                new Acknowledgement_Letter__c(name = 'Annual Conference'),
                new Acknowledgement_Letter__c(name = 'Stakeholder Meeting'),
                new Acknowledgement_Letter__c(name = 'Monthly Meeting')
            };
        
        insert acknowledgementLetters;

        List<Campaign> campaigns = new List<Campaign> {
                new Campaign(name = '2019 Conference', LI_Description__c = '2019 Conference', Acknowledgement_Letter__c = acknowledgementLetters[0].id),
                new Campaign(name = 'Stakeholder Meeting', LI_Description__c = 'Stakeholder Meeting', Acknowledgement_Letter__c = acknowledgementLetters[1].id),
                new Campaign(name = 'Monthly Meeting', LI_Description__c = 'Monthly Meeting', Acknowledgement_Letter__c = acknowledgementLetters[2].id)
            };
        
        insert campaigns;
        
        List<Contact> contacts = new List<Contact> {
                new Contact (FirstName = 'Marc', LastName = 'Benioff', AccountId = accounts[0].id),
                new Contact (FirstName = 'Keith', LastName = 'Block', AccountId = accounts[0].id),
                new Contact (FirstName = 'Larry', LastName = 'Page', AccountId = accounts[1].id),
                new Contact (FirstName = 'Sergey', LastName = 'Brin', AccountId = accounts[1].id),
                new Contact (FirstName = 'Satya', LastName = 'Nadela', AccountId = accounts[2].id)
            };
        
        insert contacts;

        Acknowledgement_Batch__c acknowledgementBatch = new Acknowledgement_Batch__c(name = 'Test Batch', Start_Date__c = Date.Today(), End_Date__c = Date.Today());

        insert acknowledgementBatch;

        RecordType rt = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND Name = 'Donation' Limit 1];

        List<Opportunity> opportunities = new List<Opportunity> {
                new Opportunity(AccountId = accounts[0].id, Amount = 200, RecordTypeId = rt.id, npsp__Primary_Contact__c = contacts[0].id, CampaignId = campaigns[0].id, name = 'First', StageName = 'Closed Won', CloseDate = Date.today()),
                new Opportunity(AccountId = accounts[0].id, Amount = 300, RecordTypeId = rt.id, npsp__Primary_Contact__c = contacts[0].id, CampaignId = campaigns[0].id, name = 'Second', StageName = 'Closed Won', CloseDate = Date.today()),
                new Opportunity(AccountId = accounts[0].id, Amount = 200, RecordTypeId = rt.id, npsp__Primary_Contact__c = contacts[1].id, CampaignId = campaigns[0].id, name = 'Third', StageName = 'Closed Won', CloseDate = Date.today()),
                new Opportunity(AccountId = accounts[1].id, Amount = 400, RecordTypeId = rt.id, npsp__Primary_Contact__c = contacts[2].id, CampaignId = campaigns[1].id, name = 'Fourth', StageName = 'Closed Won', CloseDate = Date.today()),
                new Opportunity(AccountId = accounts[1].id, Amount = 200, RecordTypeId = rt.id, npsp__Primary_Contact__c = contacts[3].id, CampaignId = campaigns[1].id, name = 'Fifth', StageName = 'Closed Won', CloseDate = Date.today()),
                new Opportunity(AccountId = accounts[2].id, Amount = 20, RecordTypeId = rt.id, npsp__Primary_Contact__c = contacts[4].id, CampaignId = campaigns[2].id, name = 'Sixth', StageName = 'Closed Won', CloseDate = Date.today())
            };

        insert opportunities;

        
    }

    @IsTest
    static void testMergeDonations(){
        
        Acknowledgement_Batch__c acknowledgementBatch = [Select Id, Start_Date__c, End_Date__c From Acknowledgement_Batch__c LIMIT 1];

        Test.startTest();
            Database.executeBatch(new BatchAcknowledgmentProcess(acknowledgementBatch.Id, acknowledgementBatch.Start_Date__c, acknowledgementBatch.End_Date__c));
        Test.stopTest();

        List<Acknowledgement__c> acknowledgments = [Select Id, Account__c, Campaign__c, Acknowledgement_Letter__c From Acknowledgement__c];
            
        // We should have 3 Acknowledgements
        System.assertEquals(3, acknowledgments.size());
        
    }
}