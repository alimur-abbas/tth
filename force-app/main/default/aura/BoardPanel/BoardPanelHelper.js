({
    addResultRecord : function(component,gameResult) {
        var action = component.get("c.addResult");
        // if(action===undefined){
        // console.log("Action: "+action);
        // }
        const mode = component.get("v.selectedMode").toUpperCase();
        // console.log("Mode: "+mode);
        action.setParams({mode:mode,result:gameResult});
        action.setCallback(this,function(response){
            if(response.getState()==='SUCCESS'){
                console.log('Record inserted successfully');
            }else{
                console.error('Error while inserting record');
            }
        });
        $A.enqueueAction(action);
        // call back function is called before backend call because the flow is asynchronous and 
        //the call back will only execute after the response is received from the server.
        //and if you call backend method without defining a call back, then your method will never know what it
            //has to do once we get the response from server.
            //So, that's the reason you need to define the call back first and then call your method.
    }
})