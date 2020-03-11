public with sharing class LIBriefingController {

    private final Account account;    

    public LIBriefingController(ApexPages.StandardController stdController){
        this.account = (Account)stdController.getRecord();

        if(!Test.isRunningTest()) {
            Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename=Briefing - '+ this.account.Primary_Addressee__c+'.pdf');
        }
    }

    public List<npsp__Address__c> getAddresses() {
        return [SELECT npsp__Address_Type__c, npsp__Formula_MailingAddress__c FROM npsp__Address__c WHERE npsp__Household_Account__c = :this.account.Id Order By npsp__Default_Address__c];
    }

    public List<Lead> getEmails(){
        return [SELECT Email, Email_State__c FROM Lead WHERE Account__c = :this.account.Id Order By Contact__r.npsp__Primary_Contact__c];
    }

    public List<Phone_Number__c> getPhoneNumbers(){
        return [SELECT Type__c, Number__c FROM Phone_Number__c WHERE Account__c = :this.account.Id Order By Contact__r.npsp__Primary_Contact__c];
    }

    public List<Opportunity> getGifts(){
        return [SELECT CloseDate, Amount, Campaign_Description_Formula__c, Signer__c FROM Opportunity WHERE AccountId = :this.account.Id Order By CloseDate DESC];
    }

    public List<Task> getTasks() {
        return [SELECT Subject, ActivityDate, Owner.Name FROM Task WHERE WhatId = :this.account.Id AND ActivityDate >= :Date.today()];
    }

    public List<Event> getEvents(){
        return [SELECT Subject, StartDateTime, Owner.Name FROM Event WHERE WhatId = :this.account.Id AND StartDateTime >= :Date.today()];
    }

    public List<Note__c> getNotes(){
        return [SELECT Subject__c, Date__c, Notes__c, Created_By__c FROM Note__c WHERE Account__c = :this.account.Id Order By Date__c DESC];
    }
}