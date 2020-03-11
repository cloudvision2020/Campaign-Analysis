public with sharing class NotesDailyEmailController {

    public List<Note__c> getNotes() {

        DateTime startDateTime = DateTime.newInstance(Date.today().addDays(-1), Time.newInstance(20, 0, 0, 0));
        DateTime endDateTime = DateTime.newInstance(Date.today(), Time.newInstance(20, 0, 0, 0));

        return [SELECT 
                    Created_By__c, 
                    Date__c, 
                    Notes__c,
                    Report_Status__c, 
                    Subject__c, 
                    Type__c, 
                    Account__c,
                    Account__r.BillingCity, 
                    Account__r.BillingState, 
                    Account__r.Caseload_Priority__c, 
                    Account__r.Constituent_ID__c, 
                    Account__r.First_Gift_Summary__c, 
                    Account__r.Largest_Gift_Summary__c, 
                    Account__r.LI_Account_Naming_Convention__c, 
                    Account__r.Most_Recent_Gift_Summary__c, 
                    Account__r.Owner.Name, 
                    Account__r.npo02__OppAmountLastYear__c, 
                    Account__r.npo02__OppAmountThisYear__c,  
                    Account__r.Primary_Addressee__c
                FROM Note__c 
                WHERE 
                    (
                        CreatedDate > :startDateTime 
                        AND CreatedDate <= :endDateTime 
                        AND Type__c <> 'Post Meeting Report'
                    ) 
                    OR 
                    (
                        Type__c = 'Post Meeting Report' 
                        AND Report_Status__c = 'Submitted' 
                        AND Post_Meeting_Report_Submission_Time__c > :startDateTime 
                        AND Post_Meeting_Report_Submission_Time__c <= :endDateTime
                    ) 
                ORDER BY CreatedBy.Name];
    }

    public List<AggregateResult> NotesSummary{
        get {
            DateTime startDateTime = DateTime.newInstance(Date.today().addDays(-1), Time.newInstance(20, 0, 0, 0));
            DateTime endDateTime = DateTime.newInstance(Date.today(), Time.newInstance(20, 0, 0, 0));

            return [SELECT 
                        CreatedBy.Name createdByName, 
                        count(id) notestoday
                    FROM Note__c 
                    WHERE 
                        (
                            CreatedDate > :startDateTime 
                            AND CreatedDate <= :endDateTime 
                            AND Type__c <> 'Post Meeting Report'
                        ) 
                        OR 
                        (
                            Type__c = 'Post Meeting Report' 
                            AND Report_Status__c = 'Submitted' 
                            AND Post_Meeting_Report_Submission_Time__c > :startDateTime 
                            AND Post_Meeting_Report_Submission_Time__c <= :endDateTime
                        ) 
                    GROUP BY CreatedBy.Name
                    ORDER BY CreatedBy.Name];
        }
        set;
        
    }
}