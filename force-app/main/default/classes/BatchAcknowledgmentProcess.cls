public class BatchAcknowledgmentProcess implements Database.Batchable<sObject>, Database.stateFul {

    public final Id acknowledgementBatchId;
    public final Date startDate;
    public final Date endDate;

    public BatchAcknowledgmentProcess(Id acknowledgementBatchId, Date startDate, Date endDate) {
        this.acknowledgementBatchId = acknowledgementBatchId;
        this.startDate = startDate;
        this.endDate = endDate;

    }

    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator([SELECT Id, CampaignId, AccountId, Acknowledgement_Batch__c, Campaign.Acknowledgement_Letter__c FROM Opportunity WHERE CloseDate >= :startDate AND CloseDate <= :endDate AND Exclude_from_Acknowledgements__c = false ORDER BY AccountId, CampaignID ASC]);
    }

    public void execute(Database.BatchableContext BC, List<Opportunity> scope) {
        Map<String, List<Opportunity>> multipleDonationsForBatchByAccountAndCampaignId = new Map<String, List<Opportunity>>();

        Set<Id> accounts = new Set<Id>();
        Map<String, Acknowledgement__c> acknowledgementMap = new Map<String, Acknowledgement__c>();

        // Group Donations by Account and Campaign
        for(Opportunity gift: scope){
            
            if(gift.AccountId != NULL && gift.CampaignId != NULL){
                String uniqueKey = gift.AccountId+''+gift.CampaignId;
                List<Opportunity> gifts = new List<Opportunity>{gift};
                
                // Gather all account id's for this run
                accounts.add(gift.AccountId);

                if(multipleDonationsForBatchByAccountAndCampaignId.containsKey(uniqueKey)){
                    gifts.addAll(multipleDonationsForBatchByAccountAndCampaignId.get(uniqueKey));
                } else {
                    // Only create an acknowledement for Unique Account and Campaign combinations
                    acknowledgementMap.put(uniqueKey,
                            new Acknowledgement__c(
                                Account__c = gift.AccountId, 
                                Campaign__c = gift.CampaignId, 
                                Acknowledgement_Batch__c = this.acknowledgementBatchId,
                                Acknowledgement_Letter__c = gift.Campaign.Acknowledgement_Letter__c)
                        );
                }

                multipleDonationsForBatchByAccountAndCampaignId.put(uniqueKey, gifts);
            }
        }

        for(Acknowledgement__c ack : [SELECT Id, Account__c, Campaign__c, Acknowledgement_Batch__c, Acknowledgement_Letter__c FROM Acknowledgement__c WHERE Account__c = :accounts AND Acknowledgement_Batch__c = :acknowledgementBatchId ORDER BY Account__c, Campaign__c ASC]) {
            if(acknowledgementMap.containsKey(ack.Account__c+''+ack.Campaign__c)) {
                acknowledgementMap.put(ack.Account__c+''+ack.Campaign__c, ack);
            }
        }
        
        List<Acknowledgement__c> acknowledgements = acknowledgementMap.values();

        // Create unique Acknowledgements by Account and Campaign ID
        if(acknowledgements.size() > 0) {
            upsert acknowledgements;
        }


        // Update all Donations with the Acknowledgement Id
        // by Account and Campaign Id
        List<Opportunity> opptysToUpdate = new List<Opportunity>();
        for(Acknowledgement__c acknowledgement: acknowledgements) {
            String accountWithCampaignKey = acknowledgement.Account__c+''+acknowledgement.Campaign__c;
            if(multipleDonationsForBatchByAccountAndCampaignId.containsKey(accountWithCampaignKey)){
                for(Opportunity gift: multipleDonationsForBatchByAccountAndCampaignId.get(accountWithCampaignKey)){
                    gift.Acknowledgement__c = acknowledgement.Id;
                    gift.Acknowledgement_Batch__c = this.acknowledgementBatchId;
                    opptysToUpdate.add(gift);
                }
            }
        }

        // Complete donation merge process
        if(opptysToUpdate.size() > 0) {
            update opptysToUpdate;
        }
    }

    public void finish(Database.BatchableContext BC) {

        // Update status of the Acknowledgement Batch
        List<Acknowledgement_Batch__c> acknowledgementBatches = [SELECT ID, Status__c From Acknowledgement_Batch__c WHERE Id = :acknowledgementBatchId];
        for(Acknowledgement_Batch__c b: acknowledgementBatches) {
            b.Status__c = 'Completed';
        }

        update acknowledgementBatches;
    }
}