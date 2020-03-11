public without sharing class CampAnalysisController {
    
    Public final static string  ALL = 'All';
    
    public CampAnalysisController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Campaign> getCampaignListAfterBatchExecute(Campaign selectedFilter) { //String selectedcarrier
       
        String carrierPostage = selectedFilter.Postage_Type__c;
        String carrierSize= selectedFilter.Carrier_Size__c;
        String replyPostage= selectedFilter.Reply_Postage_Type__c;
        String signer= selectedFilter.Signer__c ;
        String channel= selectedFilter.Channel__c;
        String type= selectedFilter.Type;
        //selectedFilter.StartDate!=null? date.valueOf(selectedFilter.StartDate):null;
        string startDate;
        string endDate;
        //Date startDate = selectedFilter.StartDate!=null? date.valueOf(selectedFilter.StartDate):null;
        //Date endDate = selectedFilter.EndDate !=null? date.valueOf(selectedFilter.EndDate):null;
        if(selectedFilter.StartDate!=null){
            string d1 = Datetime.newInstance(date.valueOf(selectedFilter.StartDate).year(), date.valueOf(selectedFilter.StartDate).month(), date.valueOf(selectedFilter.StartDate).day()).format('yyy-MM-dd');
            startDate= d1;
        }
        if(selectedFilter.EndDate!=null){
            String d2 = Datetime.newInstance(date.valueOf(selectedFilter.EndDate).year(), date.valueOf(selectedFilter.EndDate).month(), date.valueOf(selectedFilter.EndDate).day()).format('yyy-MM-dd');
            endDate = d2;
        }
        
        Boolean doubleSided = selectedFilter.Double_Sided__c;
        //String doubleSidedPrinting = filter.doubleSidedPrinting;
        System.debug('dddd'+startDate);
        //Date d = startDate.toStartOfMonth();
        //System.debug('ttttt'+ Datetime.newInstance(startDate.year(), startDate.month(), startDate.day()).format('yyy-MM-dd') );
        String batchQuery = 'Select id from campaign where id!=null ';
        String queryString = 'SELECT Id, Name, Mailing_List__c, List_Select__c, NumberSent, StartDate, Total_Cost_of_Campaign__c, Signer__c, Postage_Type__c, Carrier_Size__c, Reply_Postage_Type__c, Double_Sided__c, Channel__c, Detail_Channel__c,'
        +'Total_Number_of_Donations_Received__c, Donations__c, Response_Rate__c, Average_Gifts__c, In_Out__c, Cost_Per_Piece__c, Net_Cost_Donor__c, X1_000_Donors__c, X500_999_Donors__c, X250_499_Donors__c, X100_249_Donors__c,'
        +' X59_99_Donors__c, X25_49_Donors__c, X1_24_Donors__c'
        +' FROM Campaign  where id!=null ';
    
        String whereClause = '';
        whereClause+=  ' AND Double_Sided__c='+doubleSided; 
        if(carrierPostage !=ALL){
            whereClause+= ' AND Postage_Type__c =\''+carrierPostage+'\'';
        }
        if(carrierSize!=ALL){
            whereClause+= ' AND Carrier_Size__c =\''+carrierSize+'\'';
        }
        if(replyPostage !=ALL){
            whereClause+= ' AND Reply_Postage_Type__c=\''+replyPostage+'\'';
        }
        if(signer !=ALL ){
            whereClause+=  ' AND Signer__c =\''+signer+'\'';
        }
        if(channel !=ALL ){
            whereClause+=  ' AND Channel__c=\''+channel+'\'';
        }
        if(type!=ALL ){
            whereClause+=  ' AND type=\''+type+'\'';
        }
        
        if(startDate!=null  ){
            whereClause+=  ' AND startDate>='+startDate;
        }
        if(EndDate !=null ){
            whereClause+=  ' AND EndDate<='+endDate;
        }
        
        if(whereClause!=''){
            queryString+= whereClause;
           
        }
        return Database.query(queryString);
    }
    @AuraEnabled(cacheable=true)
    public static List<Campaign> getFilteredCampaignList(List<Campaign> campaignsList,string sortValue,string existingDonors,
                                                        string InitialGiftRangeSmaller, string InitialGiftRangeGreater,
                                                        string initialGiftSizeSmaller, string initialGiftSizeGreater,
                                                        boolean estimatedCosts) { //String selectedcarrier
     
       Set<Id> campList = new Set<Id>(); 
       for(Campaign c :campaignsList){
        campList.add(c.Id);
       }
       if(campList.size()>0){
        String queryString = 'SELECT Id, Name, Mailing_List__c, List_Select__c, NumberSent, StartDate, Total_Cost_of_Campaign__c, Signer__c, Postage_Type__c, Carrier_Size__c, Reply_Postage_Type__c, Double_Sided__c, Channel__c, Detail_Channel__c,'
            +'Total_Number_of_Donations_Received__c, Donations__c, Response_Rate__c, Average_Gifts__c, In_Out__c, Cost_Per_Piece__c, Net_Cost_Donor__c, X1_000_Donors__c, X500_999_Donors__c, X250_499_Donors__c, X100_249_Donors__c,'
            +' X59_99_Donors__c, X25_49_Donors__c, X1_24_Donors__c'
            +' FROM Campaign  where id=:campList ';
        
        if(sortValue!=null && sortValue!='None'){
            queryString+= ' ORDER BY ' +sortValue+ ' ASC';
        }
        return Database.query(queryString);
       }
       else
       return null;
    }
    
    @AuraEnabled
    public static List<Campaign> getCampaignList(Campaign selectedFilter, String selectedFilterForOpp, boolean isBatchExecute) { //String selectedcarrier
       
        OppFilters filter = (OppFilters )System.JSON.deserialize(selectedFilterForOpp, OppFilters.class);

        String carrierPostage = selectedFilter.Postage_Type__c;
        String carrierSize= selectedFilter.Carrier_Size__c;
        String replyPostage= selectedFilter.Reply_Postage_Type__c;
        String signer= selectedFilter.Signer__c ;
        String channel= selectedFilter.Channel__c;
        String type= selectedFilter.Type;
        //selectedFilter.StartDate!=null? date.valueOf(selectedFilter.StartDate):null;
        string startDate;
        string endDate;
        //Date startDate = selectedFilter.StartDate!=null? date.valueOf(selectedFilter.StartDate):null;
        //Date endDate = selectedFilter.EndDate !=null? date.valueOf(selectedFilter.EndDate):null;
        if(selectedFilter.StartDate!=null){
            string d1 = Datetime.newInstance(date.valueOf(selectedFilter.StartDate).year(), date.valueOf(selectedFilter.StartDate).month(), date.valueOf(selectedFilter.StartDate).day()).format('yyy-MM-dd');
            startDate= d1;
        }
        if(selectedFilter.EndDate!=null){
            String d2 = Datetime.newInstance(date.valueOf(selectedFilter.EndDate).year(), date.valueOf(selectedFilter.EndDate).month(), date.valueOf(selectedFilter.EndDate).day()).format('yyy-MM-dd');
            endDate = d2;
        }
        
        Boolean doubleSided = selectedFilter.Double_Sided__c;
        //String doubleSidedPrinting = filter.doubleSidedPrinting;
        System.debug('dddd'+startDate);
        //Date d = startDate.toStartOfMonth();
        //System.debug('ttttt'+ Datetime.newInstance(startDate.year(), startDate.month(), startDate.day()).format('yyy-MM-dd') );
        String batchQuery = 'Select id from campaign where id!=null ';
        String queryString = 'SELECT Id, Name, Mailing_List__c, List_Select__c, NumberSent, StartDate, Total_Cost_of_Campaign__c, Signer__c, Postage_Type__c, Carrier_Size__c, Reply_Postage_Type__c, Double_Sided__c, Channel__c, Detail_Channel__c,'
        +'Total_Number_of_Donations_Received__c, Donations__c, Response_Rate__c, Average_Gifts__c, In_Out__c, Cost_Per_Piece__c, Net_Cost_Donor__c, X1_000_Donors__c, X500_999_Donors__c, X250_499_Donors__c, X100_249_Donors__c,'
        +' X59_99_Donors__c, X25_49_Donors__c, X1_24_Donors__c'
        +' FROM Campaign  where id!=null ';
    
        String whereClause = '';
        whereClause+=  ' AND Double_Sided__c='+doubleSided; 
        if(carrierPostage !=ALL){
            whereClause+= ' AND Postage_Type__c =\''+carrierPostage+'\'';
        }
        if(carrierSize!=ALL){
            whereClause+= ' AND Carrier_Size__c =\''+carrierSize+'\'';
        }
        if(replyPostage !=ALL){
            whereClause+= ' AND Reply_Postage_Type__c=\''+replyPostage+'\'';
        }
        if(signer !=ALL ){
            whereClause+=  ' AND Signer__c =\''+signer+'\'';
        }
        if(channel !=ALL ){
            whereClause+=  ' AND Channel__c=\''+channel+'\'';
        }
        if(type!=ALL ){
            whereClause+=  ' AND type=\''+type+'\'';
        }
        
        if(startDate!=null  ){
            whereClause+=  ' AND startDate>='+startDate;
        }
        if(EndDate !=null ){
            whereClause+=  ' AND EndDate<='+endDate;
        }
        
        if(whereClause!=''){
            queryString+= whereClause;
            batchQuery+= whereClause;
            System.debug('whereClause'+whereClause);
        }
        
        if( batchQuery !='' && batchQuery!=null && isBatchExecute){
            BatchCampAnalysis b = new BatchCampAnalysis(batchQuery,filter.appealIdFrom,filter.appealIdTo,filter.appealIdLike);
            Database.executeBatch(b,200);
            return null;    
        }
        else{
            return Database.query(queryString);
        }
    }
    public class OppFilters{
        @AuraEnabled
        Public String appealIdFrom;
        @AuraEnabled
        Public String appealIdTo;
        @AuraEnabled
        Public String  appealIdLike;
    }
    
}