import { LightningElement,wire, track  } from 'lwc';
import getCampaignList from '@salesforce/apex/CampaignAnalysisController.getCampaignList';

export default class CampaignAnalysisFilters extends LightningElement {
    @track error;
    @track draftValues = [];
    @track campaigns;

    @wire(getCampaignList) campaigns;
}