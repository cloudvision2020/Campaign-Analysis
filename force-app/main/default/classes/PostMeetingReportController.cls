// Developer by Drashti 
public with sharing class PostMeetingReportController {

    public String noteId            {get; set;}
    private Account account = new Account();
    private Note__c note = new Note__c();

    public Account getAccount() {
        note = [SELECT Account__c FROM Note__c WHERE Id = :noteId];

        account = [SELECT Primary_Addressee__c, Biography__c, Constituent_ID__c, BillingCity, BillingState, npo02__NumberOfClosedOpps__c, npo02__TotalOppAmount__c, Largest_Gift_Summary__c, npo02__AverageAmount__c, First_Gift_Summary__c, Most_Recent_Gift_Summary__c, Moves_Management_Strategy__c, Primary_Reason_for_Giving__c, Owner.Name FROM Account WHERE Id = :note.Account__c];

        return account;
    }

    public Note__c getNote() {
        note = [SELECT Visit_Setting__c, Visit_Goal__c, Stage_of_Donor_Cycle__c, Main_Points__c, Action_Items__c FROM Note__c WHERE Id = :noteId];

        return note;
    }

    
}