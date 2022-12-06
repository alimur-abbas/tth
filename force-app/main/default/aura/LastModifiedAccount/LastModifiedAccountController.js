({
    doInit : function(component, event, helper) {
        const cols=[
            {label: 'Name', fieldName: 'Show_Account__c', type: 'url', sortable: true,typeAttributes: {label: { fieldName: 'Name' }}},
            {label: 'Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'currency'},
            {label: 'Website', fieldName: 'Website', type: 'url'},
            {label: 'Type', fieldName: 'Type', type: 'Picklist'},
            {label: 'Rating', fieldName: 'Rating', type: 'Picklist'}
        ];
        component.set("v.columns", cols);
        helper.fetchaccountData(component);
    },
    navigateToSObjectRecord : function(component, event, helper) {
        alert('navigateToSObjectRecord');
        var selectedRows = event.getParam('selectedRows');
        alert(JSON.stringify(selectedRows));
        if(selectedRows.length > 1){
            //logic for error message
        }
        var navEvt = $A.get("e.force:navigateToSObject");
        navEvt.setParams({
          "recordId": selectedRows[0].ID,
        });
        console.log(selectedRows[0].ID);
        navEvt.fire();
    }
})