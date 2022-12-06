({
    handleClick : function(component, event, helper) {
        let AppEvt = $A.get("e.c:LearningAppEvt");
        console.log("Abc "+AppEvt);
       
        AppEvt.setParams({
            message:"Welcome to App Event"

        });
        AppEvt.fire();
}
})
