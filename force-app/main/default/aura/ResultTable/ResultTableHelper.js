({
    fetchResult : function( component) {
        var action = component.get("c.getGameResults");
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                component.set("v.data", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})