({
    doInit : function(component, event, helper) {
       
        var cols=[
            {label: 'First Name', fieldName: 'FirstName', type: 'text'},
            {label: 'Last Name', fieldName: 'LastName', type: 'text'},
            {label: 'Email', fieldName: 'Email', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', type: 'text'},
            {label: 'Action',type: 'button',typeAttributes: {label: 'Show Detail Button', name: 'view', title: 'View', disabled: false, value: 'view', iconPosition: 'left'}}
            
        ];
        component.set("v.columns", cols);
        helper.fetchContactData(component);
    },
    handleRowAction : function(component, event, helper) {
        var row = event.getParam('row');
        alert(row.Id);
    }
})
