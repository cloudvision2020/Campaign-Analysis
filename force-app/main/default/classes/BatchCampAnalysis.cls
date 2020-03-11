global class BatchCampAnalysis implements Database.Batchable<sObject>{

    global final String Query;
    global final String AppealFrom;
    global final String AppealTo;
    global final String AppealId;
 
    global BatchCampAnalysis(String q, String af, String at, String ai){
 
       Query=q; AppealFrom=af; AppealTo= at ; AppealId=ai;
       system.System.debug('execute q '+q);
       system.System.debug('AppealId q '+AppealId);
    }
 
    global Database.QueryLocator start(Database.BatchableContext BC){
       return Database.getQueryLocator(query);
    }
 
    global void execute(Database.BatchableContext BC, List<Campaign> scope){
        Set<Id> campaignIds = new Set<Id>();
        system.System.debug('execute'+scope);
        for(Campaign c : scope){
            campaignIds.add(c.Id);        
        }
        AggregateResult[] groupedResults = [SELECT CampaignId, COUNT(Id)noOfGifts, SUM(Amount)sumGifts, 
                                            SUM(X1000_Donor__c)total1000, SUM(X500_999_Donor__c)total500, 
                                            SUM(X250_499_Donor__c)total250, SUM(X100_249_Donor__c)total100, 
                                            SUM(X50_99_Donor__c)total50, SUM(X25_49_Donor__c)total25, 
                                            SUM(X1_24_Donor__c)total1 FROM Opportunity 
                                            WHERE CampaignId = :campaignIds
                                            and Appeal_ID__c like :AppealId
                                            GROUP BY CampaignId] ;
        
        List<Campaign> campignsToUpdate = new List<Campaign>();
        
        for (AggregateResult ar : groupedResults)  {
            campignsToUpdate.add(new Campaign(
                Id = (Id)ar.get('CampaignId'),
                Total_Donations__c = (Decimal)ar.get('noOfGifts'),
                Donations__c = (Decimal)ar.get('sumGifts'),
                X1_000_Donors__c = (Decimal)ar.get('total1000'),
                X500_999_Donors__c = (Decimal)ar.get('total500'),
                X250_499_Donors__c = (Decimal)ar.get('total250'),
                X100_249_Donors__c = (Decimal)ar.get('total100'),
                X59_99_Donors__c = (Decimal)ar.get('total50'),
                X25_49_Donors__c = (Decimal)ar.get('total25'),
                X1_24_Donors__c = (Decimal)ar.get('total1')
            ));
            
        }
        
        if(campignsToUpdate.size() > 0)
            update campignsToUpdate;
     }
 
    global void finish(Database.BatchableContext BC){
        system.System.debug('finishhhhhh');
        Campaign_Analysis_Event__e te = new Campaign_Analysis_Event__e ();
        te.Status__c  = 'Success Value';
        Database.SaveResult sr = EventBus.publish(te);
    }
 }