public with sharing class AcknowledgementBatchProcess {
    
    @InvocableMethod(label='Merge multiple Donations by Account and Campaign ID')
    public static void mergeDonations(List<Id> acknowledgementBatchId) {
        Acknowledgement_Batch__c ackBatch = [SELECT Id, Start_Date__c, End_Date__c From Acknowledgement_Batch__c WHERE Id = :acknowledgementBatchId LIMIT 1];
        Database.executeBatch(new BatchAcknowledgmentProcess(ackBatch.Id, ackBatch.Start_Date__c, ackBatch.End_Date__c),50);
    }
}