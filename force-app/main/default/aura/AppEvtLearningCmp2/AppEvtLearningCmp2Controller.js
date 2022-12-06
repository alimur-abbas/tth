({
    handleEvent : function(component, event, helper) {
        console.log('handleEvent');
        var msg = event.getParam("message");
        component.set("v.Greeting", msg);

    }
})
