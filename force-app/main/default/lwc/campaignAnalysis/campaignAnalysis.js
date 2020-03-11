import { LightningElement, api,wire,track } from 'lwc';
import getCampaignList from '@salesforce/apex/CampAnalysisController.getCampaignList';
import getFilteredCampaignList from '@salesforce/apex/CampAnalysisController.getFilteredCampaignList';
import getCampaignListAfterBatchExecute from '@salesforce/apex/CampAnalysisController.getCampaignListAfterBatchExecute';
import { subscribe, unsubscribe, onError, setDebugFlag, isEmpEnabled } from 'lightning/empApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import {refreshApex} from '@salesforce/apex';

export default class CampaignAnalysis extends LightningElement {
    
    @track showLoadingSpinner = false;
    tempCarrierPostage = 'All';
    tempCarrierSize = 'All';
    tempReplyPostageType = 'All';
    tempsigner = 'All';
    tempchannel = 'All';
    tempType = 'All';
    
    @track channelName = '/event/Campaign_Analysis_Event__e';

    @api campaigns;
    
    /*@wire(getCampaignListForAll) campaignsVal({error, data}) {
        if (data) {
           this.campaigns = data;
        } else {
            //this.error = error;
        }
    };*/
  
  changeHandler(event) {
    const field = event.target.name;
      if (field === 'carrierPostage') {
        this.tempCarrierPostage =  event.target.value;
      }
      else if(field === 'carrierSize'){
        this.tempCarrierSize =  event.target.value; 
      } 
      else if(field === 'replyPostageType'){
        this.tempReplyPostageType =  event.target.value; 
      } 
      else if(field === 'signer'){
        this.tempsigner =  event.target.value; 
      }
      else if(field === 'channel'){
        this.tempchannel =  event.target.value; 
      } 
      else if(field === 'type'){
        this.tempType =  event.target.value; 
      } 
  }
    
  handleSubscribe() {
      //Callback invoked whenever a new event message is received
      const messageCallback = (response) => {
        this.payload = JSON.stringify(response);
        this.showLoadingSpinner = false;
        //this.dislplayReport(false);

        let arr = { 'sobjectType': 'Campaign' };
        arr.Postage_Type__c  =  this.tempCarrierPostage
        arr.Carrier_Size__c = this.tempCarrierSize;
        arr.Reply_Postage_Type__c = this.tempReplyPostageType;
        arr.Signer__c  = this.tempsigner;
        arr.Channel__c = this.tempchannel;
        arr.Type= this.tempType;
        arr.Double_Sided__c = false;
        
       
        var inp=this.template.querySelectorAll("lightning-input");

          inp.forEach(function(element){
            if(element.name=="AppealStartDate"){
              arr.StartDate=element.value;
            }

            else if(element.name=="AppealEndDate"){
              arr.EndDate=element.value;
            }
          },this);
      
        getCampaignListAfterBatchExecute({
            selectedFilter: JSON.stringify(arr)
        })
        .then(result => {
           alert('next'+result);
            this.campaigns=result;
            if(result!=undefined){
              //alert('length'+result.length);
            }
            else{
              this.showLoadingSpinner = false;
            }
            
            //refreshApex(this.campaigns);
            if(isBatchExecute){
              this.showLoadingSpinner = true;
            }
            else{
              this.showLoadingSpinner = false;
            }
        })
        .catch(error => {
          this.showLoadingSpinner = false;
          // display server exception in toast msg
          const event = new ShowToastEvent({
          title: 'Error',
          variant: 'error',
          message: error.body.message,
        });
        this.dispatchEvent(event);
      
      });

      };
      // Invoke subscribe method of empApi. Pass reference to messageCallback
      subscribe(this.channelName, -1, messageCallback).then(response => {
        //Response contains the subscription information on successful subscribe call
        console.log('Successfully subscribed to : ', JSON.stringify(response.channel));
      });
  }
  handleUnsubscribe() {
    // Invoke unsubscribe method of empApi
    unsubscribe(this.subscription, response => {
        
        //Response is true for successful unsubscribe
    });
  }
  registerErrorListener() {
    // Invoke onError empApi method
    onError(error => {
      this.showLoadingSpinner = false;
        // Error contains the server-side error
    });
  }

  getCampaignsReport(){
    this.dislplayReport(true);
  }
  
  updateSorting(){
    if(this.campaigns!=undefined){
      var sortValue =this.template.querySelector(".sortBy");
      var existingDonors = this.template.querySelector(".includeExistingDonors"); 
      var subtotalBy = this.template.querySelector(".subtotalBy");
      var InitialGiftRangeGreater = this.template.querySelector(".InitialGiftRangeGreater");
      var InitialGiftRangeSmaller = this.template.querySelector(".InitialGiftRangeSmaller");
      var initialGiftSizeSmaller = this.template.querySelector(".initialGiftSizeSmaller");
      var initialGiftSizeGreater = this.template.querySelector(".initialGiftSizeGreater");
      var estimatedCosts = this.template.querySelector(".estimatedCosts");

      getFilteredCampaignList({
        campaignsList: JSON.stringify(this.campaigns),
        sortValue:sortValue.value,
        existingDonors:existingDonors.value,
        subtotalBy:subtotalBy.value,
        InitialGiftRangeSmaller:InitialGiftRangeSmaller.value,
        InitialGiftRangeGreater:InitialGiftRangeGreater.value,
        initialGiftSizeSmaller:initialGiftSizeSmaller.value,
        initialGiftSizeGreater:initialGiftSizeGreater.value,
        estimatedCosts : estimatedCosts.checked
     })
    .then(result => {
        if(result!=null){
          this.campaigns=result;
          refreshApex(this.campaigns);
        }
      })
      .catch(error => {
          this.showLoadingSpinner = false;
          // display server exception in toast msg
          const event = new ShowToastEvent({
          title: 'Error',
          variant: 'error',
          message: error.body.message,
        });
        this.dispatchEvent(event);
      });
    }
    else{
      const event = new ShowToastEvent({
        title: 'Error',
        variant: 'error',
        message: 'Please search the campaigns',
      });
      this.dispatchEvent(event);
    }
  }
  
 
  dislplayReport(isBatchExecute){
      this.showLoadingSpinner = true;
      if(isBatchExecute){
        this.handleSubscribe();
      }
      
      let arr = { 'sobjectType': 'Campaign' };
      arr.Postage_Type__c  =  this.tempCarrierPostage
      arr.Carrier_Size__c = this.tempCarrierSize;
      arr.Reply_Postage_Type__c = this.tempReplyPostageType;
      arr.Signer__c  = this.tempsigner;
      arr.Channel__c = this.tempchannel;
      arr.Type= this.tempType;
      arr.Double_Sided__c = false;
      
      //Opportunity filter object
      let oppFilters = {};
      
      var inp=this.template.querySelectorAll("lightning-input");

        inp.forEach(function(element){
          if(element.name=="AppealStartDate"){
            arr.StartDate=element.value;
          }

          else if(element.name=="AppealEndDate"){
            arr.EndDate=element.value;
          }
          else if(element.name=="AppealIdFrom"){
            oppFilters.appealIdFrom = element.value;
          }
          else if(element.name=="AppealIdTo"){
            oppFilters.appealIdTo = element.value;
          }
          else if(element.name=='AppealIdLike'){
            oppFilters.appealIdLike = element.value;
          }
          else if(element.name == 'doubleSidedPrinting'){
            arr.Double_Sided__c = element.checked;
          } 
        },this);
     
      getCampaignList({
          selectedFilter: JSON.stringify(arr),
          selectedFilterForOpp : JSON.stringify(oppFilters),
          isBatchExecute:isBatchExecute
      })
      .then(result => {
          this.campaigns=result;
          if(result!=undefined){
            //alert('length'+result.length);
          }
          else{
            this.showLoadingSpinner = false;
          }
          
          //refreshApex(this.campaigns);
          if(isBatchExecute){
            this.showLoadingSpinner = true;
          }
          else{
            this.showLoadingSpinner = false;
          }
      })
      .catch(error => {
        this.showLoadingSpinner = false;
        // display server exception in toast msg
        const event = new ShowToastEvent({
        title: 'Error',
        variant: 'error',
        message: error.body.message,
      });
      this.dispatchEvent(event);
     
      });
  }
}