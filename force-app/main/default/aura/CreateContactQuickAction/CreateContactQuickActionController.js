({
    callCreateContact : function(component, event, helper) {
        var action = component.get("c.createContact");
        console.log('recordId'+component.get("v.recordId"));
        console.log('firstName'+component.get("v.firstName"));
        console.log('lastName'+component.get("v.lastName"));
        action.setParams({
            "firstName" : component.get("v.firstName"),
            "lastName" : component.get("v.lastName"),
            "email" : component.get("v.Email"),
            "phone" : component.get("v.Phone"),
            "accountId" : component.get("v.recordId")
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "The record has been created successfully.",
                    "type":"Success"
                });
                toastEvent.fire();
                $A.get('e.force:refreshView').fire();
                $A.get("e.force:closeQuickAction").fire();
                var navEvt = $A.get("e.force:navigateToSObject");
                navEvt.setParams({
                "recordId": response.getReturnValue(),
                "slideDevName": "related"
                });
                navEvt.fire();
            }
        });
        $A.enqueueAction(action);
    }

    
})
