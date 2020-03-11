public without sharing class CampaignAnalysisController {
    
/*
2.       Campaign ID - Name

3.       List Name - Mailing_List__c

4.       Select - List_Select__c

5.       # Solicited - NumberSent

6.       Start Date - StartDate

 

From related Gifts:

7.       # of Gifts - count(Opportunity.Id) - Total_Number_of_Donations_Received__c

8.       $ Amount of Gifts  - sum(Opportunity.Amount) - Donations__c

 

Calculated:

9.       Response Rate (# Gifts / # Solicited) - count(Opportunity.Id) / NumberSent - Response_Rate

10.   Avg. Gift ($ Gifts / # Gifts) - sum(Opportunity.Amount)/count(Opportunity.Id) - Average_Gifts

11.   In / Out ($ Gifts / $ Cost) - sum(Opportunity.Amount) / Total_Cost_of_Campaign__c - In_Out__c

12.   Total Cost (Calculated from Campaign Table fields: Postage Cost + Non-Postage Cost + Postage Discount) - Total_Cost_of_Campaign__c

13.   Cost / Piece ($ Cost / # Solicited) - Total_Cost_of_Campaign__c / NumberSent - Cost_Per_Piece__c

14.   Net Cost / Donor [ ($ Expense - $ Gifts) / # Gifts ] - Net_Cost_Donor__c

 

Filtered from Gifts related to Campaign:

15.   $1,000+ Donors - sum(Opportunity.X1000_Donor__c) - X1_000_Donors__c

16.   $500-$999 Donors - sum(Opportunity.X500_999_Donor__c) - X500_999_Donors__c

17.   $250-$499 Donors - sum(Opportunity.X250_499_Donor__c) - X250_499_Donors__c

18.   $100-$249 Donors - sum(Opportunity.X100_249_Donor__c) - X100_249_Donors__c

19.   $59-$99 Donors - sum(Opportunity.X50_99_Donor__c) - X59_99_Donors__c

20.   $25-$49 Donors - sum(Opportunity.X25_49_Donor__c) - X25_49_Donors__c

21.   $1-$24 Donors - sum(Opportunity.X1_24_Donor__c) - X1_24_Donors__c

 

From Campaign:

22.   Signer - Signer__c

23.   Carrier Postage - Postage_Type__c

24.   Carrier Size - Carrier_Size__c

25.   Reply Postage - Reply_Postage_Type__c

26.   Double Sided - Double_Sided__c

27.   Channel - Channel__c

28.   Detail Channel - Detail_Channel__c
*/


@AuraEnabled(cacheable=true)
public static List<Campaign> getCampaignList() {

    return [SELECT Id, Name, Mailing_List__c, List_Select__c, NumberSent, StartDate, Total_Cost_of_Campaign__c, Signer__c, Postage_Type__c, Carrier_Size__c, Reply_Postage_Type__c, Double_Sided__c, Channel__c, Detail_Channel__c,
    Total_Number_of_Donations_Received__c, Donations__c, Response_Rate__c, Average_Gifts__c, In_Out__c, Cost_Per_Piece__c, Net_Cost_Donor__c, X1_000_Donors__c, X500_999_Donors__c, X250_499_Donors__c, X100_249_Donors__c,
    X59_99_Donors__c, X25_49_Donors__c, X1_24_Donors__c FROM Campaign LIMIT 1000];
}

    /*@AuraEnabled(cacheable=true)
    public static Map<Id, Map<String,Object>> getCampaignList() {

        Map<Id, Campaign> campaigns = new Map<Id, Campaign>([SELECT Id, Name, Mailing_List__c, List_Select__c, NumberSent, StartDate, Total_Cost_of_Campaign__c, Signer__c, Postage_Type__c, Carrier_Size__c, Reply_Postage_Type__c, Double_Sided__c, Channel__c, Detail_Channel__c FROM Campaign LIMIT 100]);

        AggregateResult[] groupedResults = [SELECT CampaignId, COUNT(Id)noOfGifts, SUM(Amount)sumGifts, AVG(Amount)avgGifts, SUM(X1000_Donor__c)total1000, SUM(X500_999_Donor__c)total500, SUM(X250_499_Donor__c)total250, SUM(X100_249_Donor__c)total100, SUM(X50_99_Donor__c)total50, SUM(X25_49_Donor__c)total25, SUM(X1_24_Donor__c)total1 FROM Opportunity WHERE CampaignId = :campaigns.keySet() GROUP BY CampaignId];
        
        Map<Id, Map<String,Object>> resultSet = new Map<Id, Map<String,Object>>();
        for (AggregateResult ar : groupedResults)  {
            Id campaignId = (Id)ar.get('CampaignId');
            Map<String,Object> dataRow = new Map<String, Object> {
                'noOfGifts' => ar.get('noOfGifts'),
                'sumGifts' => ar.get('sumGifts'),
                'avgGifts' => ar.get('avgGifts'),
                'total1000' => ar.get('total1000'),
                'total500' => ar.get('total500'),
                'total250' => ar.get('total250'),
                'total100' => ar.get('total100'),
                'total50' => ar.get('total50'),
                'total25' => ar.get('total25'),
                'total1' => ar.get('total1')
            };
            
            dataRow.putAll(campaigns.get(campaignId).getPopulatedFieldsAsMap());
            resultSet.put(campaignId, dataRow);
        }

        return resultSet;
    }*/
}