import { LightningElement, api, track, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import { createRecord, deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getNotesList from '@salesforce/apex/NotesViewerController.getNotesList';  
import {refreshApex} from '@salesforce/apex';
import NOTE_OBJECT from '@salesforce/schema/Note__c';
import ACCOUNT_FIELD from '@salesforce/schema/Note__c.Account__c';
import DATE_FIELD from '@salesforce/schema/Note__c.Date__c';

export default class NotesViewer extends NavigationMixin(LightningElement) {
    @api recordId;
    @track notes;
    @track error;  

    @wire(getNotesList, {recordId:'$recordId' })
    notes;

    handleViewNoteClick(event) {
        // Navigate to contact record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.currentTarget.dataset.value,
                objectApiName: 'Note__c',
                actionName: 'view',
            },
        });
    }

    handleNewNoteClick(event) {
        const fields = {};
        fields[ACCOUNT_FIELD.fieldApiName] = event.target.value;
        fields[DATE_FIELD.fieldApiName] = new Date();
        const recordInput = { apiName: NOTE_OBJECT.objectApiName, fields };
        createRecord(recordInput)
            .then(note => {
                refreshApex(this.notes);
                
                this[NavigationMixin.Navigate]({
                    type: 'standard__recordPage',
                    attributes: {
                        recordId: note.id,
                        objectApiName: 'Note__c',
                        actionName: 'edit',
                    },
                });
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating a new Note',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }

    handleEditNoteClick(event) {
        // Navigate to contact record page
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: event.target.value,
                objectApiName: 'Note__c',
                actionName: 'edit',
            },
        });
    }

    handleDeleteNoteClick(event) {
        deleteRecord(event.target.value)
            .then(() => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Note deleted',
                        variant: 'success'
                    })
                );

                refreshApex(this.notes);
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error deleting note',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }
    
}