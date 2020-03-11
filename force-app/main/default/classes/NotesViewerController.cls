public with sharing class NotesViewerController {
    
    @AuraEnabled(cacheable = true)  
    public static List<Note__c> getNotesList(String recordId) {  
        return [SELECT Id, Name, Notes__c, Subject__c, Date__c, Created_By__c FROM Note__c WHERE Account__c = :recordId Order By Date__c desc];  
    }  
}