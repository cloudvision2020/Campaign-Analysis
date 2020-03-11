@isTest
public class CampAnalysisControllerTest {
    @isTest static void CampAnalysis(){
        Account acc=new Account();
        acc.name='TestAccount';
        insert acc;
        
        Campaign camp=new Campaign();
        camp.Name='TestCampaign';
        camp.Campaign_ID__c='Campaign001';
        camp.LI_Description__c='This is a new Campaign';
        camp.Postage_Type__c='TestPostage';
        camp.Carrier_Size__c='200';
        camp.Reply_Postage_Type__c='TestReply';
        camp.Signer__c='TestSinger';
        camp.Channel__c='Mail';
        camp.StartDate=system.today();
        camp.EndDate=system.today();
        camp.Double_Sided__c=True;
        camp.Type='Conference';
        insert camp;
        
        Opportunity opp=new Opportunity();
        opp.AccountId=acc.Id;
        opp.Name='TestOpportunity';
        opp.CloseDate=system.today();
        opp.StageName='Posted';
        opp.campaignId = camp.Id;
        insert opp;
        
        CampAnalysisController.OppFilters oppfill=new CampAnalysisController.OppFilters();
        oppfill.appealIdFrom='IdFrom001';
        oppfill.appealIdTo='IdTo001';
        oppfill.appealIdLike='%Test%';
        
        String filter=JSON.serialize(oppfill);
        CampAnalysisController.getCampaignList(camp,filter,true);
        CampAnalysisController.getFilteredCampaignList(new list<Campaign>{camp},'In_Out__c','Yes','50','25','50','25',True);
    }
}