import { LightningElement,wire, track  } from 'lwc';
import getCampaignList from '@salesforce/apex/CampAnalysisController.getCampaignList';
const COLS = [
    { label: 'Appeal Id', fieldName: 'Name' },
    { label: 'List', fieldName: 'Mailing_List__c' },
    { label: 'Select', fieldName: 'List_Select__c' },
    { label: 'Start Date', fieldName: 'StartDate' },
    { label: 'Signer', fieldName: 'Signer__c' },
    { label: 'Carrier Size', fieldName: 'Carrier_Size__c' },
    { label: 'Reply Postage', fieldName: 'Reply_Postage_Type__c' },
    { label: 'Double Sided', fieldName: 'Double_Sided__c' },
    { label: 'Channel', fieldName: 'Channel__c' }
   
];
export default class CampaignAnalysisFilters extends LightningElement {
    @track error;
    @track columns = COLS;
    @track draftValues = [];
    @wire(getCampaignList) campaigns;
}