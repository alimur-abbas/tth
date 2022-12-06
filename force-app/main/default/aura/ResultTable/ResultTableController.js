({
    doInit : function(component, event, helper) {
        const cols=[
            {label: 'Game Number', fieldName: 'Name', type: 'text'},
            {label: 'Game Mode', fieldName: 'Mode__c', type: 'text'},
            {label: 'Played On', fieldName: 'CreatedDate', type: 'date'},
            {label: 'Result', fieldName: 'Result__c', type: 'text'}
        ];
        component.set("v.columns", cols);
        helper.fetchResult(component);

    },
    ResultEventHandler: function(component, event, helper) {
        helper.fetchResult(component);
    }
})