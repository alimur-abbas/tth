({
    startGame : function(component, event, helper) {
        var gameModeComboBox = component.find("gameModes");
        var selectedValue = gameModeComboBox.get("v.value");
        //console.log("Game Mode: "+gameMode);
        let selectedMode = component.get("v.selectedMode");
       // console.log("Selected Mode: "+selectedMode);//undefined
        component.set("v.selectedMode", selectedValue);
        //console.log("Selected Mode after set: "+component.get("v.selectedMode"));//inProgress

        if (selectedMode) {
            const boardComp = component.find("boardComp");
            // call aura method
            boardComp.startGame();
        }
        
        
       
        // var Name = component.get("v.playerName");//directly assigning the value from attribute to variable
        // console.log('gameModdeValue: ' + gameMode);
        // alert('gameModdeValue: ' + gameMode);
        // alert('gameModdeValue: ' + gameModeValue);
        // alert('Name: ' + Name);
    },
    reshuffleBoard : function(component, event, helper) {
        const boardComponent = component.find("boardComp");
        boardComponent.reshuffle();
        component.set("v.isDisable", true);
    },
    ResultEventHandler : function(component, event, helper) {
        let result = event.getParam("result");
        console.log(result);
        if(result === "Win"){
            component.set("v.isDisable", true);
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Hurray!!",
                "message": "You Have Won The Game.",
                "type": "Success"
            });
            toastEvent.fire();
    }
    else{
            component.set("v.isDisable", false);
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Sorry!!",
                "message": "You Have Lose The Game. Better Luck Next Time.",
                "type": "Error"
            });
            toastEvent.fire();
        }
    helper.addResultRecord(component, result);
},
    enableStartButton: function(component, event, helper) {
        component.set("v.isDisableStart", false);
    }
})