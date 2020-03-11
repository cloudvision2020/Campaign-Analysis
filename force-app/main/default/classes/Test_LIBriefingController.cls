@IsTest
private class Test_LIBriefingController {

    @TestSetup static void setup(){

        // NPSP Household Account will be created as part of this Contact creation
        insert new Contact(FirstName = 'Test', LastName = 'Data');
        
        Account aTestAccount = [SELECT Id FROM Account LIMIT 1];

        Contact aTestContact = [SELECT Id FROM Contact LIMIT 1];

        insert new Note__c(
            Notes__c = 'Test Data',
            Subject__c = 'Note',
            Type__c = 'Post Meeting Report',
            Date__c = Date.today(),
            Account__c = aTestAccount.id
        );

        insert new npsp__Address__c(
            npsp__Household_Account__c = aTestAccount.id,
            npsp__MailingStreet__c = '3200 Riva Ridge Test',
            npsp__MailingCity__c = 'Austin',
            npsp__MailingState__c = 'TX',
            npsp__MailingPostalCode__c = '78746-1423'
        );

        insert new Lead(
            Account__c = aTestAccount.id, 
            Email = 'a@a.com', 
            Company = 'Test Company',
            LastName = 'Data'
        );
            
        insert new Phone_Number__c(
            Account__c = aTestAccount.id,
            Number__c = '999-999-9999',
            Type__c = 'Home'
        );
            
        RecordType rt = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND Name = 'Donation' Limit 1];

        insert new Opportunity(
            AccountId = aTestAccount.id, 
            Amount = 200, 
            RecordTypeId = rt.id, 
            npsp__Primary_Contact__c = aTestContact.id, 
            name = 'First', 
            StageName = 'Closed Won', 
            CloseDate = Date.today()
        );
        
        insert new Task(
            ActivityDate = Date.today().addDays(1),
            WhatId = aTestAccount.id,
            WhoId = aTestContact.id,
            Subject = 'Test Task'
        );

        insert new Event(
            ActivityDate = Date.today().addDays(1),
            WhatId = aTestAccount.id,
            WhoId = aTestContact.id,
            StartDateTime = DateTime.now().addDays(2),
            DurationInMinutes = 60
        );
        
    }

    @isTest
    static void TestGetAddresses()
    {
        Account acct = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController stdAcct = new ApexPages.StandardController(acct);
        LIBriefingController liBriefingController = new LIBriefingController(stdAcct);
        
        List<npsp__Address__c> addresses = liBriefingController.getAddresses();

        System.assertEquals(1, addresses.size());
    }

    @isTest
    static void TestGetEmails()
    {
        Account acct = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController stdAcct = new ApexPages.StandardController(acct);
        LIBriefingController liBriefingController = new LIBriefingController(stdAcct);
        
        List<Lead> emails = liBriefingController.getEmails();

        System.assertEquals(1, emails.size());
    }

    @isTest
    static void TestGetPhoneNumbers()
    {
        Account acct = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController stdAcct = new ApexPages.StandardController(acct);
        LIBriefingController liBriefingController = new LIBriefingController(stdAcct);
        
        List<Phone_Number__c> numbers = liBriefingController.getPhoneNumbers();

        System.assertEquals(1, numbers.size());
    }

    @isTest
    static void TestGetGifts()
    {
        Account acct = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController stdAcct = new ApexPages.StandardController(acct);
        LIBriefingController liBriefingController = new LIBriefingController(stdAcct);
        
        List<Opportunity> gifts = liBriefingController.getGifts();

        System.assertEquals(1, gifts.size());
    }

    @isTest
    static void TestGetTasks()
    {
        Account acct = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController stdAcct = new ApexPages.StandardController(acct);
        LIBriefingController liBriefingController = new LIBriefingController(stdAcct);
        
        List<Task> tasks = liBriefingController.getTasks();

        System.assertEquals(1, tasks.size());
    }

    @isTest
    static void TestGetEvents()
    {
        Account acct = [SELECT Id FROM Account LIMIT 1];
        ApexPages.StandardController stdAcct = new ApexPages.StandardController(acct);
        LIBriefingController liBriefingController = new LIBriefingController(stdAcct);
        
        List<Event> events = liBriefingController.getEvents();

        System.assertEquals(1, events.size());
    }
    
}